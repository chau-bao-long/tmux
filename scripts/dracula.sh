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

  # set refresh interval
  tmux set-option -g status-interval 5

  # set clock
  tmux set-option -g clock-mode-style 12

  # set length 
  tmux set-option -g status-left-length 100
  tmux set-option -g status-right-length 120

  # pane border styling
  tmux set-option -g pane-active-border-style "fg=${dark_purple}"
  tmux set-option -g pane-border-style "fg=${gray}"

  # message styling
  tmux set-option -g message-style "bg=${gray},fg=${white}"

  # status bar
  tmux set-option -g status-style "bg=${gray},fg=${white}"

  tmux set-option -g status-left "#[bg=${green},fg=${dark_gray}]#{?client_prefix,#[bg=${yellow}],} ☺ " 

  tmux set-option -g  status-right "#[bg=${dark_gray},fg=${pink}] #($current_dir/cpu.sh) "
  tmux set-option -ga status-right "#[bg=${dark_gray},fg=${green}] #($current_dir/vpn_status.sh) "
  tmux set-option -ga status-right "#[bg=${dark_gray},fg=${yellow}]#($current_dir/volume.sh) "
  tmux set-option -ga status-right "#[bg=${dark_gray},fg=${cyan}]#($current_dir/network.sh) "
  tmux set-option -ga status-right "#[bg=${dark_gray},fg=${red}] #($current_dir/input_source_script.sh) "
  tmux set-option -ga status-right "#[bg=${dark_gray},fg=${orange}] #($current_dir/battery.sh) "
  tmux set-option -ga status-right "#[bg=${dark_gray},fg=${light_purple}] %a %m/%d %I:%M %p #(date +%)"
  
  # window tabs 
  tmux set-window-option -g window-status-current-format "#[fg=${white},bg=${dark_purple}] #I #W "
  tmux set-window-option -g window-status-format "#[fg=${white}]#[bg=${gray}] #I #W "
}

# run main function
main
