if test -f .vbox_version ; then
  # The netboot installs the VirtualBox support (old) so we have to remove it
  if test -f /etc/init.d/virtualbox-ose-guest-utils ; then
    /etc/init.d/virtualbox-ose-guest-utils stop
  fi

  rmmod vboxguest
  aptitude -y purge virtualbox-ose-guest-x11 virtualbox-ose-guest-dkms virtualbox-ose-guest-utils

  # In all lines starting with "deb ", "deb [tab]", or "deb-",
  # delete all instances of "contrib" and "non-free",
  # replace all instances of "main" with "main contrib nonfree"
  sed -e "/^[ \t]*deb[ \t-]/ s/[ \t]contrib//g"\
  -e "/^[ \t]*deb[ \t-]/ s/[ \t]non-free//g"\
  -e "/^[ \t]*deb[ \t-]/ s/[ \t]main/ main contrib non-free /g"\
  "/etc/apt/sources.list" > "/etc/apt/sources.list.new"
  mv /etc/apt/sources.list.new /etc/apt/sources.list
  
  apt-get update
  # Install the VirtualBox guest additions
  apt-get -y install virtualbox-guest-utils

  # Start the newly build driver
  /etc/init.d/virtualbox-guest-utils start

  # Make a temporary mount point
  mkdir /tmp/veewee-validation

  # Test mount the veewee-validation
  mount -t vboxsf veewee-validation /tmp/veewee-validation

fi
