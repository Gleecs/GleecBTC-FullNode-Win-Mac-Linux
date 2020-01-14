# Copyright (c) 2013-2016 The GleecBTC Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

DIST_SUBDIRS = secp256k1 univalue

AM_LDFLAGS = $(PTHREAD_CFLAGS) $(LIBTOOL_LDFLAGS) $(HARDENED_LDFLAGS) $(GPROF_LDFLAGS) $(SANITIZER_LDFLAGS)
AM_CXXFLAGS = $(DEBUG_CXXFLAGS) $(HARDENED_CXXFLAGS) $(WARN_CXXFLAGS) $(NOWARN_CXXFLAGS) $(ERROR_CXXFLAGS) $(GPROF_CXXFLAGS) $(SANITIZER_CXXFLAGS)
AM_CPPFLAGS = $(DEBUG_CPPFLAGS) $(HARDENED_CPPFLAGS)
AM_LIBTOOLFLAGS = --preserve-dup-deps
EXTRA_LIBRARIES =

if EMBEDDED_UNIVALUE
LIBUNIVALUE = univalue/libunivalue.la

$(LIBUNIVALUE): $(wildcard univalue/lib/*) $(wildcard univalue/include/*)
	$(AM_V_at)$(MAKE) $(AM_MAKEFLAGS) -C $(@D) $(@F)
else
LIBUNIVALUE = $(UNIVALUE_LIBS)
endif

GLEECBTC_INCLUDES=-I$(builddir) $(BDB_CPPFLAGS) $(BOOST_CPPFLAGS) $(LEVELDB_CPPFLAGS) $(CRYPTO_CFLAGS) $(SSL_CFLAGS)

GLEECBTC_INCLUDES += -I$(srcdir)/secp256k1/include
GLEECBTC_INCLUDES += $(UNIVALUE_CFLAGS)

LIBGLEECBTC_SERVER=libgleecbtc_server.a
LIBGLEECBTC_COMMON=libgleecbtc_common.a
LIBGLEECBTC_CONSENSUS=libgleecbtc_consensus.a
LIBGLEECBTC_CLI=libgleecbtc_cli.a
LIBGLEECBTC_UTIL=libgleecbtc_util.a
LIBGLEECBTC_CRYPTO_BASE=crypto/libgleecbtc_crypto_base.a
LIBGLEECBTCQT=qt/libgleecbtcqt.a
LIBSECP256K1=secp256k1/libsecp256k1.la

if ENABLE_ZMQ
LIBGLEECBTC_ZMQ=libgleecbtc_zmq.a
endif
if BUILD_GLEECBTC_LIBS
LIBGLEECBTCCONSENSUS=libgleecbtcconsensus.la
endif
if ENABLE_WALLET
LIBGLEECBTC_WALLET=libgleecbtc_wallet.a
LIBGLEECBTC_WALLET_TOOL=libgleecbtc_wallet_tool.a
endif

LIBGLEECBTC_CRYPTO= $(LIBGLEECBTC_CRYPTO_BASE)
if ENABLE_SSE41
LIBGLEECBTC_CRYPTO_SSE41 = crypto/libgleecbtc_crypto_sse41.a
LIBGLEECBTC_CRYPTO += $(LIBGLEECBTC_CRYPTO_SSE41)
endif
if ENABLE_AVX2
LIBGLEECBTC_CRYPTO_AVX2 = crypto/libgleecbtc_crypto_avx2.a
LIBGLEECBTC_CRYPTO += $(LIBGLEECBTC_CRYPTO_AVX2)
endif
if ENABLE_SHANI
LIBGLEECBTC_CRYPTO_SHANI = crypto/libgleecbtc_crypto_shani.a
LIBGLEECBTC_CRYPTO += $(LIBGLEECBTC_CRYPTO_SHANI)
endif

$(LIBSECP256K1): $(wildcard secp256k1/src/*.h) $(wildcard secp256k1/src/*.c) $(wildcard secp256k1/include/*)
	$(AM_V_at)$(MAKE) $(AM_MAKEFLAGS) -C $(@D) $(@F)

# Make is not made aware of per-object dependencies to avoid limiting building parallelization
# But to build the less dependent modules first, we manually select their order here:
EXTRA_LIBRARIES += \
  $(LIBGLEECBTC_CRYPTO) \
  $(LIBGLEECBTC_UTIL) \
  $(LIBGLEECBTC_COMMON) \
  $(LIBGLEECBTC_CONSENSUS) \
  $(LIBGLEECBTC_SERVER) \
  $(LIBGLEECBTC_CLI) \
  $(LIBGLEECBTC_WALLET) \
  $(LIBGLEECBTC_WALLET_TOOL) \
  $(LIBGLEECBTC_ZMQ)

lib_LTLIBRARIES = $(LIBGLEECBTCCONSENSUS)

bin_PROGRAMS =
noinst_PROGRAMS =
TESTS =
BENCHMARKS =

if BUILD_GLEECBTCD
  bin_PROGRAMS += gleecbtcd
endif

if BUILD_GLEECBTC_CLI
  bin_PROGRAMS += gleecbtc-cli
endif
if BUILD_GLEECBTC_TX
  bin_PROGRAMS += gleecbtc-tx
endif
if ENABLE_WALLET
if BUILD_GLEECBTC_WALLET
  bin_PROGRAMS += gleecbtc-wallet
endif
endif

.PHONY: FORCE check-symbols check-security
# gleecbtc core #
GLEECBTC_CORE_H = \
  addrdb.h \
  addrman.h \
  attributes.h \
  banman.h \
  base58.h \
  bech32.h \
  bloom.h \
  blockencodings.h \
  blockfilter.h \
  chain.h \
  chainparams.h \
  chainparamsbase.h \
  chainparamsseeds.h \
  checkqueue.h \
  clientversion.h \
  coins.h \
  compat.h \
  compat/assumptions.h \
  compat/byteswap.h \
  compat/endian.h \
  compat/sanity.h \
  compressor.h \
  consensus/consensus.h \
  consensus/tx_check.h \
  consensus/tx_verify.h \
  core_io.h \
  core_memusage.h \
  cuckoocache.h \
  flatfile.h \
  fs.h \
  httprpc.h \
  httpserver.h \
  index/base.h \
  index/blockfilterindex.h \
  index/txindex.h \
  indirectmap.h \
  init.h \
  interfaces/chain.h \
  interfaces/handler.h \
  interfaces/node.h \
  interfaces/wallet.h \
  key.h \
  key_io.h \
  dbwrapper.h \
  limitedmap.h \
  logging.h \
  memusage.h \
  merkleblock.h \
  miner.h \
  net.h \
  net_permissions.h \
  net_processing.h \
  netaddress.h \
  netbase.h \
  netmessagemaker.h \
  node/coin.h \
  node/coinstats.h \
  node/psbt.h \
  node/transaction.h \
  noui.h \
  optional.h \
  outputtype.h \
  policy/feerate.h \
  policy/fees.h \
  policy/policy.h \
  policy/rbf.h \
  policy/settings.h \
  pow.h \
  protocol.h \
  psbt.h \
  random.h \
  reverse_iterator.h \
  reverselock.h \
  rpc/blockchain.h \
  rpc/client.h \
  rpc/protocol.h \
  rpc/rawtransaction_util.h \
  rpc/register.h \
  rpc/request.h \
  rpc/server.h \
  rpc/util.h \
  scheduler.h \
  script/descriptor.h \
  script/keyorigin.h \
  script/sigcache.h \
  script/sign.h \
  script/signingprovider.h \
  script/standard.h \
  shutdown.h \
  streams.h \
  support/allocators/secure.h \
  support/allocators/zeroafterfree.h \
  support/cleanse.h \
  support/events.h \
  support/lockedpool.h \
  sync.h \
  threadsafety.h \
  threadinterrupt.h \
  timedata.h \
  torcontrol.h \
  txdb.h \
  txmempool.h \
  ui_interface.h \
  undo.h \
  util/bip32.h \
  util/bytevectorhash.h \
  util/error.h \
  util/fees.h \
  util/system.h \
  util/memory.h \
  util/moneystr.h \
  util/rbf.h \
  util/string.h \
  util/threadnames.h \
  util/time.h \
  util/translation.h \
  util/url.h \
  util/validation.h \
  validation.h \
  validationinterface.h \
  versionbits.h \
  versionbitsinfo.h \
  walletinitinterface.h \
  wallet/coincontrol.h \
  wallet/crypter.h \
  wallet/db.h \
  wallet/feebumper.h \
  wallet/fees.h \
  wallet/ismine.h \
  wallet/load.h \
  wallet/psbtwallet.h \
  wallet/rpcwallet.h \
  wallet/wallet.h \
  wallet/walletdb.h \
  wallet/wallettool.h \
  wallet/walletutil.h \
  wallet/coinselection.h \
  warnings.h \
  zmq/zmqabstractnotifier.h \
  zmq/zmqconfig.h\
  zmq/zmqnotificationinterface.h \
  zmq/zmqpublishnotifier.h \
  zmq/zmqrpc.h


obj/build.h: FORCE
	@$(MKDIR_P) $(builddir)/obj
	@$(top_srcdir)/share/genbuild.sh "$(abs_top_builddir)/src/obj/build.h" \
	  "$(abs_top_srcdir)"
libgleecbtc_util_a-clientversion.$(OBJEXT): obj/build.h

# server: shared between gleecbtcd and gleecbtc-qt
# Contains code accessing mempool and chain state that is meant to be separated
# from wallet and gui code (see node/README.md). Shared code should go in
# libgleecbtc_common or libgleecbtc_util libraries, instead.
libgleecbtc_server_a_CPPFLAGS = $(AM_CPPFLAGS) $(GLEECBTC_INCLUDES) $(MINIUPNPC_CPPFLAGS) $(EVENT_CFLAGS) $(EVENT_PTHREADS_CFLAGS)
libgleecbtc_server_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libgleecbtc_server_a_SOURCES = \
  addrdb.cpp \
  addrman.cpp \
  banman.cpp \
  blockencodings.cpp \
  blockfilter.cpp \
  chain.cpp \
  consensus/tx_verify.cpp \
  flatfile.cpp \
  httprpc.cpp \
  httpserver.cpp \
  index/base.cpp \
  index/blockfilterindex.cpp \
  index/txindex.cpp \
  interfaces/chain.cpp \
  interfaces/node.cpp \
  init.cpp \
  dbwrapper.cpp \
  miner.cpp \
  net.cpp \
  net_processing.cpp \
  node/coin.cpp \
  node/coinstats.cpp \
  node/psbt.cpp \
  node/transaction.cpp \
  noui.cpp \
  policy/fees.cpp \
  policy/rbf.cpp \
  policy/settings.cpp \
  pow.cpp \
  rest.cpp \
  rpc/blockchain.cpp \
  rpc/mining.cpp \
  rpc/misc.cpp \
  rpc/net.cpp \
  rpc/rawtransaction.cpp \
  rpc/server.cpp \
  script/sigcache.cpp \
  shutdown.cpp \
  timedata.cpp \
  torcontrol.cpp \
  txdb.cpp \
  txmempool.cpp \
  ui_interface.cpp \
  validation.cpp \
  validationinterface.cpp \
  versionbits.cpp \
  $(GLEECBTC_CORE_H)

if ENABLE_WALLET
libgleecbtc_server_a_SOURCES += wallet/init.cpp
endif
if !ENABLE_WALLET
libgleecbtc_server_a_SOURCES += dummywallet.cpp
endif

if ENABLE_ZMQ
libgleecbtc_zmq_a_CPPFLAGS = $(AM_CPPFLAGS) $(GLEECBTC_INCLUDES) $(ZMQ_CFLAGS)
libgleecbtc_zmq_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libgleecbtc_zmq_a_SOURCES = \
  zmq/zmqabstractnotifier.cpp \
  zmq/zmqnotificationinterface.cpp \
  zmq/zmqpublishnotifier.cpp \
  zmq/zmqrpc.cpp
endif


# wallet: shared between gleecbtcd and gleecbtc-qt, but only linked
# when wallet enabled
libgleecbtc_wallet_a_CPPFLAGS = $(AM_CPPFLAGS) $(GLEECBTC_INCLUDES)
libgleecbtc_wallet_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libgleecbtc_wallet_a_SOURCES = \
  interfaces/wallet.cpp \
  wallet/coincontrol.cpp \
  wallet/crypter.cpp \
  wallet/db.cpp \
  wallet/feebumper.cpp \
  wallet/fees.cpp \
  wallet/ismine.cpp \
  wallet/load.cpp \
  wallet/psbtwallet.cpp \
  wallet/rpcdump.cpp \
  wallet/rpcwallet.cpp \
  wallet/wallet.cpp \
  wallet/walletdb.cpp \
  wallet/walletutil.cpp \
  wallet/coinselection.cpp \
  $(GLEECBTC_CORE_H)

libgleecbtc_wallet_tool_a_CPPFLAGS = $(AM_CPPFLAGS) $(GLEECBTC_INCLUDES)
libgleecbtc_wallet_tool_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libgleecbtc_wallet_tool_a_SOURCES = \
  wallet/wallettool.cpp \
  $(GLEECBTC_CORE_H)

# crypto primitives library
crypto_libgleecbtc_crypto_base_a_CPPFLAGS = $(AM_CPPFLAGS)
crypto_libgleecbtc_crypto_base_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
crypto_libgleecbtc_crypto_base_a_SOURCES = \
  crypto/aes.cpp \
  crypto/aes.h \
  crypto/chacha_poly_aead.h \
  crypto/chacha_poly_aead.cpp \
  crypto/chacha20.h \
  crypto/chacha20.cpp \
  crypto/common.h \
  crypto/hkdf_sha256_32.cpp \
  crypto/hkdf_sha256_32.h \
  crypto/hmac_sha256.cpp \
  crypto/hmac_sha256.h \
  crypto/hmac_sha512.cpp \
  crypto/hmac_sha512.h \
  crypto/poly1305.h \
  crypto/poly1305.cpp \
  crypto/ripemd160.cpp \
  crypto/ripemd160.h \
  crypto/sha1.cpp \
  crypto/sha1.h \
  crypto/sha256.cpp \
  crypto/sha256.h \
  crypto/sha512.cpp \
  crypto/sha512.h \
  crypto/siphash.cpp \
  crypto/siphash.h

if USE_ASM
crypto_libgleecbtc_crypto_base_a_SOURCES += crypto/sha256_sse4.cpp
endif

crypto_libgleecbtc_crypto_sse41_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
crypto_libgleecbtc_crypto_sse41_a_CPPFLAGS = $(AM_CPPFLAGS)
crypto_libgleecbtc_crypto_sse41_a_CXXFLAGS += $(SSE41_CXXFLAGS)
crypto_libgleecbtc_crypto_sse41_a_CPPFLAGS += -DENABLE_SSE41
crypto_libgleecbtc_crypto_sse41_a_SOURCES = crypto/sha256_sse41.cpp

crypto_libgleecbtc_crypto_avx2_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
crypto_libgleecbtc_crypto_avx2_a_CPPFLAGS = $(AM_CPPFLAGS)
crypto_libgleecbtc_crypto_avx2_a_CXXFLAGS += $(AVX2_CXXFLAGS)
crypto_libgleecbtc_crypto_avx2_a_CPPFLAGS += -DENABLE_AVX2
crypto_libgleecbtc_crypto_avx2_a_SOURCES = crypto/sha256_avx2.cpp

crypto_libgleecbtc_crypto_shani_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
crypto_libgleecbtc_crypto_shani_a_CPPFLAGS = $(AM_CPPFLAGS)
crypto_libgleecbtc_crypto_shani_a_CXXFLAGS += $(SHANI_CXXFLAGS)
crypto_libgleecbtc_crypto_shani_a_CPPFLAGS += -DENABLE_SHANI
crypto_libgleecbtc_crypto_shani_a_SOURCES = crypto/sha256_shani.cpp

# consensus: shared between all executables that validate any consensus rules.
libgleecbtc_consensus_a_CPPFLAGS = $(AM_CPPFLAGS) $(GLEECBTC_INCLUDES)
libgleecbtc_consensus_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libgleecbtc_consensus_a_SOURCES = \
  amount.h \
  arith_uint256.cpp \
  arith_uint256.h \
  consensus/merkle.cpp \
  consensus/merkle.h \
  consensus/params.h \
  consensus/tx_check.cpp \
  consensus/validation.h \
  hash.cpp \
  hash.h \
  prevector.h \
  primitives/block.cpp \
  primitives/block.h \
  primitives/transaction.cpp \
  primitives/transaction.h \
  pubkey.cpp \
  pubkey.h \
  script/gleecbtcconsensus.cpp \
  script/interpreter.cpp \
  script/interpreter.h \
  script/script.cpp \
  script/script.h \
  script/script_error.cpp \
  script/script_error.h \
  serialize.h \
  span.h \
  tinyformat.h \
  uint256.cpp \
  uint256.h \
  util/strencodings.cpp \
  util/strencodings.h \
  version.h

# common: shared between gleecbtcd, and gleecbtc-qt and non-server tools
libgleecbtc_common_a_CPPFLAGS = $(AM_CPPFLAGS) $(GLEECBTC_INCLUDES)
libgleecbtc_common_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libgleecbtc_common_a_SOURCES = \
  base58.cpp \
  bech32.cpp \
  bloom.cpp \
  chainparams.cpp \
  coins.cpp \
  compressor.cpp \
  core_read.cpp \
  core_write.cpp \
  key.cpp \
  key_io.cpp \
  merkleblock.cpp \
  netaddress.cpp \
  netbase.cpp \
  net_permissions.cpp \
  outputtype.cpp \
  policy/feerate.cpp \
  policy/policy.cpp \
  protocol.cpp \
  psbt.cpp \
  rpc/rawtransaction_util.cpp \
  rpc/util.cpp \
  scheduler.cpp \
  script/descriptor.cpp \
  script/sign.cpp \
  script/signingprovider.cpp \
  script/standard.cpp \
  versionbitsinfo.cpp \
  warnings.cpp \
  $(GLEECBTC_CORE_H)

# util: shared between all executables.
# This library *must* be included to make sure that the glibc
# backward-compatibility objects and their sanity checks are linked.
libgleecbtc_util_a_CPPFLAGS = $(AM_CPPFLAGS) $(GLEECBTC_INCLUDES)
libgleecbtc_util_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libgleecbtc_util_a_SOURCES = \
  support/lockedpool.cpp \
  chainparamsbase.cpp \
  clientversion.cpp \
  compat/glibc_sanity_fdelt.cpp \
  compat/glibc_sanity.cpp \
  compat/glibcxx_sanity.cpp \
  compat/strnlen.cpp \
  fs.cpp \
  interfaces/handler.cpp \
  logging.cpp \
  random.cpp \
  rpc/request.cpp \
  support/cleanse.cpp \
  sync.cpp \
  threadinterrupt.cpp \
  util/bip32.cpp \
  util/bytevectorhash.cpp \
  util/error.cpp \
  util/fees.cpp \
  util/system.cpp \
  util/moneystr.cpp \
  util/rbf.cpp \
  util/threadnames.cpp \
  util/strencodings.cpp \
  util/string.cpp \
  util/time.cpp \
  util/url.cpp \
  util/validation.cpp \
  $(GLEECBTC_CORE_H)

if GLIBC_BACK_COMPAT
libgleecbtc_util_a_SOURCES += compat/glibc_compat.cpp
AM_LDFLAGS += $(COMPAT_LDFLAGS)
endif

# cli: shared between gleecbtc-cli and gleecbtc-qt
libgleecbtc_cli_a_CPPFLAGS = $(AM_CPPFLAGS) $(GLEECBTC_INCLUDES)
libgleecbtc_cli_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libgleecbtc_cli_a_SOURCES = \
  rpc/client.cpp \
  $(GLEECBTC_CORE_H)

nodist_libgleecbtc_util_a_SOURCES = $(srcdir)/obj/build.h
#

# gleecbtcd binary #
gleecbtcd_SOURCES = gleecbtcd.cpp
gleecbtcd_CPPFLAGS = $(AM_CPPFLAGS) $(GLEECBTC_INCLUDES)
gleecbtcd_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
gleecbtcd_LDFLAGS = $(RELDFLAGS) $(AM_LDFLAGS) $(LIBTOOL_APP_LDFLAGS)

if TARGET_WINDOWS
gleecbtcd_SOURCES += gleecbtcd-res.rc
endif

# Libraries below may be listed more than once to resolve circular dependencies (see
# https://eli.thegreenplace.net/2013/07/09/library-order-in-static-linking#circular-dependency)
gleecbtcd_LDADD = \
  $(LIBGLEECBTC_SERVER) \
  $(LIBGLEECBTC_WALLET) \
  $(LIBGLEECBTC_SERVER) \
  $(LIBGLEECBTC_COMMON) \
  $(LIBUNIVALUE) \
  $(LIBGLEECBTC_UTIL) \
  $(LIBGLEECBTC_ZMQ) \
  $(LIBGLEECBTC_CONSENSUS) \
  $(LIBGLEECBTC_CRYPTO) \
  $(LIBLEVELDB) \
  $(LIBLEVELDB_SSE42) \
  $(LIBMEMENV) \
  $(LIBSECP256K1)

gleecbtcd_LDADD += $(BOOST_LIBS) $(BDB_LIBS) $(CRYPTO_LIBS) $(MINIUPNPC_LIBS) $(EVENT_PTHREADS_LIBS) $(EVENT_LIBS) $(ZMQ_LIBS)

# gleecbtc-cli binary #
gleecbtc_cli_SOURCES = gleecbtc-cli.cpp
gleecbtc_cli_CPPFLAGS = $(AM_CPPFLAGS) $(GLEECBTC_INCLUDES) $(EVENT_CFLAGS)
gleecbtc_cli_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
gleecbtc_cli_LDFLAGS = $(RELDFLAGS) $(AM_LDFLAGS) $(LIBTOOL_APP_LDFLAGS)

if TARGET_WINDOWS
gleecbtc_cli_SOURCES += gleecbtc-cli-res.rc
endif

gleecbtc_cli_LDADD = \
  $(LIBGLEECBTC_CLI) \
  $(LIBUNIVALUE) \
  $(LIBGLEECBTC_UTIL) \
  $(LIBGLEECBTC_CRYPTO)

gleecbtc_cli_LDADD += $(BOOST_LIBS) $(CRYPTO_LIBS) $(EVENT_LIBS)
#

# gleecbtc-tx binary #
gleecbtc_tx_SOURCES = gleecbtc-tx.cpp
gleecbtc_tx_CPPFLAGS = $(AM_CPPFLAGS) $(GLEECBTC_INCLUDES)
gleecbtc_tx_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
gleecbtc_tx_LDFLAGS = $(RELDFLAGS) $(AM_LDFLAGS) $(LIBTOOL_APP_LDFLAGS)

if TARGET_WINDOWS
gleecbtc_tx_SOURCES += gleecbtc-tx-res.rc
endif

gleecbtc_tx_LDADD = \
  $(LIBUNIVALUE) \
  $(LIBGLEECBTC_COMMON) \
  $(LIBGLEECBTC_UTIL) \
  $(LIBGLEECBTC_CONSENSUS) \
  $(LIBGLEECBTC_CRYPTO) \
  $(LIBSECP256K1)

gleecbtc_tx_LDADD += $(BOOST_LIBS) $(CRYPTO_LIBS)
#

# gleecbtc-wallet binary #
gleecbtc_wallet_SOURCES = gleecbtc-wallet.cpp
gleecbtc_wallet_CPPFLAGS = $(AM_CPPFLAGS) $(GLEECBTC_INCLUDES)
gleecbtc_wallet_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
gleecbtc_wallet_LDFLAGS = $(RELDFLAGS) $(AM_LDFLAGS) $(LIBTOOL_APP_LDFLAGS)

if TARGET_WINDOWS
gleecbtc_wallet_SOURCES += gleecbtc-wallet-res.rc
endif

gleecbtc_wallet_LDADD = \
  $(LIBGLEECBTC_WALLET_TOOL) \
  $(LIBGLEECBTC_WALLET) \
  $(LIBGLEECBTC_COMMON) \
  $(LIBGLEECBTC_CONSENSUS) \
  $(LIBGLEECBTC_UTIL) \
  $(LIBGLEECBTC_CRYPTO) \
  $(LIBGLEECBTC_ZMQ) \
  $(LIBLEVELDB) \
  $(LIBLEVELDB_SSE42) \
  $(LIBMEMENV) \
  $(LIBSECP256K1) \
  $(LIBUNIVALUE)

gleecbtc_wallet_LDADD += $(BOOST_LIBS) $(BDB_LIBS) $(CRYPTO_LIBS) $(EVENT_PTHREADS_LIBS) $(EVENT_LIBS) $(MINIUPNPC_LIBS) $(ZMQ_LIBS)
#

# gleecbtcconsensus library #
if BUILD_GLEECBTC_LIBS
include_HEADERS = script/gleecbtcconsensus.h
libgleecbtcconsensus_la_SOURCES = support/cleanse.cpp $(crypto_libgleecbtc_crypto_base_a_SOURCES) $(libgleecbtc_consensus_a_SOURCES)

if GLIBC_BACK_COMPAT
  libgleecbtcconsensus_la_SOURCES += compat/glibc_compat.cpp
endif

libgleecbtcconsensus_la_LDFLAGS = $(AM_LDFLAGS) -no-undefined $(RELDFLAGS)
libgleecbtcconsensus_la_LIBADD = $(LIBSECP256K1)
libgleecbtcconsensus_la_CPPFLAGS = $(AM_CPPFLAGS) -I$(builddir)/obj -I$(srcdir)/secp256k1/include -DBUILD_GLEECBTC_INTERNAL
libgleecbtcconsensus_la_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)

endif
#

CTAES_DIST =  crypto/ctaes/bench.c
CTAES_DIST += crypto/ctaes/ctaes.c
CTAES_DIST += crypto/ctaes/ctaes.h
CTAES_DIST += crypto/ctaes/README.md
CTAES_DIST += crypto/ctaes/test.c

CLEANFILES = $(EXTRA_LIBRARIES)

CLEANFILES += *.gcda *.gcno
CLEANFILES += compat/*.gcda compat/*.gcno
CLEANFILES += consensus/*.gcda consensus/*.gcno
CLEANFILES += crypto/*.gcda crypto/*.gcno
CLEANFILES += policy/*.gcda policy/*.gcno
CLEANFILES += primitives/*.gcda primitives/*.gcno
CLEANFILES += script/*.gcda script/*.gcno
CLEANFILES += support/*.gcda support/*.gcno
CLEANFILES += univalue/*.gcda univalue/*.gcno
CLEANFILES += wallet/*.gcda wallet/*.gcno
CLEANFILES += wallet/test/*.gcda wallet/test/*.gcno
CLEANFILES += zmq/*.gcda zmq/*.gcno
CLEANFILES += obj/build.h

EXTRA_DIST = $(CTAES_DIST)


config/gleecbtc-config.h: config/stamp-h1
	@$(MAKE) -C $(top_builddir) $(subdir)/$(@)
config/stamp-h1: $(top_srcdir)/$(subdir)/config/gleecbtc-config.h.in $(top_builddir)/config.status
	$(AM_V_at)$(MAKE) -C $(top_builddir) $(subdir)/$(@)
$(top_srcdir)/$(subdir)/config/gleecbtc-config.h.in:  $(am__configure_deps)
	$(AM_V_at)$(MAKE) -C $(top_srcdir) $(subdir)/config/gleecbtc-config.h.in

clean-local:
	-$(MAKE) -C secp256k1 clean
	-$(MAKE) -C univalue clean
	-rm -f leveldb/*/*.gcda leveldb/*/*.gcno leveldb/helpers/memenv/*.gcda leveldb/helpers/memenv/*.gcno
	-rm -f config.h
	-rm -rf test/__pycache__

.rc.o:
	@test -f $(WINDRES)
	## FIXME: How to get the appropriate modulename_CPPFLAGS in here?
	$(AM_V_GEN) $(WINDRES) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(CPPFLAGS) -DWINDRES_PREPROC -i $< -o $@

check-symbols: $(bin_PROGRAMS)
if GLIBC_BACK_COMPAT
	@echo "Checking glibc back compat..."
	$(AM_V_at) READELF=$(READELF) CPPFILT=$(CPPFILT) $(PYTHON) $(top_srcdir)/contrib/devtools/symbol-check.py < $(bin_PROGRAMS)
endif

check-security: $(bin_PROGRAMS)
if HARDEN
	@echo "Checking binary security..."
	$(AM_V_at) READELF=$(READELF) OBJDUMP=$(OBJDUMP) $(PYTHON) $(top_srcdir)/contrib/devtools/security-check.py < $(bin_PROGRAMS)
endif

if ENABLE_BIP70
%.pb.cc %.pb.h: %.proto
	@test -f $(PROTOC)
	$(AM_V_GEN) $(PROTOC) --cpp_out=$(@D) --proto_path=$(<D) $<
endif

if EMBEDDED_LEVELDB
include Makefile.leveldb.include
endif

if ENABLE_TESTS
include Makefile.test.include
endif

if ENABLE_BENCH
include Makefile.bench.include
endif

if ENABLE_QT
include Makefile.qt.include
endif

if ENABLE_QT_TESTS
include Makefile.qttest.include
endif
