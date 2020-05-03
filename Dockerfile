FROM opensuse/tumbleweed
RUN zypper -n install binutils flex bison gcc-c++ gcc-32bit mpfr-devel gmp-devel mpc-devel make gdb valgrind strace git wget unzip
RUN useradd -ms /bin/bash marxin
USER marxin
WORKDIR /home/marxin
RUN wget https://github.com/gcc-mirror/gcc/archive/master.zip
RUN unzip master.zip
WORKDIR gcc-master
RUN mkdir objdir
WORKDIR objdir
RUN ../configure --disable-bootstrap --prefix=/home/marxin/bin/gcc
RUN make -j4
