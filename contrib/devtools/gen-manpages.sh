#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

GLEECBTCD=${GLEECBTCD:-$BINDIR/gleecbtcd}
GLEECBTCCLI=${GLEECBTCCLI:-$BINDIR/gleecbtc-cli}
GLEECBTCTX=${GLEECBTCTX:-$BINDIR/gleecbtc-tx}
WALLET_TOOL=${WALLET_TOOL:-$BINDIR/gleecbtc-wallet}
GLEECBTCQT=${GLEECBTCQT:-$BINDIR/qt/gleecbtc-qt}

[ ! -x $GLEECBTCD ] && echo "$GLEECBTCD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
read -r -a GLEECVER <<< "$($GLEECBTCCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }')"

# Create a footer file with copyright content.
# This gets autodetected fine for gleecbtcd if --version-string is not set,
# but has different outcomes for gleecbtc-qt and gleecbtc-cli.
echo "[COPYRIGHT]" > footer.h2m
$GLEECBTCD --version | sed -n '1!p' >> footer.h2m

for cmd in $GLEECBTCD $GLEECBTCCLI $GLEECBTCTX $WALLET_TOOL $GLEECBTCQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${GLEECVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${GLEECVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
