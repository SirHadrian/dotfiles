if status is-interactive
        # Commands to run in interactive sessions can go here
        # set fish_greeting
        set fish_greeting

        set -gx EDITOR nvim

        # Vi mode
        fish_vi_key_bindings
        # Emacs mode
        # fish_default_key_bindings

        # ========================================================================================

        # ALIASES
        # alias automatically appends $argv, so that all parameters used with the alias are passed to the actual command.

        # Git
        alias gs 'git status'
        alias gcl 'git clone'
        alias gl 'git log --oneline --decorate --graph'
        alias gp 'git push'
        alias gd 'git diff'
        alias ga 'git add .'
        alias gco 'git commit'
        alias gb 'git branch'
        alias gc 'git checkout'

        # Tmux
        alias ta 'tmux attach'

        # X11 settings
        alias noblackscreen 'xset s off; xset -dpms'
        alias screenoff 'sleep 2; xset dpms force off'
        alias sx 'startx ~/.xinitrc'

        # HDMI monitor
        # alias start-HDMI 'xrandr --output HDMI-1-0 --mode 1366x768 --auto --right-of eDP-1 && sleep 2 && leftwm command SoftReload'
        # alias stop-HDMI 'xrandr --output HDMI-1-0 --off && sleep 2 && leftwm command SoftReload'

        # Terminal
        alias .. 'cd ..'
        alias ... 'cd ../..'
        alias ls 'exa'
        alias l 'exa -l'
        alias la 'exa -la'
        alias lr 'exa -lR'
        alias r 'ranger'
        alias cat 'bat'
        alias j 'jobs'
        alias jj 'kill (jobs -p); commandline -f repaint'

        # Sudo
        alias sc 'sudo systemctl'
        alias sp 'sudo pacman'

        # Neovide
        alias v 'neovide --maximized'
        alias vv 'neovide --maximized .'
        # Neovim
        alias n 'nvim'
        alias nn 'nvim .'

        # Animated background
        alias animvid-gpu 'xwinwrap -g 1920x1080 -ov -ni -s -nf -un -fs -b -- mpv --hwdec=vdpau --vo=gpu --gpu-context=x11 -wid WID --loop --no-border --no-config --no-window-dragging --no-input-default-bindings --no-osd-bar --no-sub --no-audio'

        # Trash
        alias t 'trashy'
        alias tl 'trashy list'
        alias te 'trashy empty'
        alias ts 'trashy size'
        alias tre 'trashy restore'

        # Brightness
        function kl --description "Keyboard led control"
                if test -z $argv
                        set -f led (brightnessctl --device="platform::kbd_backlight" get)
                        if test $led = "1"
                                brightnessctl --device="platform::kbd_backlight" set 0
                        else
                                brightnessctl --device="platform::kbd_backlight" set 1
                        end
                else if test $argv = "1"
                        brightnessctl --device="platform::kbd_backlight" set 1
                else if test $argv = "0"
                        brightnessctl --device="platform::kbd_backlight" set 0
                end
        end

        function br --description "Set brightness"
                if test -z $argv
                        brightnessctl info | grep "Current brightness" | cut -d' ' -f 4
                else
                        brightnessctl set $argv%
                end
        end

        # Bluetoothctl
        function bl --description "Bluetooth control"
                if test -z $argv
                        bluetoothctl show
                else if test $argv = "d"
                        bluetoothctl disconnect
                else if test $argv = "c"
                        bluetoothctl connect 00:18:09:FE:CC:7F
                else if test $argv = "s"
                        bluetoothctl show
                else if test $argv = "1"
                        if test (rfkill --output DEVICE,SOFT | grep "hci0" | awk '{print $2}') = "blocked"
                                rfkill unblock bluetooth
                        else
                                bluetoothctl power on
                        end
                else if test $argv = "0"
                        bluetoothctl power off
                end
        end

        # ========================================================================================

        # function prime-run --description "Run program using the nvidia GPU"
        #     __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only $argv
        # end

        function xc --description "Pipe to clipboard"
                xclip -selection c
        end

        function rs --description "Run a program in the background silently"
                $argv &>/dev/null &
        end

        function makedir --description "Make a new directory and cd into it"
                mkdir -p "$argv" && cd "$argv"
        end

        function extract --description "Extract archives"
                if test -f "$argv"
                        switch "$argv"
                                case "*.tar.gz"
                                        tar -xzvf "$argv"
                                case "*.tar.xz"
                                        tar -xJvf "$argv"
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

        function hi --description "Search history file for a command"
                history | fzf --no-sort --exact --no-mouse | read -l result

                if test $result
                        commandline -rb $result
                end
        end

        function ra --description "Ranger change dir"
                set tempfile '/tmp/chosendir'
                ranger --choosedir=$tempfile (pwd)

                if test -f $tempfile
                        if [ (cat $tempfile) != (pwd) ]
                                cd (cat $tempfile)
                        end
                end

                rm -f $tempfile
        end

        # Zathura
        function za --description "Open documents with zathura and fzf"
                zathura ( find ~/Documents/Library/ -type f | fzf ) &>/dev/null &
        end

        # Nvidia proprietary drivers
        # function shutdown --description "Manually unload the nvidia proprietary drivers and shutdown"
        #         sudo modprobe -r nvidia_uvm nvidia_drm nvidia_modeset nvidia && sleep 2 && sudo systemctl poweroff
        # end
        #
        # function restart --description "Manually unload the nvidia proprietary drivers and reboot"
        #         sudo modprobe -r nvidia_uvm nvidia_drm nvidia_modeset nvidia && sleep 2 && sudo systemctl reboot
        # end

        # ========================================================================================

        # KEYBINDINGS

        bind --mode insert \ep 'pulsemixer; commandline -f repaint'
        bind --mode insert \em 'cmus; commandline -f repaint'
        bind --mode insert \er 'ranger; commandline -f repaint'
        bind --mode insert \ee 'nvim .; commandline -f repaint'
        bind --mode insert \et 'tmux new-session -A -s "MAINFRAME"; commandline -f repaint'
        bind --mode insert --sets-mode default kj 'commandline -f repaint'
        bind --mode insert --sets-mode default kk 'commandline -f repaint'
        # bind --mode insert --sets-mode default jj 'commandline -f repaint'

        bind --mode insert \cf accept-autosuggestion

        # ========================================================================================

        # Update PATH
        fish_add_path ~/.cargo/bin ~/.ghcup/bin /var/lib/flatpak/exports/bin

        # Init zoxide (cd)
        zoxide init fish | source
        # Init starship prompt (must be last)
        starship init fish | source

end
