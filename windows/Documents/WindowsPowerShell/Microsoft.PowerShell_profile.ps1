& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\montys.omp.json" --print) -join "`n"))'C:/Users/Posh/jandedobbeleer.omp.json' | Invoke-Expression
# Remove the default 'ls' alias which points to Get-ChildItem
Remove-Item alias:ls -Force

# Create a new function for our custom ls command.
# Using a function is better than an alias for commands with arguments.
function ls {
    eza -al --group-directories-first --icons $args
}

# -----------------------------------------------------------------
# This should already be in your profile from the zoxide setup
Invoke-Expression (& { (zoxide init powershell) -join "`n" })
# -----------------------------------------------------------------

Remove-Item alias:cd -Force
# Custom 'cd' function to override the built-in alias.
# This function uses 'z' for navigation.
function cd {
    if ($args.Count) {
        # If there are arguments (e.g., "cd my-folder"), pass them to zoxide's 'z' command.
        z @args
    } else {
        # If 'cd' is run with no arguments, go to the user's home directory.
        z ~
    }
}

