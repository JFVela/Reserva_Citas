<%@ page
	import="java.util.*, net.reservaCitas.Modelo.Cliente, net.reservaCitas.ModeloDAO.ClienteDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Cliente</title>
</head>
<body>

	<div>
		<%
		ClienteDAO dao = new ClienteDAO();
		String token = (String) request.getAttribute("tokenper");
		Cliente p = dao.list(token);
		%>

		<h1>Editar Cliente</h1>
		<form action="ControladorCliente" method="get">
			<!-- Campos ocultos para DNI y ID -->
			<input type="" name="txtId" value="<%=p.getId()%>"> <input
				type="" name="txtDNI" value="<%=p.getDni()%>"> <label>Nombres:</label><br>
			<input type="text" name="txtNombres" value="<%=p.getNombres()%>"><br>

			<label>Apellido Paterno:</label><br> <input type="text"
				name="txtApePaterno" value="<%=p.getApellidoPaterno()%>"><br>

			<label>Apellido Materno:</label><br> <input type="text"
				name="txtApeMaterno" value="<%=p.getApellidoMaterno()%>"><br>

			<label>Edad:</label><br> <input type="number" name="txtEdad"
				value="<%=p.getEdad()%>"><br> 
				<label>Token
				(no editable):</label><br> <input type="" name="txtToken"
				value="<%=p.getToken()%>"><br>
			<br> <input type="submit" name="accion" value="Modificar">
			<a href="ControladorCliente?accion=listarCliente">Cancelar</a>
		</form>
	</div>

</body>
</html>
