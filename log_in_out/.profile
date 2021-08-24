
wal -Rn  > /dev/null 2>&1


if [[ $(findmnt /data) ]]; then
    echo "NAS is already mounted"
else
    sleep 1
    sshfs ylan@home.ym:/data /remote -o allow_other,reconnect
    sleep 1
fi

# TODO: don't try if $DE$i does not exist
if tty  | grep -q 'tty'; then
   export i=$(echo $(tty) | awk '{print substr($0,length,1)}')
   export WM=$DE$i
   echo $WM
   startx
fi
