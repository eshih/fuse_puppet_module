# == Class: fuse_puppet_module::install
#
#  Copy over fuse file if necessary and unzip.
#
# === Parameters
class fuse_puppet_module::install (
  $fuse_home            = $fuse_puppet_module::params::fuse_home,
  $fuse_master_filepath = $fuse_puppet_module::params::fuse_master_filepath,
  $fuse_filename_zip    = $fuse_puppet_module::params::fuse_filename_zip,
  $fuse_filename_unzip  = $fuse_puppet_module::params::fuse_filename_unzip,
  $agent_user           = $fuse_puppet_module::params::agent_user,
  $agent_group          = $fuse_puppet_module::params::agent_group,
) inherits fuse_puppet_module::params {
  
  file { ["/opt/${fuse_filename_zip}"]:
    ensure => file,
    owner => "${agent_user}",
    group => "${agent_group}",
    mode => '644',
    #source => "puppet://$::server/modules/${fuse_master_filepath}/${fuse_filename_zip}",
    source => "puppet://$::server/modules/fuse_puppet_module/${fuse_filename_zip}",
  }
  ->
  file{ '/opt/rh':
    ensure => directory,
  }
  ->
  exec { "unzip fuse" :
    cwd => "/opt",
    path => ["/usr/bin", "/usr/sbin"],
    command => "unzip ${fuse_filename_zip} -d /opt/rh",
    #creates => "/opt/rh/jboss-fuse",
    onlyif => "test ! -d /opt/rh/${fuse_filename_unzip}",
  }

#  file { "${fuse_home}/rh/jboss-fuse/jboss-fuse-6.2.0.redhat-133/etc/activemq.xml":
#    content => template('fuse/activemq.xml.erb'),
#  }

/*
- modify FUSE_HOME/etc/activemq.xml openwire hostname (try to write this using template file?, hostname needs to be dynamic)
*/
  /*file { ["${RH_HOME}"]:
    ensure => "directory",
    owner  => "${USER_USERNAME}",
    group  => "${USER_USERNAME}",
    mode   => "0755"
  }*/
}
