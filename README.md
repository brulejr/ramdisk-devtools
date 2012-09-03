ramdisk-devtools
================

SUMMARY - TODO


### Setup

Since installation is currently manual, perform the following steps to setup this development RAM disk:

Download the [Perl JSON module](http://search.cpan.org/~makamaka/JSON-2.53/lib/JSON.pm) into a temporary directory, 
and install it using the following steps:

```bash
user@host:~/tmp$ tar zxvf JSON-2.53.tar.gz
user@host:~/tmp$ cd JSON-2.53/
user@host:~/tmp$ perl Makefile.PL INSTALL_BASE=/usr/local
user@host:~/tmp$ make
user@host:~/tmp$ make test
user@host:~/tmp$ make install
```

Download the [File Slurp module](http://search.cpan.org/~uri/File-Slurp-9999.19/lib/File/Slurp.pm) into a temporary 
directory, and install it using the following steps:

```bash
user@host:~/tmp$ tar zxvf File-Slurp-9999.19.tar.gz
user@host:~/tmp$ cd File-Slurp-9999.19/
user@host:~/tmp$ perl Makefile.PL INSTALL_BASE=/usr/local
user@host:~/tmp$ make
user@host:~/tmp$ make test
$ make install
```