# 
# Setup the packages needed for the 
# usual development.
#  
class devtools::misc{

    $misc_dev_packages = ["man-pages.noarch", 
			  "glibc-devel", 
			   ]

    package { $misc_dev_packages:
		ensure => installed, 
	    } 

}

