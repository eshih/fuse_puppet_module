# == Class: fuse_puppet_module::config
#
#  Copy over fuse configuration files from master source
#
# === Parameters
class fuse_puppet_module::config (
  $fuse_home            = $fuse_puppet_module::params::fuse_home,
  $fuse_master_filepath = $fuse_puppet_module::params::fuse_master_filepath,
  $fuse_filename_zip    = $fuse_puppet_module::params::fuse_filename_zip,
  $fuse_filename_unzip  = $fuse_puppet_module::params::fuse_filename_unzip,
  $agent_user           = $fuse_puppet_module::params::agent_user,
  $agent_group          = $fuse_puppet_module::params::agent_group,
) inherits fuse_puppet_module::params {
 /* 
  #user.properties file
   file { "${fuse_home}/${fuse_filename_unzip}/etc/user.properties":
    content => template('fuse_puppet_module/user.properties.erb'),
  }

  #system.properties file
  file { "${fuse_home}/${fuse_filename_unzip}/etc/system.properties":
    content => template('fuse_puppet_module/system.properties.erb'),
  }*/

  #ActiveMQ.xml config file
  file { "${fuse_home}/${fuse_filename_unzip}/etc/activemq.xml":
    content => template('fuse_puppet_module/activemq.xml.erb'),
  }


}
