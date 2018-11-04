FROM gcc:latest
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
    cd ../ && rm -r cmake
