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
		String sql = "SELECT * FROM cliente";

		try {
			con = cn.getConection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Cliente cli = new Cliente();
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
	public Cliente list(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean agregarCliente(Cliente cli) {
		String sql = "INSERT INTO `reservacitas`.`cliente` (`dni`, `nombres`, `apellidoPaterno`, `apellidoMaterno`, `edad`, `token`) VALUES (?, ?, ?, ?, ?, ?);";
		try {
			con = cn.getConection();
			ps = con.prepareStatement(sql);

			// Insertar los valores del cliente en el PreparedStatement
			ps.setInt(1, cli.getDni());
			ps.setString(2, cli.getNombres());
			ps.setString(3, cli.getApellidoPaterno());
			ps.setString(4, cli.getApellidoMaterno());
			ps.setInt(5, cli.getEdad());
			ps.setString(6, cli.getToken());

			// Ejecutar la consulta
			int result = ps.executeUpdate();

			return result > 0; // Si la inserción fue exitosa, devuelve true
		} catch (Exception e) {
			System.out.println("Error al agregar cliente: " + e.getMessage());
			return false; // En caso de error, devuelve false
		}
	}

	@Override
	public boolean editarCliente(Cliente cli) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean eliminarCliente(int id) {
		// TODO Auto-generated method stub
		return false;
	}

}
