class cpwin::run(
	String  $service_name       = $cpwin::service_name,
	Boolean $service_status     = $cpwin::service_status,
){

case $::osfamily {
    'Windows': {
                 $config_file   = 'cpwin.cpwin.ini.erb'
                 exec { 'copy files':  
                 command => 'c:\opt\run.bat'
                       }

                 exec { 'message for user':  
                 command => 'c:\windows\system32\msg.exe * /TIME:20 Ваше рабочее место готово к переводу на отечесвенную операционную систему.
Пожалуйста перегрузите компьютер в режиме сетевой закгрузки PXE. Операционная система установится автоматически.'
                      }
		 }

    'Debian':    {
	$config_file   = 'deb.cpwin.ini.erb'
                  }

    'Redhat':     {
	$config_file   = 'rh.cpwin.ini.erb'
                  }
      }
}
