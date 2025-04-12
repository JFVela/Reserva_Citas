package net.reservaCitas.Interfaces;

import java.util.List;

import net.reservaCitas.Modelo.Cliente;

public interface CRUD {

	public List listar();

	public Cliente list(String tokenJava);

	public boolean agregarCliente(Cliente cli);

	public boolean editarCliente(Cliente cli);

	public boolean eliminarCliente(int id);

}
