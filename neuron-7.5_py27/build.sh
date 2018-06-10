#!/bin/bash
set -ex

./configure --prefix="$PREFIX" --exec_prefix="$PREFIX" \
  --with-paranrn=dynamic \
  --without-x \
  --with-nrnpython="$PYTHON" \
  --enable-pysetup="--prefix=$PREFIX"
make
make install
(cd $PREFIX ; mkdir -p x86_64 ; cd x86_64 ; ln -s ../lib lib)
cd ..
