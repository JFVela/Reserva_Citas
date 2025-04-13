package net.reservaCitas.Controlador;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.reservaCitas.Modelo.Cliente;
import net.reservaCitas.ModeloDAO.ClienteDAO;

@WebServlet("/ControladorCliente")
public class ControladorCliente extends HttpServlet {

	private static final long serialVersionUID = 1L;

	String listarCliente = "/vistas/listarCliente.jsp";
	String agregarCliente = "/vistas/crearCliente.jsp";
	String editarCliente = "/vistas/editarCliente.jsp";
	Cliente c = new Cliente();
	ClienteDAO dao = new ClienteDAO();

	public ControladorCliente() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acceso = "";
		String action = request.getParameter("accion");

		if (action != null && action.equalsIgnoreCase("listarCliente")) {
			acceso = listarCliente;
		} else if (action.equalsIgnoreCase("agregarCliente")) {
			acceso = agregarCliente;
		} else if (action.equalsIgnoreCase("clienteFormulario")) {

			// Obtener los parámetros del formulario
			String dniStr = request.getParameter("txtDNI");
			String nombres = request.getParameter("txtNombres");
			String apellidoPaterno = request.getParameter("txtApePaterno");
			String apellidoMaterno = request.getParameter("txtApeMaterno");
			String edadStr = request.getParameter("txtEdad");
			String token = request.getParameter("txtToken");

			// Convertir los parámetros a tipos adecuados
			int dni = Integer.parseInt(dniStr);
			int edad = Integer.parseInt(edadStr);

			// setear los valores
			c.setDni(dni);
			c.setNombres(nombres);
			c.setApellidoPaterno(apellidoPaterno);
			c.setApellidoMaterno(apellidoMaterno);
			c.setEdad(edad);
			c.setToken(token);

			dao.agregarCliente(c);

			response.sendRedirect("ControladorCliente?accion=listarCliente");
			return;
		} else if (action.equalsIgnoreCase("editar")) {
			request.setAttribute("tokenper", request.getParameter("tokenFront"));
			acceso = editarCliente;
		} else if (action.equalsIgnoreCase("Modificar")) {
			int id = Integer.parseInt(request.getParameter("txtId"));
			String dniEditar = request.getParameter("txtDNI");
			String nombreEditar = request.getParameter("txtNombres");
			String paternoEditar = request.getParameter("txtApePaterno");
			String maternaEditar = request.getParameter("txtApeMaterno");
			String tokenEditar = request.getParameter("txtToken");
			String edadEditar = request.getParameter("txtEdad");

			// Convertir los parámetros a tipos adecuados
			int dni = Integer.parseInt(dniEditar);
			int edad = Integer.parseInt(edadEditar);

			// setear los valores
			c.setId(id);
			c.setDni(dni);
			c.setNombres(nombreEditar);
			c.setApellidoPaterno(paternoEditar);
			c.setApellidoMaterno(maternaEditar);
			c.setToken(tokenEditar);
			c.setEdad(edad);

			dao.editarCliente(c);
			acceso = listarCliente;

		} else if (action.equalsIgnoreCase("eliminar")) {
			int id = Integer.parseInt(request.getParameter("idFront"));
			c.setId(id);
			dao.eliminarCliente(id);
			acceso = listarCliente;
		}

		RequestDispatcher vista = request.getRequestDispatcher(acceso);
		vista.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
