package net.reservaCitas.Interfaces;

import java.util.List;
import net.reservaCitas.Modelo.paciente;

public interface crud_paciente {

	public List<paciente> listar();

	public paciente list(String tokenJava);

	public boolean agregarPaciente(paciente pac);

	public boolean editarPaciente(paciente pac);

	public boolean eliminarPaciente(int idpaciente);
	
}
