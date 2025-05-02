<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sistema de Gestión Hospitalaria</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap Icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<style>
:root {
	--primary: #2c7fb8;
	--secondary: #7fcdbb;
	--accent: #41b6e6;
	--light: #f5f9fc;
	--dark: #253746;
	--success: #28a745;
	--warning: #ffc107;
	--danger: #dc3545;
	--info: #17a2b8;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f8f9fa;
	color: #333;
}

.dashboard-container {
	padding: 1.5rem;
}

.header {
	background-color: white;
	border-radius: 10px;
	padding: 1.5rem;
	margin-bottom: 1.5rem;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

.header h1 {
	color: var(--primary);
	font-size: 1.8rem;
	margin-bottom: 0.5rem;
}

.header p {
	color: #6c757d;
	margin-bottom: 0;
}

.card-dashboard {
	background-color: white;
	border-radius: 10px;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
	transition: all 0.3s ease;
	height: 100%;
	border: none;
	overflow: hidden;
}

.card-dashboard:hover {
	transform: translateY(-5px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.card-header-custom {
	background-color: var(--light);
	padding: 1rem;
	border-bottom: 1px solid rgba(0, 0, 0, 0.05);
}

.card-icon {
	width: 50px;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 12px;
	font-size: 1.5rem;
	color: white;
	margin-bottom: 0.5rem;
}

.card-body-custom {
	padding: 1.25rem;
}

.card-title {
	font-size: 1.2rem;
	font-weight: 600;
	margin-bottom: 0.5rem;
	color: var(--dark);
}

.card-text {
	color: #6c757d;
	font-size: 0.9rem;
	margin-bottom: 1rem;
}

.btn-access {
	background-color: var(--light);
	color: var(--primary);
	border: none;
	border-radius: 6px;
	padding: 0.5rem 1rem;
	font-weight: 500;
	transition: all 0.2s;
}

.btn-access:hover {
	background-color: var(--primary);
	color: white;
}

.icon-patients {
	background-color: var(--primary);
}

.icon-doctors {
	background-color: var(--info);
}

.icon-specialties {
	background-color: var(--success);
}

.icon-schedules {
	background-color: var(--warning);
}

.icon-locations {
	background-color: var(--accent);
}

.icon-appointments {
	background-color: var(--danger);
}

@media ( max-width : 768px) {
	.dashboard-container {
		padding: 1rem;
	}
	.header {
		padding: 1rem;
	}
	.card-dashboard {
		margin-bottom: 1rem;
	}
}
</style>
</head>
<body>
	<div class="dashboard-container">
		<div class="header">
			<div class="row align-items-center">
				<div class="col-md-8">
					<h1>
						<i class="bi bi-hospital me-2"></i>Sistema de Gestión Hospitalaria
					</h1>
					<p>Bienvenido al panel de administración</p>
				</div>
				<div class="col-md-4 text-md-end">
					<div class="d-flex justify-content-md-end align-items-center">
						<span class="me-2 text-muted">Fecha:</span> <span id="currentDate"
							class="fw-bold"></span>
					</div>
				</div>
			</div>
		</div>

		<div class="row g-4" id="contenidoModulo">
			<!-- modulos will be generated dynamically with JavaScript -->
		</div>
	</div>

	<!-- Bootstrap JS Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		// Array of dashboard modulos
		const moduloDashboard = [
				{
					id : "patients",
					title : 'Pacientes',
					icon : 'bi-people-fill',
					description : 'Gestione registros, historiales e información de pacientes',
					link : 'pacienteControlador?accion=listarPaciente',
					iconClass : 'icon-patients'
				},
				{
					id : 'doctors',
					title : 'Doctores',
					icon : 'bi-person-badge-fill',
					description : 'Administre perfiles y horarios de los médicos',
					link : '#',
					iconClass : 'icon-doctors'
				},
				{
					id : 'specialties',
					title : 'Especialidades',
					icon : 'bi-clipboard2-pulse-fill',
					description : 'Gestione las especialidades médicas disponibles',
					link : '#',
					iconClass : 'icon-specialties'
				},
				{
					id : 'schedules',
					title : 'Horarios',
					icon : 'bi-calendar-week-fill',
					description : 'Visualice y administre los horarios de atención',
					link : '#',
					iconClass : 'icon-schedules'
				},
				{
					id : 'locations',
					title : 'Sedes',
					icon : 'bi-geo-alt-fill',
					description : 'Gestione las ubicaciones y instalaciones del hospital',
					link : '#',
					iconClass : 'icon-locations'
				}, {
					id : 'appointments',
					title : 'Citas Médicas',
					icon : 'bi-journal-medical',
					description : 'Programe y administre citas de pacientes',
					link : '#',
					iconClass : 'icon-appointments'
				} ];

		// Function to generate modulos based on the array
		function generatemodulos() {
			const contenidoModulo = document.getElementById('contenidoModulo');

			// Check if the container exists
			if (!contenidoModulo) {
				console.error('Error: contenidoModulo element not found');
				return;
			}

			// Clear the container first
			contenidoModulo.innerHTML = '';

			// Check if moduloDashboard is defined and is an array
			if (!Array.isArray(moduloDashboard) || moduloDashboard.length === 0) {
				console
						.error('Error: moduloDashboard is not a valid array or is empty');
				return;
			}

			// Loop through each modulo and create the HTML
			moduloDashboard
					.forEach(function(modulo, index) {
						let cardHtml = "<div class='col-md-6 col-lg-4'>"
								+ "<div class='card card-dashboard'>"
								+ "<div class='card-body-custom'>"
								+ "<div class='d-flex align-items-center mb-3'>"
								+ "<div class='card-icon " + modulo.iconClass + " me-3'>"
								+ "<i class='bi " + modulo.icon + "'></i>"
								+ "</div>"
								+ "<h5 class='card-title mb-0'>"
								+ modulo.title
								+ "</h5>"
								+ "</div>"
								+ "<p class='card-text'>"
								+ modulo.description
								+ "</p>"
								+ "<a href='" + modulo.link + "' class='btn btn-access w-100'>"
								+ "Acceder <i class='bi bi-arrow-right ms-1'></i>"
								+ "</a>" + "</div>" + "</div>" + "</div>";

						document.getElementById("contenidoModulo").innerHTML += cardHtml;
					});

			console.log('modulos generated successfully:',
					moduloDashboard.length);
		}

		// Function to display current date
		function displayCurrentDate() {
			const dateElement = document.getElementById('currentDate');
			if (!dateElement) {
				console.error('Error: currentDate element not found');
				return;
			}

			const options = {
				weekday : 'long',
				year : 'numeric',
				month : 'long',
				day : 'numeric'
			};
			const today = new Date();
			dateElement.textContent = today
					.toLocaleDateString('es-ES', options);
		}

		// Initialize the dashboard - Make sure this runs after DOM is fully loaded
		document.addEventListener('DOMContentLoaded', function() {
			console.log('DOM fully loaded');
			generatemodulos();
			displayCurrentDate();
		});

		// Fallback initialization in case DOMContentLoaded doesn't trigger properly
		if (document.readyState === 'complete'
				|| document.readyState === 'interactive') {
			console.log('Document already loaded, initializing directly');
			setTimeout(function() {
				generatemodulos();
				displayCurrentDate();
			}, 1);
		}
	</script>
</body>
</html>



