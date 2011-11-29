# Class hosts
#
# Manages /etc/hosts
#
class multimedia{

    $mm_packages = ["vlc",
		    "gstreamer-plugins-ugly", 
		    "flash-plugin",
		   ]

    package { $mm_packages: 
		ensure => installed, 
	    } 


}

