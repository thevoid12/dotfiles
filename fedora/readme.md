# fedora + KDE Plasma

## kde/tv_audio.sh
Desktop app that switches system audio between the laptop speakers and the LG TV
plugged in over HDMI (used when screen sharing to the TV). Detects the TV's HDMI
port by product name, switches the sound card profile, and moves any already
running audio streams to the new sink. Click the "TV Audio" icon on the desktop
for a menu with two options: switch to TV, or revert to laptop speakers.

The desktop icon (`~/Desktop/TVAudio.desktop`) is a symlink to
`fedora/kde/TVAudio.desktop` in this repo.
