## Instalación de Drupal en contenedores con Docker Compose

Este archivo de Docker Compose contiene la configuración para ejecutar Drupal 8 con Apache y MySQL 8.0 en contenedores separados. Se incluyen también volúmenes para persistir los datos de la base de datos y los archivos de configuración y contenido de Drupal.

### Componentes

El archivo de Docker Compose contiene dos servicios principales:

#### Drupal

Este servicio usa la imagen `drupal:8-apache` que contiene la versión 8 de Drupal junto con el servidor web Apache. Este servicio se expone en el puerto 8080 del host y está configurado para conectarse al servicio de base de datos MySQL en el puerto 3306. 

El servicio de Drupal utiliza cinco volúmenes que se utilizan para persistir la configuración y el contenido de Drupal:

- `drupal-config`: este volumen contiene los archivos de configuración de Drupal, incluyendo `settings.php`.
- `drupal-modules`: este volumen contiene los módulos personalizados de Drupal.
- `drupal-profiles`: este volumen contiene los perfiles de Drupal.
- `drupal-themes`: este volumen contiene los temas personalizados de Drupal.
- `drupal-sites`: este volumen contiene los sitios instalados de Drupal.

El servicio de Drupal también define cuatro variables de entorno que se utilizan para conectar al servicio de base de datos MySQL:

- `MYSQL_DATABASE`: el nombre de la base de datos de Drupal.
- `MYSQL_USER`: el nombre de usuario de la base de datos de Drupal.
- `MYSQL_PASSWORD`: la contraseña del usuario de la base de datos de Drupal.
- `MYSQL_HOST`: el nombre del servicio de MySQL que se utilizará para conectar desde Drupal.

#### MySQL

Este servicio usa la imagen `mysql:8.0` que contiene la versión 8 de MySQL. Este servicio se expone en el puerto 3306 del host.

El servicio de MySQL utiliza un volumen llamado `mysql-data` que se utiliza para persistir los datos de la base de datos de MySQL.

El servicio de MySQL también define cuatro variables de entorno que se utilizan para configurar la base de datos de MySQL:

- `MYSQL_DATABASE`: el nombre de la base de datos de Drupal.
- `MYSQL_USER`: el nombre de usuario de la base de datos de Drupal.
- `MYSQL_PASSWORD`: la contraseña del usuario de la base de datos de Drupal.
- `MYSQL_ROOT_PASSWORD`: la contraseña de root de MySQL.

### Puerto de exposición

- Servicio de Drupal: se expone en el puerto 8080 del host.
- Servicio de MySQL: se expone en el puerto 3306 del host.

Es importante tener en cuenta que los puertos de exposición se pueden cambiar en el archivo de Docker Compose si se desea.

## Script para exportar de un volumen en Docker

Este es un script en Bash que permite exportar un volumen de Docker en un archivo `.tar.gz`.

Para ejecutar el script se debe especificar el nombre del volumen que se desea respaldar de la siguiente manera:

```
./exportar.sh NOMBRE_DEL_VOLUMEN
```


## Descripción del script de creación de volumen Docker

El siguiente script de Bash permite crear un volumen Docker con un nombre especificado y exportar su contenido a un archivo `.tar.gz`.

Para ejecutar el script se debe especificar el nombre del volumen importar los datos y el nombre del archivo que se va a importar siguiente manera:

```
./importar.sh NOMBRE_DEL_VOLUMEN NOMBRE_DEL_TAR
```



