#!/bin/bash
if [[ "$(uname -s)" == "Darwin" ]]; then
    # reset launchpad
    defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock

    # .DS_Store
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
    defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
fi
