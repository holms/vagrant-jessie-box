# Jessie box for Vagrant (virtualbox)

This repo contain definition files to build a
[Vagrant](http://www.vagrantup.com) box based on the weekly Debian Jessie
(Testing) iso images.

## Dependencies

You need to install [Vagrant](http://www.vagrantup.com) and
[veewee](https://github.com/jedi4ever/veewee) with your favorite package
manager to build the image.

## Running

Just run the following command in the repository root:

    $ veewee vbox build Debian-jessie-amd64-netboot
    $ veewee vbox export Debian-jessie-amd64-netboot

## Issues

You need to choose hdd when asked to install grub.
