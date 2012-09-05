ramdisk-devtools
================

This project provides an Ubuntu / Debian Linux environment with a RAM disk auto-loaded with development tools 
that benefit from memory-speed access. For example, both the [Java JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
and [Spring Tool Suite](http://www.springsource.org/sts) can bootstrap and run considerably faster when loaded
from a RAM disk.

A JSON configuration file dictates which tools are loaded and how they are mapped into the environment. Currently, only
*tgz* format is supported, although that will change to include *zip* as well. Eventually, lifecycle scripts will
be integrated to allow any arbitrary distribution format to be used so long as an appropriate handler is provided on
a package-basis.

### Setup

Install the auto-loading RAM disk using its Debian package by performing the following comand:
```
root@host:~# dpkg --install ramdisk-devtools_0.0.1.deb 
```

This will prompt for two parameteric settings:
1. The directory on which the RAM disk will be mounted (defaults to **/media/ramdisk**)
2. The size of the RAM disk (defaults to **1024M**)

### Configuration

Refer to the [Configuration](https://github.com/brulejr/ramdisk-devtools/wiki/Configuration) page for the details on 
tuning the RAM disk and its auto-loading of packages.