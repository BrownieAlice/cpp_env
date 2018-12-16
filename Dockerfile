FROM gcc
RUN git clone --recursive https://github.com/boostorg/boost.git && \
    cd boost && \
    sh bootstrap.sh && \
    ./b2 install -j5 --without-python && \
    cd ../ && rm -r boost &&\
    git clone --recursive https://gitlab.kitware.com/cmake/cmake.git &&\
    cd cmake &&\
    ./bootstrap &&\
    make -j5 &&\
    make install &&\
    cd ../ && rm -r cmake &&\
    apt update && apt install -y --no-install-recommends re2c &&\
    git clone https://github.com/ninja-build/ninja.git &&\
    cd ninja && ./configure.py --bootstrap && mv ninja /usr/bin/ninja &&\
    cd ../ && rm -r ninja
