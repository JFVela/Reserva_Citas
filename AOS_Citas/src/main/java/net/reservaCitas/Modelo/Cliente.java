package net.reservaCitas.Modelo;

public class Cliente {
	//Creamos las variables
    private int dni;
    private String nombres;
    private String apellidoMaterno;
    private String apellidoPaterno;
    private int edad;
    private String token;

    // Constructor vacío
    public Cliente() {
    }

    // Constructor con todos los campos
    public Cliente(int dni, String nombres, String apellidoMaterno, String apellidoPaterno, int edad, String token) {
        this.dni = dni;
        this.nombres = nombres;
        this.apellidoMaterno = apellidoMaterno;
        this.apellidoPaterno = apellidoPaterno;
        this.edad = edad;
        this.token = token;
    }

    // Getters y Setters
    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidoMaterno() {
        return apellidoMaterno;
    }

    public void setApellidoMaterno(String apellidoMaterno) {
        this.apellidoMaterno = apellidoMaterno;
    }

    public String getApellidoPaterno() {
        return apellidoPaterno;
    }

    public void setApellidoPaterno(String apellidoPaterno) {
        this.apellidoPaterno = apellidoPaterno;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    @Override
    public String toString() {
        return "Cliente{" +
                "dni=" + dni +
                ", nombres='" + nombres + '\'' +
                ", apellidoMaterno='" + apellidoMaterno + '\'' +
                ", apellidoPaterno='" + apellidoPaterno + '\'' +
                ", edad=" + edad +
                ", token='" + token + '\'' +
                '}';
    }
}
