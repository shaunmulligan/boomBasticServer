FROM resin/raspberrypi-buildpack-deps:jessie-curl-20160411

RUN wget -q -O - http://apt.mopidy.com/mopidy.gpg | apt-key add - \
  && wget -q -O /etc/apt/sources.list.d/mopidy.list http://apt.mopidy.com/mopidy.list \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    gstreamer1.0-alsa \
    gstreamer1.0-plugins-bad \
    mopidy \
    mopidy-soundcloud \
    mopidy-spotify \
    python-pip \
    python-pygame \
    build-essential \
    libasound2-dev \
    libvorbisidec-dev \
    libvorbis-dev \
    libflac-dev \
    alsa-utils \
    libavahi-client-dev \
    avahi-daemon \
    git \
  && rm -rf /var/lib/apt/lists/*

RUN pip install \
  Mopidy-Moped \
  Mopidy-Touchscreen \
  Mopidy-Youtube

RUN git clone https://github.com/badaix/snapcast.git
RUN cd snapcast/externals && git submodule update --init --recursive
RUN cd snapcast && make && make installserver && make installclient


COPY start.sh /start.sh

CMD /start.sh
