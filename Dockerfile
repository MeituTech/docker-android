FROM meitu/android-base:latest
LABEL maintainer "Ligboy.Liu <ligboy@gmail.com>"

RUN yes | sdkmanager --licenses

RUN sdkmanager "build-tools;28.0.3"
RUN sdkmanager "build-tools;29.0.0"
RUN sdkmanager "build-tools;29.0.1"

RUN sdkmanager "tools"
RUN sdkmanager "cmake;3.6.4111459"
RUN sdkmanager "platform-tools"
RUN sdkmanager "extras;google;google_play_services"
RUN sdkmanager "extras;google;instantapps"

RUN sdkmanager "platforms;android-28"
RUN sdkmanager "platforms;android-29"

RUN apt-get clean -y && apt-get autoremove -y & rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*

# Go to workspace
RUN mkdir -p /var/workspace
WORKDIR /var/workspace
