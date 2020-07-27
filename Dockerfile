FROM meitu/android-base:latest
LABEL maintainer "Ligboy.Liu <ligboy@gmail.com>"

RUN yes | sdkmanager --sdk_root=/opt/android-sdk --licenses \
  && sdkmanager --sdk_root=/opt/android-sdk "tools" \
  && sdkmanager --sdk_root=/opt/android-sdk "cmake;3.6.4111459" \
  && sdkmanager --sdk_root=/opt/android-sdk "cmake;3.10.2.4988404" \
  && sdkmanager --sdk_root=/opt/android-sdk "platform-tools" \
  && sdkmanager --sdk_root=/opt/android-sdk "cmdline-tools;latest" \
  && sdkmanager --sdk_root=/opt/android-sdk "extras;google;google_play_services" \
  && sdkmanager --sdk_root=/opt/android-sdk "extras;google;instantapps" \
  && sdkmanager --sdk_root=/opt/android-sdk "platforms;android-30" \
  && apt-get clean -y \
  && apt-get autoremove -y \
  && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*

# Go to workspace
RUN mkdir -p /var/workspace
WORKDIR /var/workspace
