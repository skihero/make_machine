# 
# Set the sys_date
class settings::rc_files{

    $packages= ["git",
		   ]

    package { $packages:
		ensure => installed, 
	    } 

    # Clone the repository first 
    exec { "clone_rcfiles":
     command => "cd ~ && git clone https://skihero@github.com/skihero/dotfiles.git ", 
     path    => "/usr/local/bin/:/bin/:/usr/bin/",
    }

    # This should happen after the clone 
    exec { "install_rcfiles":
     command => "cd ~/dotfiles && ./install.sh" , 
     path => "/usr/local/bin/:/bin/:/usr/bin/", 
     require => Exec ['clone_rcfiles'], 
    } 
}

