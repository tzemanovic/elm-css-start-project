#!/bin/bash
# Start Elm localhost development server

{ watchexec -w style/style-1/ -e elm,json ./compile-stylesheets.sh & \
elm-app start; }
