#!/bin/sh
hyprshade install &&
systemctl --user enable --now hyprshade.timer
