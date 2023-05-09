#!/bin/sh
INSTALLDIR="$HOME/.yalp"
mkdir -p "$INSTALLDIR"
cd "$INSTALLDIR"

echo downloading to $INSTALLDIR
curl -# https://raw.githubusercontent.com/woofledev/yalp/main/yalp --output "$INSTALLDIR/yalp"
chmod +x "$INSTALLDIR/yalp"

echo adding to path
export PATH="$PATH:$INSTALLDIR"
if ! echo $PATH | grep -q "$INSTALLDIR"; then
    if [ -n "$BASH_VERSION" ]; then
        echo "export PATH=\"\$PATH:$INSTALLDIR\"" >> "$HOME/.bashrc"
    elif [ -n "$ZSH_VERSION" ]; then
        echo "export PATH=\"\$PATH:$INSTALLDIR\"" >> "$HOME/.zshrc"
    fi
fi

printf "\nfinished! try sourcing/restarting your shell and running 'yalp' in your terminal.\n"
printf "if you ever need to configure the variables, edit the "$INSTALLDIR/yalp" file to find user settings.\n"