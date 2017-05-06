## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# Disable filebucket by default for all File resources:
File { backup          => false }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

$test_top_scope = "Top Scope"

node 'ubt14pupn1.smtrlab' {
  #include ntp
  #include ntp
  #include ntp
  #class { 'ntp': }

  notify { "This mathces the node name **********": }

}

node /^c7pupn1/ {
  notify { "This is a node defination using regex!!!!!!!!!!!!!!!!!": }
}
node /^c6pupn1/ {
  notify { "This is a is ---centos 6 node scope-- node defination ": }
}

node 'c7pupmaster1.smtrlab.com' {
 include pe_repo::platform::el_6_x86_64
 include pe_repo::platform::ubuntu_1204_amd64
}

node default {
  #  $test_top_scope = "This is node  Scope"
  #$node_scope_var = "this is a node scope"
#include ntp
#class { 'java': }
#  notify { "This is my default node title-----": }
# notify { "test_top_scope":

# message => "This is a top scope var: ${test_top_scope}"

  }
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
}

