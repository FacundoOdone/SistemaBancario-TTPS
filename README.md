# Sistema Bancario

Este es mi trabajo final para la materia TTPS-Ruby
Alumno: Facundo Nahuel Odone
Legajo: 18678/1

El sistema esta realizado con:
° Ruby Version: 2.7.6
° Rails Version: 7.0.4
° Base de datos PostgreSQL, Version: 15

Al momento de realizar el trabajo, se tomaron algunas decisiones:
° Para indicar que una sucursal se encuentra cerrada, al momento de crear o modificar el horario, debera indicarse el horario "00:00:00"
° Las sucursales no abren los dias domingo, en caso de ser necesario, esto puede modificarse.

Pasos para poder iniciar la aplicacion (Pasos secuenciales, realizar en el orden indicado)
1- Tener el repositorio de manera local
2- Configurar las credenciales de la BD en el archivo "databse.yml", el mismo se encuentra en la carpeta config
3- Abrir una terminal y movernos hasta el proyecto para poder ingresar los siguientes comandos para iniciar la BD(En orden)
a- rails db:create
b- rails db:migrate
c- rails db:seed
4- Una vez creada la BD, utilizamos el comando "rails s" para iniciar la app, la misma se inicia en la direccion "localhost:3000"

El comando db:seed iniciara La sucursal de prueba, su horario de prueba y 3 usuarios, los cuales son:
°Admin- email:"admin@admin.com" contraseña: "adminadmin"
°Operador- email:"operador@operador.com" contraseña: "operadoroperador"
°Cliente- email: "cliente@cliente.com" contraseña:"clientecliente"
