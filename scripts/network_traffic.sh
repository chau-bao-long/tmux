#! /bin/bash

function getBytes {
    netstat -w1 > $HOME/.tmux/network.out & sleep 1.5; kill $!;
}

eYTES=$(getBytes > /dev/null);
BYTES=$(cat $HOME/.tmux/network.out | grep '[0-9].*');
DOWN=$(echo $BYTES | awk '{print $3 / 1024}');
UP=$(echo $BYTES | awk '{print $6 / 1024}');

printf "📥 %.2fmb  📤 %.2fmb" $DOWN $UP
