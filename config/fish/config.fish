if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    # Aliases
    # alias automatically appends $argv, so that all parameters used with the alias are passed to the actual command.
    
    # Git
    alias gp 'git push'
    alias gcom 'git add . ; git commit'
    alias gst 'git status'
    alias gcl 'git clone'

    # X11 settings
    alias noblackscreen 'xset s off; xset -dpms; xset s noblank'

    # Terminal
    alias .. 'cd ..'
    alias ... 'cd ../..'
    alias ls 'exa'
    alias l 'exa -l'
    alias la 'exa -la'
    alias lr 'exa -lR'
    alias ra 'ranger'
    alias cat 'bat'

    # Systemctl
    alias sc 'sudo systemctl'

   # Neovide
   alias nv 'neovide --multigrid'

   # Move file to trash
   function t
    if ! test -d ~/Trash
        mkdir ~/Trash
    end
    mv "$argv" ~/Trash
   end 

   # Key binds
   bind \cp 'cmus'
   
   # Update PATH
   fish_add_path ~/.cargo/bin

    # Init starship prompt (must be last)
    starship init fish | source
end
