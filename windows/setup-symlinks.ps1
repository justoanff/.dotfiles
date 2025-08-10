<#
 .SYNOPSIS
   Create symbolic links from this dotfiles repository into standard Windows locations.

 .DESCRIPTION
   This script links selected configuration folders/files under the repository's `windows/` tree
   into your user profile (e.g., $Env:LOCALAPPDATA, $Env:USERPROFILE\Documents, etc.).

   It is safe to re-run. Existing links are replaced. Existing real files/folders are backed up
   by renaming to `<name>.backup-<timestamp>` unless -Force is specified, in which case they are removed.

 .PARAMETER DryRun
   If specified, only prints the operations without making changes.

 .PARAMETER Force
   If specified, existing targets are removed instead of being backed up.

 .NOTES
   - Creating symbolic links may require Administrator privileges OR Windows Developer Mode enabled.
   - Run in PowerShell 7+ for best compatibility.
#>
param(
  [switch]$DryRun,
  [switch]$Force
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$script:Force = $Force

function Write-Info([string]$message) { Write-Host "[INFO] $message" -ForegroundColor Cyan }
function Write-Warn([string]$message) { Write-Host "[WARN] $message" -ForegroundColor Yellow }
function Write-Act([string]$message)  { Write-Host "[ACT ] $message" -ForegroundColor Green }

function Test-Admin {
  try {
    $currentIdentity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal]::new($currentIdentity)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
  } catch { return $false }
}

function Invoke-LinkAction { param([scriptblock]$Action) if ($DryRun) { return } & $Action }

$scriptRoot   = Split-Path -Parent $MyInvocation.MyCommand.Path   # .../.dotfiles/windows
$repoRoot     = Split-Path -Parent $scriptRoot                     # .../.dotfiles
$windowsRoot  = Join-Path $repoRoot 'windows'

Write-Info "Repository root: $repoRoot"

$mappings = @(
  @{ Source = Join-Path $windowsRoot 'AppData/Local/nvim'; Target = Join-Path $Env:LOCALAPPDATA 'nvim'; Type = 'Directory' },
  @{ Source = Join-Path $windowsRoot 'Documents/PowerShell/Microsoft.PowerShell_profile.ps1'; Target = Join-Path $Env:USERPROFILE 'Documents/PowerShell/Microsoft.PowerShell_profile.ps1'; Type = 'File' },
  @{ Source = Join-Path $windowsRoot 'Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1'; Target = Join-Path $Env:USERPROFILE 'Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1'; Type = 'File' },
  @{ Source = Join-Path $windowsRoot '.config'; Target = Join-Path $Env:USERPROFILE '.config'; Type = 'Directory' }
)

if (-not (Test-Admin)) {
  Write-Warn "Not running as Administrator. Ensure Windows Developer Mode is enabled, otherwise creating symlinks may fail."
}

foreach ($m in $mappings) {
  if (-not (Test-Path -LiteralPath $m.Source)) {
    Write-Warn "Skip: Source not found -> $($m.Source)"
    continue
  }
  Write-Info "Linking: `n  Target: $($m.Target)`n  Source: $($m.Source)"
  $linkPath   = $m.Target
  $targetPath = $m.Source

  $linkParent = Split-Path -Parent $linkPath
  if (-not (Test-Path -LiteralPath $linkParent)) {
    if ($DryRun) { Write-Act "mkdir $linkParent" } else { New-Item -ItemType Directory -Path $linkParent -Force | Out-Null }
  }

  if (Test-Path -LiteralPath $linkPath) {
    $item = Get-Item -LiteralPath $linkPath -Force
    if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) {
      if ($DryRun) { Write-Act "Remove-Item -Force $linkPath (existing link)" } else { Remove-Item -LiteralPath $linkPath -Force }
    } else {
      if ($script:Force) {
        if ($DryRun) { Write-Act "Remove-Item -Recurse -Force $linkPath" } else { Remove-Item -LiteralPath $linkPath -Recurse -Force }
      } else {
        $timestamp = Get-Date -Format 'yyyyMMdd-HHmmss'
        $backupPath = "$linkPath.backup-$timestamp"
        if ($DryRun) { Write-Act "Rename-Item $linkPath -> $backupPath" } else { Rename-Item -LiteralPath $linkPath -NewName (Split-Path -Leaf $backupPath) }
      }
    }
  }

  if ($DryRun) {
    Write-Act "ln -s '$targetPath' '$linkPath'"
  } else {
    try { New-Item -ItemType SymbolicLink -Path $linkPath -Target $targetPath | Out-Null }
    catch { New-Item -ItemType SymbolicLink -Path $linkPath -Value  $targetPath | Out-Null }
  }
}

Write-Host "Done." -ForegroundColor Green


