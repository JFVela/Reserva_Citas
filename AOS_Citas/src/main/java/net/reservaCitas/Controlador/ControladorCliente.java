package net.reservaCitas.Controlador;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ControladorCliente")
public class ControladorCliente extends HttpServlet {

	private static final long serialVersionUID = 1L;

	
	String listarCliente = "/vistas/listarCliente.jsp";
	String agregarCliente = "";
	String editarCliente = "";  
	String borrarCliente = "";

	public ControladorCliente() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String acceso = "";
		String action = request.getParameter("accion");
		
		if (action != null && action.equalsIgnoreCase("listarCliente")) {
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
