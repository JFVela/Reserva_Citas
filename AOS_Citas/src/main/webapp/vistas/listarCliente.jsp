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
	<a href="ControladorCliente?accion=agregarCliente">Agregar Nuevo cliente</a>
	<table border="1">
		<thead>
			<tr>
				<th>DNI</th>
				<th>Nombres</th>
				<th>Apellidos</th>
				<th>Edad</th>
				<th>Token</th>
			</tr>
		</thead>
		<tbody>
			<%
			ClienteDAO dao = new ClienteDAO();
			List<Cliente> list = dao.listar();
			for (Cliente cli : list) {
			%>
			<tr>
				<td><%=cli.getDni()%></td>
				<td><%=cli.getNombres()%></td>
				<td><%=cli.getApellidoPaterno()%> <%=cli.getApellidoMaterno()%></td>
				<td><%=cli.getEdad()%></td>
				<td><%=cli.getToken()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

</body>
</html>
