package net.reservaCitas.Controlador;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.reservaCitas.Modelo.paciente;
import net.reservaCitas.ModeloDAO.pacienteDAO;

@WebServlet("/pacienteControlador")
public class ServletPaciente extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private final String LISTAR = "/vistas/listarPaciente.jsp";
	private final String AGREGAR = "/vistas/nuevoPaciente.jsp";
	private final String EDITAR = "/vistas/editarPaciente.jsp";

	paciente paciente = new paciente();
	pacienteDAO dao = new pacienteDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String accion = request.getParameter("accion");
		String acceso = "";

		if (accion == null) {
			acceso = LISTAR;
		} else {
			switch (accion) {
				case "listarPaciente":
					acceso = LISTAR;
					break;
				case "agregarPaciente":
					acceso = AGREGAR;
					break;
				case "pacienteFormulario":
					procesarFormulario(request);
					response.sendRedirect("pacienteControlador?accion=listarPaciente");
					return;
				case "editar":
					request.setAttribute("tokenper", request.getParameter("tokenFront"));
					acceso = EDITAR;
					break;
				case "Modificar":
					procesarEdicion(request);
					acceso = LISTAR;
					break;
				case "eliminar":
					int idEliminar = Integer.parseInt(request.getParameter("idFront"));
					dao.eliminarPaciente(idEliminar);
					 // Imprimir detalles del paciente eliminado
				    imprimirPaciente(paciente, "Paciente eliminado");
					acceso = LISTAR;
					break;
				default:
					acceso = LISTAR;
			}
		}

		RequestDispatcher vista = request.getRequestDispatcher(acceso);
		vista.forward(request, response);
	}

	private void procesarFormulario(HttpServletRequest request) {
		paciente.setDni(Integer.parseInt(request.getParameter("txtDNI")));
		paciente.setNombres(request.getParameter("txtNombres"));
		paciente.setApellidoPaterno(request.getParameter("txtApePaterno"));
		paciente.setApellidoMaterno(request.getParameter("txtApeMaterno"));
		paciente.setSexo(request.getParameter("txtGenero")); // coincide con atributo `sexo`
		paciente.setFechaNacimiento(request.getParameter("txtFechaNacimiento"));
		paciente.setDireccion(request.getParameter("txtDireccion"));
		paciente.setToken(request.getParameter("txtToken"));

		dao.agregarPaciente(paciente);
		// Imprimir detalles del paciente agregado
	    imprimirPaciente(paciente, "Paciente agregado");
	}

	private void procesarEdicion(HttpServletRequest request) {
		paciente.setIdpaciente(Integer.parseInt(request.getParameter("txtId")));
		paciente.setDni(Integer.parseInt(request.getParameter("txtDNI")));
		paciente.setNombres(request.getParameter("txtNombres"));
		paciente.setApellidoPaterno(request.getParameter("txtApePaterno"));
		paciente.setApellidoMaterno(request.getParameter("txtApeMaterno"));
		paciente.setSexo(request.getParameter("txtGenero"));
		paciente.setFechaNacimiento(request.getParameter("txtFechaNacimiento"));
		paciente.setDireccion(request.getParameter("txtDireccion"));
		paciente.setToken(request.getParameter("txtToken"));

		dao.editarPaciente(paciente);
		// Imprimir detalles del paciente editado
	    imprimirPaciente(paciente, "Paciente editado");
	}
	
	private void imprimirPaciente(paciente p, String accion) {
	    System.out.println("Acción: " + accion);
	    System.out.println("ID: " + p.getIdpaciente());
	    System.out.println("DNI: " + p.getDni());
	    System.out.println("Nombres: " + p.getNombres());
	    System.out.println("Apellido Paterno: " + p.getApellidoPaterno());
	    System.out.println("Apellido Materno: " + p.getApellidoMaterno());
	    System.out.println("Sexo: " + p.getSexo());
	    System.out.println("Fecha Nacimiento: " + p.getFechaNacimiento());
	    System.out.println("Dirección: " + p.getDireccion());
	    System.out.println("Token: " + p.getToken());
	    System.out.println("===========================================");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
