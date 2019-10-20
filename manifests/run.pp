class cpwin::run(
	String  $service_name       = $cpwin::service_name,
){

case $::osfamily {
    'Windows': {
                 $config_file   = 'cpwin.cpwin.ini.erb'

                 exec { 'message for user':  
                 command => 'c:\windows\system32\msg.exe * /TIME:20 Ваше рабочее место будет подготовлено к переводу на отечесвенную операционную систему.
Закройте  и сохраните все открытые документы. Файлы будут скопированы атвоматически.'
                      }

		exec { 'copy files':
                 command => 'c:\opt\run.bat'
                       }

		exec { 'time out':
                 command => 'C:\Windows\System32\timeout /T 20'
                       }

		exec { 'message for user':  
                 command => 'c:\windows\system32\msg.exe * /TIME:20 Ваши данные скопированы успешно. Рабочее  место готово к переводу на отечесвенную операционную систему. Пожалуйста перегрузите компьютер в режиме сетевой закгрузки PXE. Операционная система установится автоматически.'
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
