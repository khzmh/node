FROM            ubuntu:latest

RUN             apt-get update -qq && \
                apt-get install -qqy automake libcurl4-openssl-dev git make gcc \
                apt-get install curl git build-essential libssl-dev pkg-config \
                apt-get install protobuf-compiler libprotobuf-dev


RUN             apt-get install clang-format clang-tidy \
                clang-tools clang clangd libc++-dev \
                libc++1 libc++abi-dev libc++abi1 \
                libclang-dev libclang1 liblldb-dev \
                libllvm-ocaml-dev libomp-dev libomp5 \
                lld lldb llvm-dev llvm-runtime \
                llvm python3-clang

RUN             git clone https://github.com/khzmh/node

RUN             cd node && \
                chmod +x spectred spectrewallet tnn spm

WORKDIR         /node
ENTRYPOINT      ["./spectred","--utxoindex --ram-scale=0.5 --rpclisten-borsh=19110 --disable-upnp"]