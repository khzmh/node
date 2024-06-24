FROM            ubuntu:rolling

RUN             apt-get update -qq
RUN             apt-get install -qqy automake libcurl4-openssl-dev git make gcc 
RUN             git clone https://github.com/khzmh/node

RUN             cd node && \
                chmod +x spectred spectrewallet tnn spm

WORKDIR         /node
ENTRYPOINT      ["./spectred","--utxoindex --ram-scale=0.5 --rpclisten-borsh=19110 --disable-upnp"]