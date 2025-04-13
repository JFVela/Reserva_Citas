<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here hola</title>
</head>
<body>
	<div>
		<h1>Agregar Paciente</h1>
		<form action="ControladorCliente" method="get">
			<input type="hidden" name="accion" value="clienteFormulario">

			DNI: <br> <input type="number" name="txtDNI" required> <br>
			Nombres: <br> <input type="text" name="txtNombres" required>
			<br> Apellido Paterno: <br> <input type="text"
				name="txtApePaterno" required><br> Apellido Materno: <br>
			<input type="text" name="txtApeMaterno" required><br>
			Edad: <br> <input type="number" name="txtEdad" required><br>
			Token: <br> <input type="text" name="txtToken" required><br>
			<br> <input type="submit" value="Agregar Cliente"> <a
				href="ControladorCliente?accion=listarCliente">Cancelar</a>
		</form>
	</div>
</body>
</html>
