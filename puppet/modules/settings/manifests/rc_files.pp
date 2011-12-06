# 
# Set the sys_date
class settings::rc_files{

    $packages= ["git",
		   ]

    package { $packages:
		ensure => installed, 
	    } 

    exec { "clone_rcfiles":
    command => "ntpdate  0.pool.ntp.org",
    path    => "/usr/local/bin/:/bin/:/usr/bin/",
    # path    => [ "/usr/local/bin/", "/bin/" ],  # alternative syntax
    }
}

