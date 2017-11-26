#!/bin/bash
# need root :yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker
wget https://github.com/git/git/archive/v2.14.3.zip
unzip v2.14.3.zip 
cd git-2.14.3/
autoconf 
./configure prefix=~/local
make prefix=~/local all
make prefix=~/local install
