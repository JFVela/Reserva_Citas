package net.reservaCitas.Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    Connection con;

    public Conexion() {
        try {
            // Cargar el driver adecuado para versiones recientes de MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establecer la conexión con la base de datos
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/reservacitas", "root", "");
        } catch (ClassNotFoundException e) {
            System.err.println("Driver de MySQL no encontrado: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Error al conectar a la base de datos: " + e.getMessage());
        }
    }

    public Connection getConection() {
        return con;
    }
}
