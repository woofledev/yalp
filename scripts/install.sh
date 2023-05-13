#!/bin/sh
INSTALLDIR="$HOME/.yalp"
mkdir -p "$INSTALLDIR"
cd "$INSTALLDIR"

echo downloading to $INSTALLDIR
curl -# https://raw.githubusercontent.com/woofledev/yalp/main/yalp --output "$INSTALLDIR/yalp"
chmod +x "$INSTALLDIR/yalp"

echo adding to path
if command -v grep >/dev/null 2>&1 && ! echo $PATH | grep -q "$INSTALLDIR"; then
    if [ -n "$BASH_VERSION" ]; then
        echo "export PATH=\"\$PATH:$INSTALLDIR\"" >> "$HOME/.bashrc"
        export PATH="$PATH:$INSTALLDIR"
    elif [ -n "$ZSH_VERSION" ]; then
        echo "export PATH=\"\$PATH:$INSTALLDIR\"" >> "$HOME/.zshrc"
        export PATH="$PATH:$INSTALLDIR"
    fi
fi

printf "\nfinished! try sourcing/restarting your shell and running 'yalp' in your terminal.\n"
printf "if you ever need to configure the variables, edit the "$INSTALLDIR/yalp" file to find user settings.\n"