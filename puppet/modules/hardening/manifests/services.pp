# Stop unneeded services 

class hardening::services { 

	define service_stop(){ 
		service { "${name}": 
				enable => "false", 
				ensure =>"stopped", 
			} # service 
	
		notice('service ${name} stopped')
	}

   
	service_stop { ['anacron',
			'autofs',
			'avahi-daemon',
			'avahi-dnsconfd', 
			'gpm',
			'netfs',
			'nfs',
			'nfslock',
			'portmap',
			'rpcgssd', 
			'rpcsvcgssd',
			'rpcidmapd',
			'ypbind',
			'bluetooth',
			'hidd', 
			]:
	}

       
       $services_stopped_flag = "/var/lock/puppet_service_lock"  
       exec { "set_stopped_flag":                                     
               command => "/bin/touch $services_stopped_flag",        
       }                                                              
       notice ('after exec' )                                         


	
}

