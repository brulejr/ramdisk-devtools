ramdisk-devtools
================

SUMMARY - TODO


#### Setup

Since installation is currently manual, perform the following steps to setup this development RAM disk:

##### Perl JSON Module
Download the Perl JSON module, and install it using the following steps:

```bash
$ tar zxvf JSON-2.53.tar.gz
$ cd JSON-2.53/
$ perl Makefile.PL INSTALL_BASE=/usr/local
$ make
$ make test
$ make install
```
