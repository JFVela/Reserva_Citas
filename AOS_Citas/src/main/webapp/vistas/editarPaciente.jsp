<%@ page
	import="java.util.*, net.reservaCitas.Modelo.paciente, net.reservaCitas.ModeloDAO.pacienteDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Editar Paciente</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<style>
body {
	background-color: #f8f9fa;
	padding-top: 20px;
	padding-bottom: 40px;
}

.form-container {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	padding: 30px;
	margin-bottom: 30px;
}

.page-title {
	color: #0d6efd;
	margin-bottom: 25px;
	text-align: center;
	font-weight: 600;
}

.form-label {
	font-weight: 500;
}

.btn-primary {
	background-color: #0d6efd;
	border: none;
	padding: 10px 20px;
}

.btn-secondary {
	background-color: #6c757d;
	border: none;
	padding: 10px 20px;
	text-decoration: none;
	color: white;
	border-radius: 5px;
	display: inline-block;
}

.btn-secondary:hover {
	background-color: #5a6268;
	color: white;
}
/* Readonly field styling */
.form-control:read-only {
	background-color: #f8f9fa;
	border-color: #ced4da;
}
/* Responsive adjustments */
@media ( max-width : 767.98px) {
	.form-container {
		padding: 20px;
	}
}
</style>
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-10">
				<div class="form-container">
					<%
					pacienteDAO dao = new pacienteDAO();
					String token = (String) request.getAttribute("tokenper");
					paciente p = dao.list(token);
					%>

					<h1 class="page-title">Editar Paciente</h1>
					<form action="pacienteControlador" method="get">
						<input type="hidden" name="txtId" value="<%=p.getIdpaciente()%>">
						<input type="hidden" name="txtDNI" value="<%=p.getDni()%>">

						<div class="row">
							<!-- Left Column -->
							<div class="col-md-6">
								<div class="mb-3">
									<label for="txtNombres" class="form-label">Nombres:</label> <input
										type="text" class="form-control" id="txtNombres"
										name="txtNombres" value="<%=p.getNombres()%>" required>
								</div>

								<div class="mb-3">
									<label for="txtApePaterno" class="form-label">Apellido
										Paterno:</label> <input type="text" class="form-control"
										id="txtApePaterno" name="txtApePaterno"
										value="<%=p.getApellidoPaterno()%>" required>
								</div>

								<div class="mb-3">
									<label for="txtApeMaterno" class="form-label">Apellido
										Materno:</label> <input type="text" class="form-control"
										id="txtApeMaterno" name="txtApeMaterno"
										value="<%=p.getApellidoMaterno()%>" required>
								</div>
								<input type="hidden" class="form-control" id="txtToken"
									name="txtToken" value="<%=p.getToken()%>" readonly>
							</div>

							<!-- Right Column -->
							<div class="col-md-6">
								<div class="mb-3">
									<label for="txtGenero" class="form-label">Sexo:</label> <select
										class="form-select" id="txtGenero" name="txtGenero" required>
										<option value="Masculino"
											<%=p.getSexo().equals("Masculino") ? "selected" : ""%>>Masculino</option>
										<option value="Femenino"
											<%=p.getSexo().equals("Femenino") ? "selected" : ""%>>Femenino</option>
										<option value="Otro"
											<%=p.getSexo().equals("Otro") ? "selected" : ""%>>Otro</option>
									</select>
								</div>

								<div class="mb-3">
									<label for="txtFechaNacimiento" class="form-label">Fecha
										de Nacimiento:</label> <input type="date" class="form-control"
										id="txtFechaNacimiento" name="txtFechaNacimiento"
										value="<%=p.getFechaNacimiento()%>" required>
								</div>

								<div class="mb-3">
									<label for="txtDireccion" class="form-label">Dirección:</label>
									<input type="text" class="form-control" id="txtDireccion"
										name="txtDireccion" value="<%=p.getDireccion()%>" required>
								</div>
							</div>
						</div>

						<div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
							<button type="submit" name="accion" value="Modificar"
								class="btn btn-primary me-md-2">Modificar</button>
							<a href="pacienteControlador?accion=listarPaciente"
								class="btn btn-secondary">Cancelar</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>