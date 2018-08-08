FROM meitu/android-base:latest
LABEL maintainer "Ligboy.Liu <ligboy@gmail.com>"

ENV ANDROID_HOME /opt/android-sdk
ENV ANDROID_SDK_ROOT /opt/android-sdk

# ------------------------------------------------------
# --- Download Android SDK tools into $ANDROID_HOME

#RUN cd /opt && wget -q https://dl.google.com/android/repository/tools_r25.2.5-linux.zip -O android-sdk-tools.zip
# sdk-tools-linux-3773319.zip -> tools_r25.3.1
RUN mkdir -p ${ANDROID_HOME}
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools
COPY install-sdk.sh /opt
RUN chmod a+x /opt/install-sdk.sh && /opt/install-sdk.sh

# Go to workspace
RUN mkdir -p /var/workspace
WORKDIR /var/workspace
