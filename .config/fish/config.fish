if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx fish_greeting ''

fish_add_path -m ~/.local/bin 
fish_add_path -m ~/.local/share/nvim/mason/bin

starship init fish | source
zoxide init fish | source

# pnpm
set -gx PNPM_HOME "/Users/danlevin/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

set -gx PATH "$HOME/.cargo/bin" $PATH;
set -gx PATH "$HOME/projects/istio/istio-1.17.1/bin" $PATH;


alias dotfiles="/usr/local/bin/git --git-dir=$HOME/.dotfiles/.git/ --work-tree=$HOME"
