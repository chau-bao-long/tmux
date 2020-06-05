#!/usr/bin/env bash

# a tmux color scheme inspired by dracula
# author: Dane Williams

get_tmux_option() {
  local option=$1
  local default_value=$2
  local option_value=$(tmux show-option -gqv "$option")
  if [ -z $option_value ]; then
    echo $default_value
  else
    echo $option_value
  fi
}

main()
{
  # set current directory variable
  current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  # Dracula Color Pallette
  white='#f8f8f2'
  gray='#44475a'
  dark_gray='#282a36'
  light_purple='#bd93f9'
  dark_purple='#6272a4'
  cyan='#8be9fd'
  green='#50fa7b'
  orange='#ffb86c'
  red='#ff5555'
  pink='#ff79c6'
  yellow='#f1fa8c'
  black='#000000'
  light_orange='#E59D55'

  # set refresh interval
  tmux set-option -g status-interval 5

  # set clock
  tmux set-option -g clock-mode-style 12

  # set length 
  tmux set-option -g status-left-length 100
  tmux set-option -g status-right-length 150

  # pane border styling
  tmux set-option -g pane-active-border-style "fg=${green}"
  tmux set-option -g pane-border-style "fg=${dark_gray}"

  # message styling
  tmux set-option -g message-style "bg=${dark_gray},fg=${white}"

  # status bar
  tmux set-option -g status-style "bg=${dark_gray},fg=${white}"

  tmux set-option -g status-left "#[bg=${green},fg=${dark_gray}]#{?client_prefix,#[bg=${yellow}],} ☺ " 

  tmux set-option -g  status-right "#[bg=${black},fg=${pink}] #($current_dir/cpu.sh) "
  tmux set-option -ga status-right "#[bg=${black},fg=${green}] #($current_dir/vpn_status.sh) "
  tmux set-option -ga status-right "#[bg=${black},fg=${yellow}]#($current_dir/volume.sh) "
  tmux set-option -ga status-right "#[bg=${black},fg=${cyan}]#($current_dir/network.sh) "
  tmux set-option -ga status-right "#[bg=${black},fg=${red}] #($current_dir/input_source_script.sh) "
  tmux set-option -ga status-right "#[bg=${black},fg=${orange}] #($current_dir/network_traffic.sh) "
  tmux set-option -ga status-right "#[bg=${black},fg=${light_purple}] #($current_dir/hd_script.sh)"
  
  # window tabs 
  tmux set-window-option -g window-status-current-format "#[fg=${black},bg=${light_orange}] #I #W "
  tmux set-window-option -g window-status-format "#[fg=${white}]#[bg=${dark_gray}] #I #W "
}

# run main function
main
