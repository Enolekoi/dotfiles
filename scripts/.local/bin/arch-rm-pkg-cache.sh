#!/bin/sh

echo "----------------------------------------------"
echo "Remove Pacman cache:"
echo "'paccache -rk0'"
echo "----------------------------------------------"
echo ""
echo ""
paccache -rk0 &&
echo ""
echo ""
echo "----------------------------------------------"
echo "Remove Paru cache:"
echo "'paru -Sccd'"
echo "----------------------------------------------"
echo ""
echo ""
paru -Sccd &&
echo ""
echo ""
echo "----------------------------------------------"
echo "Remove Yay cache:"
echo "'yay -Sc'"
echo "----------------------------------------------"
echo ""
echo ""
yay -Sc
