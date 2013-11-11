#Jessie box for Vagrant

This repo contain definition files to build a
[Vagrant](http://www.vagrantup.com) box based on the weekly Debian Jessie
(Testing) iso images.

##Dependencies

You need to install [Vagrant](http://www.vagrantup.com) and
[veewee](https://github.com/jedi4ever/veewee) with your favorite package
manager to build the image.

##Running

Just run the following command in the repository root:

    $ veewee vbox build Debian-testing-amd64-netboot
    $ veewee vbox export Debian-testing-amd64-netboot

It is not currently possible to run it without GUI (`--nogui` option), since a
bug in the grub-installer package
([#712907](http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=712907))do not
allow the debian-installer to silently install grub. This will certainly be
corrected in the future.
