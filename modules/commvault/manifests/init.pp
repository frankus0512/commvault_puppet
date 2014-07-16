class commvault (
  $commvault_inst_tmp	= "/cvtmp",
  $hostname,
  $vif
) {

  # Derived parameters
  $CVTMP		= "$commvault_inst_tmp"

  file {
    ["$CVTMP"]:
      ensure => "directory",
      owner  => "root",
      group  => "root";

    "/tmp/hostname":
      content => "$hostname";
  }

  exec {
    "untar part1":
      command => "/bin/tar xvfz /vagrant/modules/commvault/files/linux-x86_64.tar.gz -C $CVTMP",
      cwd => "$CVTMP",
      creates => "$CVTMP/installer",
      require => File["$CVTMP"],
      user => "root";

    "set temp-hostname":
      command => "/bin/hostname `cat /tmp/hostname`-$vif",
      require => File["/tmp/hostname"],
      user => "root";

    "install cvfsida":
      command => "$CVTMP/installer/silent_install -param /vagrant/modules/commvault/files/cv_fsida.xml",
      cwd => "$CVTMP",
      creates => ["/opt/simpana","/etc/CommVaultRegistry","/var/log/simpana/Log_Files"],
      require => Exec['untar part1','set temp-hostname'],
      user => "root";

    "unset temp-hostname":
      command => "/bin/hostname `cat /tmp/hostname`",
      require => [File["/tmp/hostname"],Exec["install cvfsida"]],
      user => "root";
  }
}
