# Class hosts
#
# Manages /etc/hosts
#
class  virtualize{

    $virt_packages = ["VirtualBox-4.1", 
		   ]

    package { $virt_packages:
		ensure => installed, 
	    } 


}

