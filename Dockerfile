FROM debian:stable-slim

RUN apt-get update
RUN apt install -y autoconf gawk gcc m4 make g++ wget zip

# Install hercules

RUN wget https://github.com/rbowler/spinhawk/archive/release-3.13.tar.gz
RUN tar xvzf release-3.13.tar.gz

WORKDIR /spinhawk-release-3.13

RUN chmod -R 755 *
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install

# Install MVS

RUN mkdir mvs-install
WORKDIR /mvs-install

RUN wget https://wotho.ethz.ch/tk4-/tk4-_v1.00.zip --no-check-certificate
RUN wget https://wotho.ethz.ch/tk4-/tk4-cbt.zip --no-check-certificate
RUN wget https://wotho.ethz.ch/tk4-/tk4-source.zip --no-check-certificate

RUN unzip tk4-_v1.00.zip
RUN unzip -o tk4-cbt.zip
RUN unzip -o tk4-source.zip

# RUN cd unattended && ./set_console_mode

ENTRYPOINT ["./mvs"]
# ENTRYPOINT ["tail", "-f", "/dev/null"]
