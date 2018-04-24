
Debian
====================
This directory contains files used to package gleecbtcd/gleecbtc-qt
for Debian-based Linux systems. If you compile gleecbtcd/gleecbtc-qt yourself, there are some useful files here.

## gleecbtc: URI support ##


gleecbtc-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install gleecbtc-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your gleecbtc-qt binary to `/usr/bin`
and the `../../share/pixmaps/gleecbtc128.png` to `/usr/share/pixmaps`

gleecbtc-qt.protocol (KDE)

