<%@ page import="java.util.*, net.reservaCitas.Modelo.paciente, net.reservaCitas.ModeloDAO.pacienteDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Paciente</title>
</head>
<body>

	<div>
		<%
		pacienteDAO dao = new pacienteDAO();
		String token = (String) request.getAttribute("tokenper");
		paciente p = dao.list(token);
		%>

		<h1>Editar Paciente</h1>
		<form action="pacienteControlador" method="get">
			<input type="hidden" name="txtId" value="<%=p.getIdpaciente()%>">
			<input type="hidden" name="txtDNI" value="<%=p.getDni()%>">

			<label>Nombres:</label><br>
			<input type="text" name="txtNombres" value="<%=p.getNombres()%>"><br>

			<label>Apellido Paterno:</label><br>
			<input type="text" name="txtApePaterno" value="<%=p.getApellidoPaterno()%>"><br>

			<label>Apellido Materno:</label><br>
			<input type="text" name="txtApeMaterno" value="<%=p.getApellidoMaterno()%>"><br>

			<label>Sexo:</label><br>
			<input type="text" name="txtGenero" value="<%=p.getSexo()%>"><br>

			<label>Fecha de Nacimiento:</label><br>
			<input type="date" name="txtFechaNacimiento" value="<%=p.getFechaNacimiento()%>"><br>

			<label>Dirección:</label><br>
			<input type="text" name="txtDireccion" value="<%=p.getDireccion()%>"><br>

			<label>Token (no editable):</label><br>
			<input type="text" name="txtToken" value="<%=p.getToken()%>" readonly><br><br>

			<input type="submit" name="accion" value="Modificar">
			<a href="pacienteControlador?accion=listarPaciente">Cancelar</a>
		</form>
	</div>

</body>
</html>
