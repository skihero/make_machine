# Misc settings for the machine 

class settings::misc{

    $misc_packages = ["nmap",
 		      "gcc",
		      "pastebinit.noarch", 
	              "thunderbird",
		      "links",
		      "elinks",
		      "vim",
		      "filezilla", 
		   ]

    package { $misc_packages:
		ensure => installed, 
	    } 

}

