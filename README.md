    A utility for replacing the PS1 in the terminal shell for visibility on narrow terminals and showing
    some relevant information. If the number of characters in the shell prompt exceeds a threshold, then
    a newline is added to the PS1 text so that the command line is given more space. The user can change
    the threshold.

    Information:
        While in git directory, there will be an icon above the shell prompt indicating the git status
            rebase                  |   ⤴
            merge                   |   ⤣
            cherry pick             |   ⟳
            branch                  |   ⎇
            staged changes          |   ✚
            unstaged changes        |   ●
            untracked changes       |   ?
            conflicts               |   ✗


        In addition, there will be status text above the shell prompt while certain conditions are true
            [Network]               |   ip link does not detect a connection
            [SSH]                   |   a shell session is active
            [Docker]                |   docker is active

    Usage:
        The colour of the shell prompt can be customized with the following commands
            shade colour <colour>   |   set the shall prompt colour
            shade threshold <int>   |   set how many characters until command is on a new line
            shade bold <on|off>     |   whether the host@name is very slightly bold
            shade reset             |   restore defaults
    
    For the changes to take effect, the following line needs to be present in the ~/.bashrc file:
        source ~/shade/prompt
