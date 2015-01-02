class commvault (
  $commvault_inst_tmp,
  $tmpdir,
  $csname
) {

  # Derived parameters
  $CVTMP		= "$commvault_inst_tmp"

  file {
    ["$CVTMP"]:
      ensure => "directory",
      owner  => "root",
      group  => "root";
  }

  exec {
    "untar part1":
      command => "/bin/tar xvfz /home/vagrant/linux-x86_64.tar.gz -C $CVTMP",
      cwd => "$CVTMP",
      creates => "$CVTMP/installer",
      require => File["$CVTMP"],
      user => "root";

    "install cvfsida":
      command => "$CVTMP/installer/silent_install -param $tmpdir/modules/commvault/files/install.xml",
      cwd => "$CVTMP",
      creates => ["/opt/simpana","/etc/CommVaultRegistry","/var/log/simpana/Log_Files"],
      require => Exec['untar part1'],
      user => "root";
  }
}

# vim:set ts=2 sw=2 et:
