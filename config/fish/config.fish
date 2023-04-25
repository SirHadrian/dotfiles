if status is-interactive
    # Commands to run in interactive sessions can go here
    # set fish_greeting

    set fish_greeting
    
    # Aliases
    # alias automatically appends $argv, so that all parameters used with the alias are passed to the actual command.
    
    # Git
    alias gp 'git push'
    alias gcom 'git add . && git commit'
    alias gst 'git status'
    alias gcl 'git clone'
    alias glog 'git log --oneline --decorate --graph'

    # X11 settings
    alias noblackscreen 'xset s off; xset -dpms; xset s noblank'

    # HDMI monitor
    alias start-HDMI 'xrandr --output HDMI-1-0 --mode 1366x768 --auto --right-of eDP-1 && sleep 2 && leftwm command SoftReload'
    alias stop-HDMI 'xrandr --output HDMI-1-0 --off && sleep 2 && leftwm command SoftReload'

    # Terminal
    alias .. 'cd ..'
    alias ... 'cd ../..'
    alias ls 'exa'
    alias l 'exa -l'
    alias la 'exa -la'
    alias lr 'exa -lR'
    alias ra 'ranger'
    alias cat 'bat'
    alias f 'xdg-open (fzf) &> /dev/null'

    # Systemctl
    alias sc 'sudo systemctl'

   # Neovide
   alias nv 'neovide --multigrid'

   # Nvidia optimus
   function prime-run
       __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only $argv &> /dev/null &
   end

   # Move file to trash
   function t
    if ! test -d ~/Trash
        mkdir ~/Trash
    end
    mv "$argv" ~/Trash
   end 

   # Run job silently
   function p
       $argv &> /dev/null &
   end
   
   function makedir
       mkdir -p "$argv" && cd "$argv"
   end

   function extract
       if test -f "$argv"
           switch "$argv"
               case "*.tar.gz"
                   tar -xzvf "$argv"
               case "*.bz2"
                   bunzip2 "$argv"
               case "*.rar"
                   unrar x "$argv"
               case "*.tar"
                   tar -xvf "$argv"
               case "*.tbz2"
                   tar -xjvf "$argv"
               case "*.tgz" 
                   tar -xzvf "$argv"
               case "*.zip"
                   unzip "$argv"
               case "*.Z"
                   uncompress "$argv"
               case "*.7z"
                   7z x "$argv"
               case "*"
                   printf "%s" "Unrecognized file extension"
           end
       else
           printf "%s" "The file does not exist"
       end
   end

   # Key binds
   bind \cp 'cmus'
   bind \ch 'htop'
   bind \cf 'xdg-open (fzf) &> /dev/null'  # file search

   # Update PATH
   fish_add_path ~/.cargo/bin

   # Init starship prompt (must be last)
   starship init fish | source
end
