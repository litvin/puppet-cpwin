class cpwin::params {
	$service_name    = 'cpwin'
	$service_status  = true

case $::osfamily {
    'Windows': {
	$config_file   = 'win.cpwin.ini.erb'
            }
    'Debian': {
	$config_file   = 'deb.cpwin.ini.erb'
	    }
    'Redhat': {
	$config_file   = 'rh.cpwin.ini.erb'
	    }
      }

}

