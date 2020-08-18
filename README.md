# Ingenieria-de-Sofware


#Página online Doc

  Es una pagina web  con la cua una persona podria tener una cita online con un doctor aparte de comprara medicacmentos
  
  
#Proposito del Proyect ⚙️

El proposito del proyecto es crear una linea de medicos online que puedan ayudar a pacientes enfermos en todas sus ubicaciones y condiciones para la atencion.


#Funcionalidades 📋
-Las funcionalidades de la app son las siguientes:

 1) Comunicacion usuario con la base de datos y los doctores en linea.
 2) Efectuar registros de citas, pagos y atenciones
 3)Guardar un control o historial de todas las atenciones que se tubo
 
 
#Practicas de codigo legible 📋

Comenzando 🚀


Para iniciar el registro se deben abriri los archivos html donde se reguistra todo.
-identacion
-Variables entendibles

#Pre-requisitos 📋

Para correr el proyecto necesitaras Postgresql, html y php, en este caso se necesita xammp con el pache encendido.

#Instalación 🔧

La instalacion es simple con el postgres y el xammp, 

Para los php y html se tines estos que guardar en la carpeta htdocs de xammp, puede ser una carpeta dentro de esa misma ya mencionada antes.

#Estilos  ⌨️

---#Things:

Los Objetos creados, QUe ene ste caso son las entidades creadas en la base de datos obviamente con postgresql

Base de  datos Farmacia:

Entrar aqui.

https://github.com/luisfe12/Ingenieria-de-Sofware/blob/master/BaseDeDatos.txt

---#Trinity

------------##SE usa el modelo vista controlador. gracias al php y html.


------------####EL PHP

	<?php
	error_reporting(E_ALL);
	ini_set('display_errors', 1);

	$user = 'postgres';
	$password = 'unsa';
	$db = 'Farmacia';
	$port = 5432;
	$host = 'localhost';
	$strCnx = "host = $host port = $port dbname = $db user = $user password = $password";

	try
	{
	    $cnx = pg_connect($strCnx) or die ("Error conexion. ". pg_last_error());
	}
	catch(Exception $e)
	{
	    echo 'Exception', $e->getMessage();
	}

	try
	{
	    $codigo_usuario = $_POST['codigo_usuario'];
	    $dni_usuario = $_POST['dni_usuario'];
	    $sql = "INSERT INTO usuario VALUES ('$codigo_usuario', '$dni_usuario');" ;
	    $query = pg_query($cnx, $sql);
	    $result = (int) pg_affected_rows($query);
	    if($result > 0)
		echo "insertado";
	    else
		echo "no insertado";
	    pg_close($cnx);
	}
	catch(Exception $e)
	{
	    echo 'Exception: ' , $e->getMessage(); 
	}
	?>

-------------####El html

	<!DOCTYPE html>

	<html lang = "es" xml:lang= "es" >

	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset = UTF-8" />
	    <title>Usuario registro </title>
	</head>


	<body>
	    <h1>Categoria Nueva </h1>
	     <form action= "Re_usuario.php" method="POST">
		<tr>
		    <td><label>Código de usuario:</label></td>
		    <td><input type="text" name="codigo_usuario" /></td>
		</tr>
		<tr>
		    <td><label>dni del usuarioe:</label></td>
		    <td><input type="text" name="dni_usuario" /></td>
		</tr>


		<input type="submit" value="Registrar">
	    </table>
	</body>
	</html>



---#spreadsheet


Se usa este estila debido a que hay tablas implementadas en el postgresql como lo siguiente ejemplo en doctor 


	CREATE TABLE IF NOT EXISTS doctor(
		codigo_doctor varchar(8) NOT NULL PRIMARY KEY,
		dni_doctor varchar(8) NOT NULL,
		especialidad varchar(20) NOT NULL,
		salario decimal(6,2) NOT NULL,
		horario_entrada time NOT NULL,
	    horario_salida time NOT NULL,
		FOREIGN KEY (dni_doctor) REFERENCES persona(dni)
	);






#Uso de DDD


----------#Entidades 

Las entidades son objetos del modelo que se caracterizan por tener identidad en el sistema.
Deben poder ser distinguidas de otros objetos aunque tengan los mismos atributos. Tienen que poder ser consideradas iguales a otros objetos aún cuando sus atributos difieren.
En este caso Usare la tabla personas ya que son sus atributos variads los que los distinguen 

	CREATE TABLE IF NOT EXISTS persona(
		dni varchar(8) NOT NULL PRIMARY KEY,
		nombre varchar(20) NOT NULL,
		apellido_paterno varchar(20) NOT NULL,
		apellido_materno varchar(20) NOT NULL,
	    celular varchar(9)
	);


---------#Servivies 
SERVICIOS 


Los servicios representan operaciones, acciones o actividades que no pertenecen conceptualmente a ningún objeto.
Al contrario que las entidades y los value objects, los servicios son definidos en términos de lo que pueden hacer por un cliente, y por tanto tienden a ser nombrados como verbos.

Aqui podemos ver como el registrar usario cumple con eso ya que es para el cliente y es una accion

-------------------------###Primero el php

	<?php
	error_reporting(E_ALL);
	ini_set('display_errors', 1);

	$user = 'postgres';
	$password = 'unsa';
	$db = 'Farmacia';
	$port = 5432;
	$host = 'localhost';
	$strCnx = "host = $host port = $port dbname = $db user = $user password = $password";

	try
	{
	    $cnx = pg_connect($strCnx) or die ("Error conexion. ". pg_last_error());
	}
	catch(Exception $e)
	{
	    echo 'Exception', $e->getMessage();
	}

	try
	{
	    $codigo_usuario = $_POST['codigo_usuario'];
	    $dni_usuario = $_POST['dni_usuario'];
	    $sql = "INSERT INTO usuario VALUES ('$codigo_usuario', '$dni_usuario');" ;
	    $query = pg_query($cnx, $sql);
	    $result = (int) pg_affected_rows($query);
	    if($result > 0)
		echo "insertado";
	    else
		echo "no insertado";
	    pg_close($cnx);
	}
	catch(Exception $e)
	{
	    echo 'Exception: ' , $e->getMessage(); 
	}
	?>

-----------------------###Ahora el html

	<!DOCTYPE html>

	<html lang = "es" xml:lang= "es" >

	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset = UTF-8" />
	    <title>Categoria de producto </title>
	</head>


	<body>
	    <h1>Catgoria Nueva </h1>
	     <form action= "Re_persona.php" method="POST">
		<tr>
		    <td><label>DNI:</label></td>
		    <td><input type="text" name="dni" /></td>
		</tr>
		<tr>
		    <td><label>Nombre:</label></td>
		    <td><input type="text" name="nombre" /></td>
		</tr>
		<tr>
		    <td><label>Apellido Paterno:</label></td>
		    <td><input type="text" name="apellido_paterno" /></td>
		</tr>
		 <tr>
		    <td><label>Apellido Materno:</label></td>
		    <td><input type="text" name="apellido_materno" /></td>
		</tr>
		<tr>
		    <td><label>Celular:</label></td>
		    <td><input type="text" name="celular" /></td>
		</tr>
		<input type="submit" value="Registrar">

	    </table>
	</body>
	</html>



