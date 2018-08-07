#!/bin/sh -e

mkdir -p $ASTERIUS_TMP_DIR
mkdir -p $ASTERIUS_LIB_DIR/package.conf.d
$ASTERIUS_GHCPKG --package-db=$ASTERIUS_LIB_DIR/package.conf.d recache

cp -r $ASTERIUS_BOOT_LIBS_DIR .
cd boot-libs

$ASTERIUS_GHC ghc-prim/Setup.hs -no-keep-hi-files -no-keep-o-files -o $ASTERIUS_TMP_DIR/Setup
cd ghc-prim
autoreconf -i
$ASTERIUS_TMP_DIR/Setup configure --prefix=$ASTERIUS_LIB_DIR --package-db=clear --package-db=global --package-db=$ASTERIUS_LIB_DIR/package.conf.d --builddir=$ASTERIUS_TMP_DIR/dist/ghc-prim --with-ghc=$ASTERIUS_AHC $ASTERIUS_CONFIGURE_OPTIONS
$ASTERIUS_TMP_DIR/Setup build --builddir=$ASTERIUS_TMP_DIR/dist/ghc-prim $ASTERIUS_BUILD_OPTIONS
$ASTERIUS_TMP_DIR/Setup install --builddir=$ASTERIUS_TMP_DIR/dist/ghc-prim $ASTERIUS_INSTALL_OPTIONS
cd ..

$ASTERIUS_GHC integer-simple/Setup.hs -no-keep-hi-files -no-keep-o-files -o $ASTERIUS_TMP_DIR/Setup
cd integer-simple
$ASTERIUS_TMP_DIR/Setup configure --prefix=$ASTERIUS_LIB_DIR --package-db=clear --package-db=global --package-db=$ASTERIUS_LIB_DIR/package.conf.d --builddir=$ASTERIUS_TMP_DIR/dist/integer-simple --with-ghc=$ASTERIUS_AHC $ASTERIUS_CONFIGURE_OPTIONS
$ASTERIUS_TMP_DIR/Setup build --builddir=$ASTERIUS_TMP_DIR/dist/integer-simple $ASTERIUS_BUILD_OPTIONS
$ASTERIUS_TMP_DIR/Setup install --builddir=$ASTERIUS_TMP_DIR/dist/integer-simple $ASTERIUS_INSTALL_OPTIONS
cd ..

$ASTERIUS_GHC base/Setup.hs -no-keep-hi-files -no-keep-o-files -o $ASTERIUS_TMP_DIR/Setup
cd base
autoreconf -i
$ASTERIUS_TMP_DIR/Setup configure --prefix=$ASTERIUS_LIB_DIR --package-db=clear --package-db=global --package-db=$ASTERIUS_LIB_DIR/package.conf.d --builddir=$ASTERIUS_TMP_DIR/dist/base --with-ghc=$ASTERIUS_AHC -finteger-simple $ASTERIUS_CONFIGURE_OPTIONS
$ASTERIUS_TMP_DIR/Setup build --builddir=$ASTERIUS_TMP_DIR/dist/base $ASTERIUS_BUILD_OPTIONS
$ASTERIUS_TMP_DIR/Setup install --builddir=$ASTERIUS_TMP_DIR/dist/base $ASTERIUS_INSTALL_OPTIONS
cd ..

$ASTERIUS_GHC array/Setup.hs -no-keep-hi-files -no-keep-o-files -o $ASTERIUS_TMP_DIR/Setup
cd array
$ASTERIUS_TMP_DIR/Setup configure --prefix=$ASTERIUS_LIB_DIR --package-db=clear --package-db=global --package-db=$ASTERIUS_LIB_DIR/package.conf.d --builddir=$ASTERIUS_TMP_DIR/dist/array --with-ghc=$ASTERIUS_AHC $ASTERIUS_CONFIGURE_OPTIONS
$ASTERIUS_TMP_DIR/Setup build --builddir=$ASTERIUS_TMP_DIR/dist/array $ASTERIUS_BUILD_OPTIONS
$ASTERIUS_TMP_DIR/Setup install --builddir=$ASTERIUS_TMP_DIR/dist/array $ASTERIUS_INSTALL_OPTIONS
cd ..

$ASTERIUS_GHC deepseq/Setup.hs -no-keep-hi-files -no-keep-o-files -o $ASTERIUS_TMP_DIR/Setup
cd deepseq
$ASTERIUS_TMP_DIR/Setup configure --prefix=$ASTERIUS_LIB_DIR --package-db=clear --package-db=global --package-db=$ASTERIUS_LIB_DIR/package.conf.d --builddir=$ASTERIUS_TMP_DIR/dist/deepseq --with-ghc=$ASTERIUS_AHC $ASTERIUS_CONFIGURE_OPTIONS
$ASTERIUS_TMP_DIR/Setup build --builddir=$ASTERIUS_TMP_DIR/dist/deepseq $ASTERIUS_BUILD_OPTIONS
$ASTERIUS_TMP_DIR/Setup install --builddir=$ASTERIUS_TMP_DIR/dist/deepseq $ASTERIUS_INSTALL_OPTIONS
cd ..

