/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Senai
 */
public class Conexao {
    private static final String URL = "jdbc:mysql://localhost:3306/senai_final?useSSL=false";
    private static final String USER = "root";
    private static final String PASSWORD = "admin";

    public static Connection conectar() throws SQLException {
        Connection conn = null;
        try { 
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
