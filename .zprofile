emulate sh -c 'source /etc/profile'

# Autostart X at login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ];
then
    exec startx
fi
