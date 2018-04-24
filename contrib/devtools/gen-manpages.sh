#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

GLEECGBCD=${GLEECGBCD:-$SRCDIR/gleecbtcd}
GLEECGBCCLI=${GLEECGBCCLI:-$SRCDIR/gleecbtc-cli}
GLEECGBCTX=${GLEECGBCTX:-$SRCDIR/gleecbtc-tx}
GLEECGBCQT=${GLEECGBCQT:-$SRCDIR/qt/gleecbtc-qt}

[ ! -x $GLEECGBCD ] && echo "$GLEECGBCD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
GBCVER=($($GLEECGBCCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for gleecbtcd if --version-string is not set,
# but has different outcomes for gleecbtc-qt and gleecbtc-cli.
echo "[COPYRIGHT]" > footer.h2m
$GLEECGBCD --version | sed -n '1!p' >> footer.h2m

for cmd in $GLEECGBCD $GLEECGBCCLI $GLEECGBCTX $GLEECGBCQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${GBCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${GBCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
