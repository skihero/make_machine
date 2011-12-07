# 
# Set the sys_date
class settings::misc{

    $misc_packages = ["nmap",
 		      "gcc",
		      "pastebinit.noarch", 
	              "thunderbird",
		      "links",
		      "elinks",
		      "filezilla", 
		   ]

    package { $misc_packages:
		ensure => installed, 
	    } 

}

