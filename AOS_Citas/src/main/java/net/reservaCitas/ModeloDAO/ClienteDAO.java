package net.reservaCitas.ModeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.reservaCitas.Config.Conexion;
import net.reservaCitas.Interfaces.CRUD;
import net.reservaCitas.Modelo.Cliente;

public class ClienteDAO implements CRUD {

	Conexion cn = new Conexion();
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	Cliente c = new Cliente();

	@Override
	public List<Cliente> listar() {
		List<Cliente> list = new ArrayList<>();
		String sql = "SELECT * FROM pacientes";

		try {
			con = cn.getConection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Cliente cli = new Cliente();
				cli.setId(rs.getInt("id_cliente"));
				cli.setDni(rs.getInt("dni"));
				cli.setNombres(rs.getString("nombres"));
				cli.setApellidoPaterno(rs.getString("apellidoPaterno"));
				cli.setApellidoMaterno(rs.getString("apellidoMaterno"));
				cli.setEdad(rs.getInt("edad"));
				cli.setToken(rs.getString("token"));
				list.add(cli);
			}
		} catch (Exception e) {
			System.out.println("Error al listar clientes: " + e.getMessage());
		}

		return list;
	}

	@Override
	public Cliente list(String tokenJava) {
		String sql = "SELECT * FROM pacientes WHERE token = ?";
		Cliente cliente = new Cliente();
		try {
			con = cn.getConection();
			ps = con.prepareStatement(sql);
			ps.setString(1, tokenJava); // Evita inyección y errores de comillas
			rs = ps.executeQuery();

			if (rs.next()) {
				cliente.setId(rs.getInt("id_cliente"));
				cliente.setDni(rs.getInt("dni"));
				cliente.setNombres(rs.getString("nombres"));
				cliente.setApellidoPaterno(rs.getString("apellidoPaterno"));
				cliente.setApellidoMaterno(rs.getString("apellidoMaterno"));
				cliente.setEdad(rs.getInt("edad"));
				cliente.setToken(rs.getString("token"));
			}
		} catch (Exception e) {
			System.out.println("Error al listar cliente por token: " + e.getMessage());
		}
		return cliente;
	}

	@Override
	public boolean agregarCliente(Cliente cli) {
		String sql = "INSERT INTO pacientes (dni, nombres, apellidoPaterno, apellidoMaterno, edad, token) VALUES (?, ?, ?, ?, ?, ?)";

		try {
			con = cn.getConection();
			ps = con.prepareStatement(sql);

			ps.setInt(1, cli.getDni());
			ps.setString(2, cli.getNombres());
			ps.setString(3, cli.getApellidoPaterno());
			ps.setString(4, cli.getApellidoMaterno());
			ps.setInt(5, cli.getEdad());
			ps.setString(6, cli.getToken());

			int result = ps.executeUpdate();

			return result > 0;
		} catch (Exception e) {
			System.out.println("Error al agregar cliente: " + e.getMessage());
			return false;
		}
	}

	@Override
	public boolean editarCliente(Cliente cli) {
		String sql = "UPDATE pacientes SET nombres = ?, apellidoPaterno = ?, apellidoMaterno = ?, edad = ?, token = ? WHERE dni = ?";

		try {
			con = cn.getConection();
			ps = con.prepareStatement(sql);

			ps.setString(1, cli.getNombres());
			ps.setString(2, cli.getApellidoPaterno());
			ps.setString(3, cli.getApellidoMaterno());
			ps.setInt(4, cli.getEdad());
			ps.setString(5, cli.getToken());
			ps.setInt(6, cli.getDni()); // El DNI es la clave para ubicar al paciente

			int result = ps.executeUpdate();

			return result > 0;
		} catch (Exception e) {
			System.out.println("Error al editar cliente: " + e.getMessage());
			return false;
		}
	}

	@Override
	public boolean eliminarCliente(int id) {
		// TODO Auto-generated method stub
		return false;
	}

}
