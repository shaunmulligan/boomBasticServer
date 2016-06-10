#!/bin/bash

mkdir -p /root/.config/mopidy

MOPIDY_CONFIG='/root/.config/mopidy/mopidy.conf'

touch "$MOPIDY_CONFIG"

cat >> "$MOPIDY_CONFIG" <<-EOF
[http]
hostname = ${MOPIDY_HTTP_HOSTNAME:-::}
port = ${MOPIDY_HTTP_PORT:-80}

[mpd]
hostname = ${MOPIDY_MPD_HOSTNAME:-::}
port = ${MOPIDY_MPD_PORT:-6600}

[soundcloud]
enabled = ${MOPIDY_SOUNDCLOUD_ENABLED:-false}
auth_token = ${MOPIDY_SOUNDCLOUD_AUTHTOKEN:-}

[spotify]
enabled = ${MOPIDY_SPOTIFY_ENABLED:-false}
username = ${MOPIDY_SPOTIFY_USERNAME:-}
password = ${MOPIDY_SPOTIFY_PASSWORD:-}

[touchscreen]
enabled = true
sdl_fbdev = /dev/fb0
screen_width = 800
screen_height = 480
resolution_factor = 8
cursor = true
cache_dir = $XDG_CACHE_DIR/mopidy/touchscreen

[youtube]
enabled = ${MOPIDY_YOUTUBE_ENABLED:-true}
EOF

mopidy