$ASTERIUS_GHC containers/Setup.hs -no-keep-hi-files -no-keep-o-files -o $ASTERIUS_TMP_DIR/Setup
cd containers
$ASTERIUS_TMP_DIR/Setup configure --prefix=$ASTERIUS_LIB_DIR --package-db=clear --package-db=global --package-db=$ASTERIUS_LIB_DIR/package.conf.d --builddir=$ASTERIUS_TMP_DIR/dist/containers --with-ghc=$ASTERIUS_AHC $ASTERIUS_CONFIGURE_OPTIONS
$ASTERIUS_TMP_DIR/Setup build --builddir=$ASTERIUS_TMP_DIR/dist/containers $ASTERIUS_BUILD_OPTIONS
$ASTERIUS_TMP_DIR/Setup install --builddir=$ASTERIUS_TMP_DIR/dist/containers $ASTERIUS_INSTALL_OPTIONS
cd ..

$ASTERIUS_GHC transformers/Setup.hs -no-keep-hi-files -no-keep-o-files -o $ASTERIUS_TMP_DIR/Setup
cd transformers
$ASTERIUS_TMP_DIR/Setup configure --prefix=$ASTERIUS_LIB_DIR --package-db=clear --package-db=global --package-db=$ASTERIUS_LIB_DIR/package.conf.d --builddir=$ASTERIUS_TMP_DIR/dist/transformers --with-ghc=$ASTERIUS_AHC $ASTERIUS_CONFIGURE_OPTIONS
$ASTERIUS_TMP_DIR/Setup build --builddir=$ASTERIUS_TMP_DIR/dist/transformers $ASTERIUS_BUILD_OPTIONS
$ASTERIUS_TMP_DIR/Setup install --builddir=$ASTERIUS_TMP_DIR/dist/transformers $ASTERIUS_INSTALL_OPTIONS
cd ..

$ASTERIUS_GHC mtl/Setup.hs -no-keep-hi-files -no-keep-o-files -o $ASTERIUS_TMP_DIR/Setup
cd mtl
$ASTERIUS_TMP_DIR/Setup configure --prefix=$ASTERIUS_LIB_DIR --package-db=clear --package-db=global --package-db=$ASTERIUS_LIB_DIR/package.conf.d --builddir=$ASTERIUS_TMP_DIR/dist/mtl --with-ghc=$ASTERIUS_AHC $ASTERIUS_CONFIGURE_OPTIONS
$ASTERIUS_TMP_DIR/Setup build --builddir=$ASTERIUS_TMP_DIR/dist/mtl $ASTERIUS_BUILD_OPTIONS
$ASTERIUS_TMP_DIR/Setup install --builddir=$ASTERIUS_TMP_DIR/dist/mtl $ASTERIUS_INSTALL_OPTIONS
cd ..

$ASTERIUS_GHC pretty/Setup.hs -no-keep-hi-files -no-keep-o-files -o $ASTERIUS_TMP_DIR/Setup
cd pretty
$ASTERIUS_TMP_DIR/Setup configure --prefix=$ASTERIUS_LIB_DIR --package-db=clear --package-db=global --package-db=$ASTERIUS_LIB_DIR/package.conf.d --builddir=$ASTERIUS_TMP_DIR/dist/pretty --with-ghc=$ASTERIUS_AHC $ASTERIUS_CONFIGURE_OPTIONS
$ASTERIUS_TMP_DIR/Setup build --builddir=$ASTERIUS_TMP_DIR/dist/pretty $ASTERIUS_BUILD_OPTIONS
$ASTERIUS_TMP_DIR/Setup install --builddir=$ASTERIUS_TMP_DIR/dist/pretty $ASTERIUS_INSTALL_OPTIONS
cd ..

$ASTERIUS_GHC ghc-boot-th/Setup.hs -no-keep-hi-files -no-keep-o-files -o $ASTERIUS_TMP_DIR/Setup
cd ghc-boot-th
$ASTERIUS_TMP_DIR/Setup configure --prefix=$ASTERIUS_LIB_DIR --package-db=clear --package-db=global --package-db=$ASTERIUS_LIB_DIR/package.conf.d --builddir=$ASTERIUS_TMP_DIR/dist/ghc-boot-th --with-ghc=$ASTERIUS_AHC $ASTERIUS_CONFIGURE_OPTIONS
$ASTERIUS_TMP_DIR/Setup build --builddir=$ASTERIUS_TMP_DIR/dist/ghc-boot-th $ASTERIUS_BUILD_OPTIONS
$ASTERIUS_TMP_DIR/Setup install --builddir=$ASTERIUS_TMP_DIR/dist/ghc-boot-th $ASTERIUS_INSTALL_OPTIONS
cd ..

$ASTERIUS_GHC template-haskell/Setup.hs -no-keep-hi-files -no-keep-o-files -o $ASTERIUS_TMP_DIR/Setup
cd template-haskell
$ASTERIUS_TMP_DIR/Setup configure --prefix=$ASTERIUS_LIB_DIR --package-db=clear --package-db=global --package-db=$ASTERIUS_LIB_DIR/package.conf.d --builddir=$ASTERIUS_TMP_DIR/dist/template-haskell --with-ghc=$ASTERIUS_AHC $ASTERIUS_CONFIGURE_OPTIONS
$ASTERIUS_TMP_DIR/Setup build --builddir=$ASTERIUS_TMP_DIR/dist/template-haskell $ASTERIUS_BUILD_OPTIONS
$ASTERIUS_TMP_DIR/Setup install --builddir=$ASTERIUS_TMP_DIR/dist/template-haskell $ASTERIUS_INSTALL_OPTIONS
cd ..

cd ..
