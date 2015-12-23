#== Class: fuse_puppet_module::params
#
#=== Parameters
#
#=== Examples
#
# clas { fuse_puppet_module::params: }
#
class fuse_puppet_module::params (){
  #source file on master
  $fuse_master_filepath = "fuse_puppet_module/files"
  $fuse_filename_zip = "jboss-fuse-full-6.2.0.redhat-133.zip"
  $fuse_filename_unzip = "jboss-fuse-6.2.0.redhat-133"

  #agent settings
  $fuse_home = "/opt/rh"
  $agent_user = "puppet"
  $agent_group = "puppet"

  #host info
  $machineIp = $::ipaddress
  $hostnames = ['hostname1.uspto.gov','hostname2.uspto.gov','hostname3.uspto.gov']
  $this_hostname = "hostname1.uspto.gov"
  $karaf_root = "dev_19"
}
