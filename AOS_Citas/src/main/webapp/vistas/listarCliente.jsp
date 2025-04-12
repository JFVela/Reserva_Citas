<%@ page
	import="java.util.*, net.reservaCitas.Modelo.Cliente, net.reservaCitas.ModeloDAO.ClienteDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista de Clientes</title>
</head>
<body>

	<h1>Listar Personas</h1>
	<a href="ControladorCliente?accion=agregarCliente">Agregar Nuevo
		cliente</a>
	<table border="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>DNI</th>
				<th>Nombres</th>
				<th>Apellido Paterno</th>
				<th>Apellido Materno</th>
				<th>Edad</th>
				<th>Token</th>
				<th>Acciones</th>
			</tr>
		</thead>
		<tbody>
			<%
			ClienteDAO dao = new ClienteDAO();
			List<Cliente> list = dao.listar();
			for (Cliente cli : list) {
			%>
			<tr>
				<td><%=cli.getId()%></td>
				<td><%=cli.getDni()%></td>
				<td><%=cli.getNombres()%></td>
				<td><%=cli.getApellidoPaterno()%></td>
				<td><%=cli.getApellidoMaterno()%></td>
				<td><%=cli.getEdad()%></td>
				<td><%=cli.getToken()%></td>
				<td><a
					href="ControladorCliente?accion=editar&tokenFront=<%=cli.getToken()%>">Editar</a>
					| <a
					href="ControladorCliente?accion=borrarCliente&tokenFront=<%=cli.getToken()%>">Modificar</a>
				</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>


</body>
</html>
