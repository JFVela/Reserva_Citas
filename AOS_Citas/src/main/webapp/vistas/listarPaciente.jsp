<%@ page import="java.util.*, net.reservaCitas.Modelo.paciente, net.reservaCitas.ModeloDAO.pacienteDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Lista de Pacientes</title>
</head>
<body>

	<h1>Listar Pacientes</h1>
	<a href="pacienteControlador?accion=agregarPaciente">Agregar Nuevo Paciente</a>
	<table border="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>DNI</th>
				<th>Nombres</th>
				<th>Apellido Paterno</th>
				<th>Apellido Materno</th>
				<th>Género</th>
				<th>Fecha de Nacimiento</th>
				<th>Dirección</th>
				<th>Token</th>
				<th>Acciones</th>
			</tr>
		</thead>
		<tbody>
			<%
			pacienteDAO dao = new pacienteDAO();
			List<paciente> list = dao.listar();
			for (paciente pac : list) {
			%>
			<tr>
				<td><%=pac.getIdpaciente()%></td>
				<td><%=pac.getDni()%></td>
				<td><%=pac.getNombres()%></td>
				<td><%=pac.getApellidoPaterno()%></td>
				<td><%=pac.getApellidoMaterno()%></td>
				<td><%=pac.getSexo()%></td>
				<td><%=pac.getFechaNacimiento()%></td>
				<td><%=pac.getDireccion()%></td>
				<td><%=pac.getToken()%></td>
				<td>
					<a href="pacienteControlador?accion=editar&tokenFront=<%=pac.getToken()%>">Editar</a><br>
					<a href="pacienteControlador?accion=eliminar&idFront=<%=pac.getIdpaciente()%>">Eliminar</a>
				</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

</body>
</html>
