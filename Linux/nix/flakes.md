# Nix Flakes

- [nix flake - Nix Reference Manual](https://nix.dev/manual/nix/latest/command-ref/new-cli/nix3-flake)
- [Ultimate Nix Flakes Guide - Vimjoyer - YouTube](https://www.youtube.com/watch?v=JCeYq72Sko0)

## Enable flakes
Add the following to `/etc/nix/nix.conf`:
```
experimental-features = nix-command flake
```

## Create a flake
```
$ mkdir ~/myflake
$ cd ~/myflake
$ nix flake init
wrote: /home/josh/myflake/flake.nix
```

## See what a flake provides
```
$ nix flake show
path:/home/josh/myflake?lastModified=1729116291&narHash=sha256-UZzL9uKeKg2/PqRcpkt62s89/cJG1XyoTnfSCe94hVE%3D
└───packages
    └───x86_64-linux
        ├───default: package 'hello-2.12.1'
        └───hello: package 'hello-2.12.1'
```

## See flake metadata
```
$ nix flake metadata
Resolved URL:  path:/home/josh/myflake
Locked URL:    path:/home/josh/myflake?lastModified=1729116291&narHash=sha256-UZzL9uKeKg2/PqRcpkt62s89/cJG1XyoTnfSCe94hVE%3D
Description:   A very basic flake
Path:          /nix/store/5g50rziciq5wwxzwxvhysyvi5622m48l-source
Last modified: 2024-10-16 15:04:51
Inputs:
└───nixpkgs: github:nixos/nixpkgs/a3c0b3b21515f74fd2665903d4ce6bc4dc81c77c
```
