FROM gcc:8
RUN git clone --recursive https://github.com/boostorg/boost.git && \
    cd boost && \
    sh bootstrap.sh && \
    ./b2 install -j5 --without-python && \
    cd ../ && rm -r boost &&\
    wget https://cmake.org/files/v3.12/cmake-3.12.3.tar.gz &&\
    tar -zxvf cmake-3.12.3.tar.gz &&\
    cd cmake-3.12.3 &&\
    ./configure &&\
    make -j5 &&\
    make install &&\
    cd ../ && rm -r cmake-3.12.3.tar.gz cmake-3.12.3
