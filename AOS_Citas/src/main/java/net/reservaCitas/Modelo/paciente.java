package net.reservaCitas.Modelo;

public class paciente {
	// Variables
	private int idpaciente;
	private int dni;
	private String token;
	private String nombres;
	private String apellidoPaterno;
	private String apellidoMaterno;
	private String sexo;
	private String fechaNacimiento;
	private String direccion;

	public paciente() {
	}

	public paciente(int idpaciente, int dni, String token, String nombres, String apellidoPaterno,
			String apellidoMaterno, String sexo, String fechaNacimiento, String direccion) {
		this.idpaciente = idpaciente;
		this.dni = dni;
		this.token = token;
		this.nombres = nombres;
		this.apellidoPaterno = apellidoPaterno;
		this.apellidoMaterno = apellidoMaterno;
		this.sexo = sexo;
		this.fechaNacimiento = fechaNacimiento;
		this.direccion = direccion;
	}

	public int getIdpaciente() {
		return idpaciente;
	}

	public void setIdpaciente(int idpaciente) {
		this.idpaciente = idpaciente;
	}

	public int getDni() {
		return dni;
	}

	public void setDni(int dni) {
		this.dni = dni;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApellidoPaterno() {
		return apellidoPaterno;
	}

	public void setApellidoPaterno(String apellidoPaterno) {
		this.apellidoPaterno = apellidoPaterno;
	}

	public String getApellidoMaterno() {
		return apellidoMaterno;
	}

	public void setApellidoMaterno(String apellidoMaterno) {
		this.apellidoMaterno = apellidoMaterno;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(String fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
}
