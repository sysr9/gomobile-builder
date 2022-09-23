FROM cimg/android:2022.03.1-ndk

RUN sudo apt update
RUN sudo apt -y upgrade
RUN sudo apt -y install clang-12

RUN wget -q -O - https://go.dev/dl/go1.19.1.linux-amd64.tar.gz | sudo tar -C /usr/local -xzf -

ENV PATH=$PATH:/usr/local/go/bin:/home/circleci/go/bin

RUN go install golang.org/x/mobile/cmd/gomobile@latest
RUN gomobile init

