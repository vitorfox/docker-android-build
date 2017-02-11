FROM java:8-alpine
RUN apk add --update bash
RUN apk add libstdc++
RUN apk add curl
ENV SDK_TMP_FILENAME tools_r25.2.3-linux.zip
ENV ANDROID_SDK_URL https://dl.google.com/android/repository/${SDK_TMP_FILENAME}
ENV SDK_EXTRACT_PATH tools
ENV SDK_EXTRACT_PATH_FINAL android-sdk
#RUN curl -L "${ANDROID_SDK_URL}" -O ${SDK_TMP_FILENAME} && \
#  tar -xf "${SDK_TMP_FILENAME}" && rm -rf "${SDK_TMP_FILENAME}" && \
#  mv "${SDK_EXTRACT_PATH}" "${SDK_EXTRACT_PATH_FINAL}"

RUN curl -L "${ANDROID_SDK_URL}" -O ${SDK_TMP_FILENAME}
RUN tar -xf "${SDK_TMP_FILENAME}" && rm -rf "${SDK_TMP_FILENAME}"
RUN mv "${SDK_EXTRACT_PATH}" "${SDK_EXTRACT_PATH_FINAL}"

ENV ANDROID_HOME /usr/local/${SDK_EXTRACT_PATH_FINAL}
ENV ANDROID_SDK /usr/local/${SDK_EXTRACT_PATH_FINAL}
WORKDIR /workdir
