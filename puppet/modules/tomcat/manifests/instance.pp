#
# Define a tomcat instance  
# 
# Could have done this in the main class 
# but multiple instances may be needed

define tomcat::instance ( 
  $instance_name          = $name,
  $basedir                = '/usr/local/release3',
  $dirmode                = '0755',
  $filemode               = '0644',
  $owner                  = 'root',
  $group                  = 'root'
) { 

#  $httpport               = '8080',
#  $controlport            = '8005',
#  $ajpport                = '8009',
#  $magicword              = 'SHUTDOWN',
#  $backupsdir             = '',
#  $rundir                 = '',
#  $logdir                 = '',
#  $catalinaproperties     = '',
#  $inittemplate           = 'tomcat/init.erb',
#  $startupshtemplate      = 'tomcat/startup.sh.erb',
##  $shutdownshtemplate     = 'tomcat/shutdown.sh.erb',
#  $setenvshtemplate       = 'tomcat/setenv.sh.erb',
#  $paramstemplate         = 'tomcat/params.erb',
#  $tomcatuser             = '',
#  $tomcatpassword         = '',

# Use the name variable used 
# while invoking 

# $instance_name = "${name}"

# CATALINA BASE
$instance_path = "${basedir}/${instance_name}"

# Log dir 
$instance_logdir = "${instance_path}/logs"

# TODO:
# Look for xml templates specific to a instance

$serverxmltemplate 	  = "tomcat/serverxmltemplate"
$webxmltemplate 	  = "tomcat/webxmltemplate" 
$contextxmltemplate 	  = "tomcat/contextxmltemplate" 
$tomcatusersxmltemplate   = "tomcat/tomcatusersxmltemplate"
$catalinaproptemplate     = "tomcat/catalinaproptemplate"
$catalinashtemplate     = "tomcat/catalinashtemplate"

# Create the root dir

file { "tomcat_dir-basedir":
  ensure => directory, 
  path => "${basedir}",
  mode => $dirmode, 
  owner   => $owner,
  group   => $group,
  recurse => true,
}


file { "tomcat_dir-${instance_name}":
  ensure => directory, 
  path => "${basedir}/${instance_name}", 
  mode => $dirmode, 
  owner   => $owner,
  group   => $group,
  #recurse => true,
}

# Create bin dir

file { "tomcat_bindir-${instance_name}":
  ensure  => directory,
  path    => "${instance_path}/bin",
  mode    => $dirmode,
  owner   => $owner,
  group   => $group,
}


# Create conf dir

file { "tomcat_confdir-${instance_name}":
  ensure  => directory,
  path    => "${instance_path}/conf",
  mode    => $dirmode,
  owner   => $owner,
  group   => $group,
}



# Create log dir

file { "tomcat_logdir-${instance_name}":
  ensure  => directory,
  path    => $instance_logdir,
  mode    => $dirmode,
  owner   => $owner,
  group   => $group,
}


file { "instance_tomcat_server.xml_${instance_name}":
  ensure  => present,
  path    => "${instance_path}/conf/server.xml",
  mode    => $filemode,
  owner   => $owner,
  group   => $group,
  content => template("$serverxmltemplate"),
}

file { "instance_tomcat_web.xml_${instance_name}":
  ensure  => present,
  path    => "${instance_path}/conf/web.xml",
  mode    => $filemode,
  owner   => $owner,
  group   => $group,
  content => template("$webxmltemplate"),
}


file { "instance_tomcat_tomcat_users.xml_${instance_name}":
  ensure  => present,
  path    => "${instance_path}/conf/tomcat_users.xml",
  mode    => $filemode,
  owner   => $owner,
  group   => $group,
  content => template("$tomcatusersxmltemplate"),
}

file { "instance_tomcat_context.xml_${instance_name}":
  ensure  => present,
  path    => "${instance_path}/conf/context.xml",
  mode    => $filemode,
  owner   => $owner,
  group   => $group,
  content => template("$contextxmltemplate"),
}

file { "instance_tomcat_catalina.properties_${instance_name}":
  ensure  => present,
  path    => "${instance_path}/conf/catalina.properties",
  mode    => $filemode,
  owner   => $owner,
  group   => $group,
  content => template("$catalinaproptemplate"),
}

#
# Setup the bin dir 
#

file { "instance_tomcat_catalina.sh_${instance_name}":
  ensure  => present,
  path    => "${instance_path}/bin/catalina.sh",
  mode    => $filemode,
  owner   => $owner,
  group   => $group,
  content => template("$catalinashtemplate"),
}


} 
