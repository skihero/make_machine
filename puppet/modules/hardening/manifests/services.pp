# Stop unneeded services 

class hardening::services { 

	define service_stop(){ 
		service  { "${name}": enable => "false", ensure =>"stopped" }
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
	
}


