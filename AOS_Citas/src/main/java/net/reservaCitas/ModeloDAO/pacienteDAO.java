package net.reservaCitas.ModeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.reservaCitas.Config.Conexion;
import net.reservaCitas.Interfaces.crud_paciente;
import net.reservaCitas.Modelo.paciente;

public class pacienteDAO implements crud_paciente {

	Conexion cn = new Conexion();
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	@Override
	public List<paciente> listar() {
		List<paciente> list = new ArrayList<>();
		String sql = "SELECT * FROM paciente";

		try {
			con = cn.getConection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				paciente pac = new paciente();
				pac.setIdpaciente(rs.getInt("idpaciente"));
				pac.setDni(rs.getInt("dni"));
				pac.setToken(rs.getString("token"));
				pac.setNombres(rs.getString("nombres"));
				pac.setApellidoPaterno(rs.getString("apellidoPaterno"));
				pac.setApellidoMaterno(rs.getString("apellidoMaterno"));
				pac.setSexo(rs.getString("sexo"));
				pac.setFechaNacimiento(rs.getString("fechaNacimiento"));
				pac.setDireccion(rs.getString("direccion"));
				list.add(pac);
			}
		} catch (Exception e) {
			System.out.println("Error al listar pacientes: " + e.getMessage());
		}

		return list;
	}

	@Override
	public paciente list(String tokenJava) {
		String sql = "SELECT * FROM paciente WHERE token = ?";
		paciente pac = new paciente();
		try {
			con = cn.getConection();
			ps = con.prepareStatement(sql);
			ps.setString(1, tokenJava);
			rs = ps.executeQuery();

			if (rs.next()) {
				pac.setIdpaciente(rs.getInt("idpaciente"));
				pac.setDni(rs.getInt("dni"));
				pac.setToken(rs.getString("token"));
				pac.setNombres(rs.getString("nombres"));
				pac.setApellidoPaterno(rs.getString("apellidoPaterno"));
				pac.setApellidoMaterno(rs.getString("apellidoMaterno"));
				pac.setSexo(rs.getString("sexo"));
				pac.setFechaNacimiento(rs.getString("fechaNacimiento"));
				pac.setDireccion(rs.getString("direccion"));
			}
		} catch (Exception e) {
			System.out.println("Error al obtener paciente por token: " + e.getMessage());
		}
		return pac;
	}

	@Override
	public boolean agregarPaciente(paciente pac) {
		String sql = "INSERT INTO paciente (dni, token, nombres, apellidoPaterno, apellidoMaterno, sexo, fechaNacimiento, direccion) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			con = cn.getConection();
			ps = con.prepareStatement(sql);

			ps.setInt(1, pac.getDni());
			ps.setString(2, pac.getToken());
			ps.setString(3, pac.getNombres());
			ps.setString(4, pac.getApellidoPaterno());
			ps.setString(5, pac.getApellidoMaterno());
			ps.setString(6, pac.getSexo());
			ps.setString(7, pac.getFechaNacimiento());
			ps.setString(8, pac.getDireccion());

			int result = ps.executeUpdate();
			return result > 0;
		} catch (Exception e) {
			System.out.println("Error al agregar paciente: " + e.getMessage());
			return false;
		}
	}

	@Override
	public boolean editarPaciente(paciente pac) {
		String sql = "UPDATE paciente SET token = ?, nombres = ?, apellidoPaterno = ?, apellidoMaterno = ?, sexo = ?, fechaNacimiento = ?, direccion = ? WHERE dni = ?";

		try {
			con = cn.getConection();
			ps = con.prepareStatement(sql);

			ps.setString(1, pac.getToken());
			ps.setString(2, pac.getNombres());
			ps.setString(3, pac.getApellidoPaterno());
			ps.setString(4, pac.getApellidoMaterno());
			ps.setString(5, pac.getSexo());
			ps.setString(6, pac.getFechaNacimiento());
			ps.setString(7, pac.getDireccion());
			ps.setInt(8, pac.getDni());

			int result = ps.executeUpdate();
			return result > 0;
		} catch (Exception e) {
			System.out.println("Error al editar paciente: " + e.getMessage());
			return false;
		}
	}

	@Override
	public boolean eliminarPaciente(int idpaciente) {
		String sql = "DELETE FROM paciente WHERE idpaciente = ?";

		try {
			con = cn.getConection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, idpaciente);
			int result = ps.executeUpdate();
			return result > 0;
		} catch (Exception e) {
			System.out.println("Error al eliminar paciente: " + e.getMessage());
			return false;
		}
	}

}
