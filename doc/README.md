GleecBTC Core
=============

Setup
---------------------
GleecBTC Core is the original GleecBTC client and it builds the backbone of the network. It downloads and, by default, stores the entire history of GleecBTC transactions, which requires a few hundred gigabytes of disk space. Depending on the speed of your computer and network connection, the synchronization process can take anywhere from a few hours to a day or more.

To download GleecBTC Core, visit [gleecbtc.com](https://gleecbtc.com/en/download/).

Running
---------------------
The following are some helpful notes on how to run GleecBTC Core on your native platform.

### Unix

Unpack the files into a directory and run:

- `bin/gleecbtc-qt` (GUI) or
- `bin/gleecbtcd` (headless)

### Windows

Unpack the files into a directory, and then run gleecbtc-qt.exe.

### macOS

Drag GleecBTC Core to your applications folder, and then run GleecBTC Core.

### Need Help?

* See the documentation at the [GleecBTC Wiki](https://en.gleecbtc.it/wiki/Main_Page)
for help and more information.
* Ask for help on [#gleecbtc](http://webchat.freenode.net?channels=gleecbtc) on Freenode. If you don't have an IRC client, use [webchat here](http://webchat.freenode.net?channels=gleecbtc).
* Ask for help on the [GleecBTCTalk](https://gleecbtctalk.org/) forums, in the [Technical Support board](https://gleecbtctalk.org/index.php?board=4.0).

Building
---------------------
The following are developer notes on how to build GleecBTC Core on your native platform. They are not complete guides, but include notes on the necessary libraries, compile flags, etc.

- [Dependencies](dependencies.md)
- [macOS Build Notes](build-osx.md)
- [Unix Build Notes](build-unix.md)
- [Windows Build Notes](build-windows.md)
- [FreeBSD Build Notes](build-freebsd.md)
- [OpenBSD Build Notes](build-openbsd.md)
- [NetBSD Build Notes](build-netbsd.md)
- [Gitian Building Guide (External Link)](https://github.com/gleecbtc-core/docs/blob/master/gitian-building.md)

Development
---------------------
The GleecBTC repo's [root README](/README.md) contains relevant information on the development process and automated testing.

- [Developer Notes](developer-notes.md)
- [Productivity Notes](productivity.md)
- [Release Notes](release-notes.md)
- [Release Process](release-process.md)
- [Source Code Documentation (External Link)](https://dev.visucore.com/gleecbtc/doxygen/)
- [Translation Process](translation_process.md)
- [Translation Strings Policy](translation_strings_policy.md)
- [JSON-RPC Interface](JSON-RPC-interface.md)
- [Unauthenticated REST Interface](REST-interface.md)
- [Shared Libraries](shared-libraries.md)
- [BIPS](bips.md)
- [Dnsseed Policy](dnsseed-policy.md)
- [Benchmarking](benchmarking.md)

### Resources
* Discuss on the [GleecBTCTalk](https://gleecbtctalk.org/) forums, in the [Development & Technical Discussion board](https://gleecbtctalk.org/index.php?board=6.0).
* Discuss project-specific development on #gleecbtc-core-dev on Freenode. If you don't have an IRC client, use [webchat here](http://webchat.freenode.net/?channels=gleecbtc-core-dev).
* Discuss general GleecBTC development on #gleecbtc-dev on Freenode. If you don't have an IRC client, use [webchat here](http://webchat.freenode.net/?channels=gleecbtc-dev).

### Miscellaneous
- [Assets Attribution](assets-attribution.md)
- [gleecbtc.conf Configuration File](gleecbtc-conf.md)
- [Files](files.md)
- [Fuzz-testing](fuzzing.md)
- [Reduce Memory](reduce-memory.md)
- [Reduce Traffic](reduce-traffic.md)
- [Tor Support](tor.md)
- [Init Scripts (systemd/upstart/openrc)](init.md)
- [ZMQ](zmq.md)
- [PSBT support](psbt.md)

License
---------------------
Distributed under the [MIT software license](/COPYING).
This product includes software developed by the OpenSSL Project for use in the [OpenSSL Toolkit](https://www.openssl.org/). This product includes
cryptographic software written by Eric Young ([eay@cryptsoft.com](mailto:eay@cryptsoft.com)), and UPnP software written by Thomas Bernard.
