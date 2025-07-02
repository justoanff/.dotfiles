# Initialize Oh My Posh with the Montys theme
# This creates a beautiful, informative prompt with git status, execution time, and more
& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\montys.omp.json" --print) -join "`n")) | Invoke-Expression

#-----------------------------------------------------------------------
# File Explorer Enhancements
#-----------------------------------------------------------------------

# Remove the default 'ls' alias which points to Get-ChildItem
Remove-Item alias:ls -Force

# Create a new function for our custom ls command using eza
# -a: show hidden files
# -l: long format with details
# --group-directories-first: show directories before files
# --icons: show file type icons
function ls {
    eza -al --group-directories-first --icons $args
}

#-----------------------------------------------------------------------
# Directory Navigation with Zoxide
#-----------------------------------------------------------------------

# Initialize zoxide for smart directory navigation
# This enables the 'z' command for jumping to frequently used directories
Invoke-Expression (& { (zoxide init powershell) -join "`n" })

# Remove the built-in 'cd' alias to replace it with smarter navigation
Remove-Item alias:cd -Force

# Custom 'cd' function that uses zoxide's smart navigation
# - When used with arguments: uses zoxide to jump to directories intelligently
# - When used without arguments: goes to home directory
function cd {
    if ($args.Count) {
        # If there are arguments (e.g., "cd my-folder"), use zoxide's smart navigation
        z @args
    } else {
        # If 'cd' is run with no arguments, go to the user's home directory
        z ~
    }
}

