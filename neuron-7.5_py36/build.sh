#!/bin/bash
set -ex

# export MPI_FLAGS="--allow-run-as-root;-mca;plm;isolated"

./configure --prefix="$PREFIX" --exec_prefix="$PREFIX" \
  --with-paranrn \
  --without-x \
  --with-nrnpython="$PYTHON" \
  --enable-pysetup="--prefix=$PREFIX"
#  --enable-static \

make
make install
(cd $PREFIX ; mkdir -p x86_64 ; cd x86_64 ; ln -s ../lib lib)
cd ..
