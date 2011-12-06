# 
# Set the sys_date
class settings::sys_date{

    $date_packages = ["ntpdate",
		   ]

    package { $date_packages:
		ensure => installed, 
	    } 

    exec { "update_time":
    command => "ntpdate  0.pool.ntp.org",
    path    => "/usr/local/bin/:/bin/:/usr/sbin/",
    # path    => [ "/usr/local/bin/", "/bin/" ],  # alternative syntax
    }
}

