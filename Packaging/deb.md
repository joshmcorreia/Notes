# deb (Debian package)

## Operating Systems
There are a lot of Debian-based operating systems, and a list of them can be found on [Wikipedia](https://en.wikipedia.org/wiki/Category:Debian-based_distributions). Some of the more common ones are as follows:
- Debian
- Ubuntu
- Parrot OS
- Kali Linux

## Package Management
The official documentation on Package Management can be found in [the Debian docs](https://www.debian.org/doc/manuals/debian-reference/ch02.en.html)

## postinst Scripts
More information on maintainer scripts can be found in the [Debian Policy Manual](https://www.debian.org/doc/debian-policy/ch-maintainerscripts), but these are some of the highlights from v4.6.1.1.

> They must be proper executable files; if they are scripts (which is recommended), they must start with the usual #! convention. They should be readable and executable by anyone, and must not be world-writable.

> The package management system looks at the exit status from these scripts. It is important that they exit with a non-zero status if there is an error, so that the package management system can stop its processing. For shell scripts this means that you almost always need to use set -e (this is usually true when writing shell scripts, in fact). It is also important, of course, that they exit with a zero status if everything went well.

> It is necessary for the error recovery procedures that the scripts be idempotent. This means that if it is run successfully, and then it is called again, it doesn’t bomb out or cause any harm, but just ensures that everything is the way it ought to be. If the first call failed, or aborted half way through for some reason, the second call should merely do the things that were left undone the first time, if any, and exit with a success status if everything is OK.

> Maintainer scripts are not guaranteed to run with a controlling terminal and may not be able to interact with the user. They must be able to fall back to noninteractive behavior if no controlling terminal is available.

