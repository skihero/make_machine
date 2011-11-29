# Class hosts
#
# Manages /etc/hosts
#
class hosts {

    file { "hosts":
        ensure => present,
        path => "/etc/hosts_test",
        content => template("hosts/hosts.erb"),
    }

    if $my_project { include "hosts::${my_project}" }

}

