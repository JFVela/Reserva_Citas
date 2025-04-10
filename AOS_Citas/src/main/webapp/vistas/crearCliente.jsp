<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>Agregar Cliente</h1>
		<!-- En action ponemos el nombre del controlador de la carpeta "Controlador" -->>
		<form action="ControladorCliente">
			DNI: <br> <input type="number" name="txtDNI"> <br>
			Nombres: <br> <input type="text" name="txtNombres"> <br>
			Apellido Paterno: <br> <input type="text" name="txtApePaterno"><br>
			Apellido Materno: <br> <input type="text" name="txtApeMaterno">
			<br> Edad: <br> <input type="number" name="txtEdad">
			<br> Token: <br> <input type="text" name="txtToken">
			<br> <input type="submit" name="accion"
				value="clienteFormulario">
		</form>
	</div>

</body>
</html>