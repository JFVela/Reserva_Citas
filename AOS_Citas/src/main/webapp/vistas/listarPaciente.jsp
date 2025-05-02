<%@ page
	import="java.util.*, net.reservaCitas.Modelo.paciente, net.reservaCitas.ModeloDAO.pacienteDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Lista de Pacientes</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css"
	rel="stylesheet">

<!-- Font Awesome para iconos -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">

<!-- Estilos personalizados -->
<style>
.contenedorPrincipal {
	padding: 20px;
}

.tituloPagina {
	color: #0d6efd;
	margin-bottom: 20px;
}

.grupoBotones {
	display: flex;
}

.botonAgregar {
	margin-bottom: 20px;
}

.botonEditar {
	margin-right: 5px;
}

.botonEliminar {
	color: white;
}

.tablaContenedor {
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin-bottom: 20px;
}
</style>
</head>
<body class="bg-light">
	<div class="container contenedorPrincipal">
		<div class="row">
			<div class="col-12">
				<h1 class="tituloPagina">
					<i class="fas fa-user-injured me-2"></i>Gestión de Pacientes
				</h1>

				<a href="pacienteControlador?accion=agregarPaciente"
					class="btn btn-primary botonAgregar"> <i
					class="fas fa-plus-circle me-2"></i>Agregar Nuevo Paciente
				</a>

				<div class="tablaContenedor">
					<div class="table-responsive">
						<table id="tablaPacientes" class="table table-striped table-hover">
							<thead class="table-primary">
								<tr>
									<th>ID</th>
									<th>DNI</th>
									<th>Nombres</th>
									<th>Apellido Paterno</th>
									<th>Apellido Materno</th>
									<th>Género</th>
									<th>Fecha de Nacimiento</th>
									<th>Dirección</th>
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
									<td>
										<div class="grupoBotones">
											<a
												href="pacienteControlador?accion=editar&tokenFront=<%=pac.getToken()%>"
												class="btn btn-sm btn-warning botonEditar"> <i
												class="fas fa-edit"></i> Editar
											</a>
											<button class="btn btn-sm btn-danger btn-eliminar"
												data-id="<%=pac.getIdpaciente()%>"
												data-nombre="<%=pac.getNombres()%> <%=pac.getApellidoPaterno()%>">
												<i class="fas fa-trash-alt"></i> Eliminar
											</button>
										</div>

									</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<!-- DataTables JS -->
	<script
		src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

	<!-- SweetAlert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<!-- Script personalizado -->
	<script>
        $(document).ready(function() {
            // Inicializar DataTable en español
            $('#tablaPacientes').DataTable({
                language: {
                	url: '//cdn.datatables.net/plug-ins/2.2.2/i18n/es-ES.json',
                    lengthMenu: "Mostrar _MENU_ registros por página",
                    zeroRecords: "No se encontraron resultados",
                    info: "Mostrando página _PAGE_ de _PAGES_",
                    infoEmpty: "No hay registros disponibles",
                    infoFiltered: "(filtrado de _MAX_ registros totales)",
                    search: "Buscar:",
                    paginate: {
                        first: "Primero",
                        last: "Último",
                        next: "Siguiente",
                        previous: "Anterior"
                    }
                },
                responsive: true,
            });
        });
        
        // Función para confirmar eliminación con SweetAlert
		$(document).on("click", ".btn-eliminar", function() {
			var nombrePaciente;
			var idPaciente;
			idPaciente=$(this).parents("tr").find("td")[0].innerHTML;
			nombrePaciente=$(this).parents("tr").find("td")[2].innerHTML;

			
		    Swal.fire({
		        title: '¿Está seguro?',
		        html: "¿Desea eliminar a <strong>"+nombrePaciente+"</strong> de la BD?",
		        icon: 'warning',
		        showCancelButton: true,
		        confirmButtonColor: '#3085d6',
		        cancelButtonColor: '#d33',
		        confirmButtonText: 'Sí, eliminar',
		        cancelButtonText: 'Cancelar'
		    }).then((result) => {
		        if (result.isConfirmed) {
		            window.location.href = "pacienteControlador?accion=eliminar&idFront="+idPaciente;
		        } else {
		            Swal.fire(
		                'Cancelado',
		                'La operación ha sido cancelada.',
		                'info'
		            );
		        }
		    });
		});

    </script>
</body>
</html>
