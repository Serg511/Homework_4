## Homework_4 - настройка конфигурации веб приложения под высокую нагрузку

Данный Terraform-стенд развертывает следующую конфигурацию:
* 2 виртуальные машины с Nginx, Keepalived
* 3 виртуальные машины с Nginx, PHP-FPM, WordPress
* 1 виртуальная машина с БД MariaDB для WordPress
* 1 виртуальная машина с iscsi

### Используемые инструменты:

* Git
* Ansible
* Terraform

### Описание файлов Terraform:

* .terraformrc - конфигурация Terraform CLI
* main.tf - описание провайдера
* balancers.tf - описание виртуальных машин для Nginx, Keepalived
* web.tf - описание виртуальных машин для Nginx, PHP-FPM, WordPress
* db.tf - описание виртуальных машин для БД MariaDB
* iscsi.tf - описание виртуальной машины с iscsi
* vpc.tf - описание сетевых настроек
* outputs.tf - вывод IP-адресов созданных виртуальных машин, создание файла инвентаря Ansible, файлов hosts, конфигурационного файла Nginx
* hosts.tpl - шаблон для формирования файла hosts
* inventory.tpl - шаблон для формирования файла инвентаря Ansible
* load_balancer.conf.tpl - шаблон для формирования конфигурационного файла балансировщика в Nginx
* meta.txt - пользовательские метаданные
* terraform.tfvars - значения переменных
* variables.tf - описание типов переменных

### Описание ролей Ansible:

* config-gfs2 - роль для настройки GFS2
* iscsi-client - роль для установки и настройки инициатора iscsi
* iscsi-target - роль для установки и настройки таргета iscsi
* load_balancer -роль для установки и настройки Nginx, Keepalived  
* mariadb - роль для установки и настройки MariaDB
* pacemaker - роль для установки и настройки pacemaker
* tune-cluster - роль для создания ресурсов в Pacemaker
* web - роль для установки и настройки Nginx, PHP-FPM
* wp - роль для установки и настройки WordPress
### Порядок запуска:

1. Скопировать данный репозиторий ```git clone <this repo>```
2. Сгенерировать открытый и закрытый ключ для доступа к виртуальной машине ```ssh-keygen``` 
3. Отредактировать файлы ```meta.txt``` и ```terraform.tfvars```
4. Перейти в каталог terraform и последовательно выполнить команды ```terraform init``` ```terraform plan``` ```terraform apply```
5. Перейти в каталог ansible и выполнить команду ```ansible-playbook main.yml```