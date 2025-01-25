/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dbcontext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */
public class db {
	public static Connection getConnection() {
		String URL = "jdbc:postgresql://localhost:5432/giaohang";
		String USER = "postgres";
		String PASSWORD = "1";

		Connection conn = null;
		try {
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return conn;
	}
}
