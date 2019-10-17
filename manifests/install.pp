class cpwin::install(
	String $service_name   = $cpwin::service_name,
	String $service_status = $cpwin::service_status,
){
case $::osfamily {
    'Windows': { 
	$config_file   = 'win.cpwin.ini.erb'
	file { 'c:/opt': 
	  ensure => directory,
	    }

	file { 'c:\opt\run.bat':  
	  ensure  => file,
	  content => "copy /Y C:\Users\userxxx.IZ\Documents\*  \\\\iz-srv03\data1\userxxx\BackUP",
	    }        

            }
    'Debian': {
	$config_file   = 'deb.cpwin.ini.erb'
	    }

    'Redhat': {
	$config_file   = 'rh.cpwin.ini.erb'
	    }
      }
}
