/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.sql.Connection;
import conexao.Conexao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Base64;
import model.bean.Usuario;

/**
 *
 * @author Joao Guilherme
 */
public class UsuarioDAO {

    /*
    try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("");
            rs = stmt.executeQuery();

            if (rs.next()) {

            }

            rs.close();
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
     */
    public int login(Usuario u) {
        int idUsuario = -1;
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;
            String query = "SELECT * FROM usuario WHERE (email = ? OR telefone = ?) AND senha = ?";
            stmt = conexao.prepareStatement(query);
            stmt.setString(1, u.getEmail());
            stmt.setString(2, u.getTelefone());
            stmt.setString(3, u.getSenha());

            rs = stmt.executeQuery();
            if (rs.next()) {
                idUsuario = rs.getInt(1);
            }
            rs.close();
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return idUsuario;
    }

    public Usuario getUsuarioById(int id) {
        Usuario u = new Usuario();
        if (id == -1) {
            return u;
        }
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM usuario WHERE idUsuario = ?");
            stmt.setInt(1, id);

            rs = stmt.executeQuery();

            if (rs.next()) {
                u.setIdUsuario(rs.getInt("idUsuario"));
                u.setNome(rs.getString("nome"));
                u.setEmail(rs.getString("email"));
                u.setTelefone(rs.getString("telefone"));
                u.setCpf(rs.getString("cpf"));
                u.setDataNasc(rs.getDate("dataNascimento"));
                u.setTipo(rs.getInt("tipo"));
                u.setFoto(rs.getBytes("fotoPerfil"));
                if (u.getFoto() != null) {
                    u.setFotoBase64(Base64.getEncoder().encodeToString(u.getFoto()));
                }

            } else {
                System.out.println("Usuario não localizado.");
            }

            rs.close();
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return u;
    }

    public Usuario getUsuarioByTel(String telefone) {
        Usuario u = new Usuario();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM usuario WHERE telefone = ?");
            stmt.setString(1, telefone);

            rs = stmt.executeQuery();

            if (rs.next()) {
                u.setIdUsuario(rs.getInt("idUsuario"));
                u.setNome(rs.getString("nome"));
                u.setEmail(rs.getString("email"));
                u.setTelefone(rs.getString("telefone"));
                u.setCpf(rs.getString("cpf"));
                u.setDataNasc(rs.getDate("dataNascimento"));
                u.setTipo(rs.getInt("tipo"));
                u.setFoto(rs.getBytes("fotoPerfil"));
            } else {
                System.out.println("Usuario não localizado.");
            }

            rs.close();
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return u;
    }

    public void updateEmail(int id, String email) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("UPDATE usuario SET email = ? WHERE idUsuario = ?");
            stmt.setString(1, email);
            stmt.setInt(2, id);
            stmt.executeUpdate();

            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateSenha(int id, String senha) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("UPDATE usuario SET senha = ? WHERE idUsuario = ?");
            stmt.setString(1, senha);
            stmt.setInt(2, id);
            stmt.executeUpdate();

            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateTel(int id, String tel) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("UPDATE usuario SET telefone = ? WHERE idUsuario = ?");
            stmt.setString(1, tel);
            stmt.setInt(2, id);
            stmt.executeUpdate();

            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Usuario getUsuarioByEmail(String email) {
        Usuario u = new Usuario();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM usuario WHERE email = ?");
            stmt.setString(1, email);

            rs = stmt.executeQuery();

            if (rs.next()) {
                u.setIdUsuario(rs.getInt("idUsuario"));
                u.setNome(rs.getString("nome"));
                u.setEmail(rs.getString("email"));
                u.setTelefone(rs.getString("telefone"));
                u.setCpf(rs.getString("cpf"));
                u.setDataNasc(rs.getDate("dataNascimento"));
                u.setTipo(rs.getInt("tipo"));
                u.setFoto(rs.getBytes("fotoPerfil"));
            } else {
                System.out.println("Usuario não localizado.");
            }

            rs.close();
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return u;
    }

    public int create(Usuario u) {
        int idUsuario = -1;
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("INSERT INTO usuario (nome, email, senha, telefone, dataNascimento, cpf) values (?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, u.getNome());
            stmt.setString(2, u.getEmail());
            stmt.setString(3, u.getSenha());
            stmt.setString(4, u.getTelefone());
            stmt.setDate(5, u.getDataNasc());
            stmt.setString(6, "0");

            stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                idUsuario = rs.getInt(1);
            }
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return idUsuario;
    }

    public void update(Usuario u) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("UPDATE usuario SET nome = ?, email = ?, senha = ?, telefone = ?, fotoPerfil = ? WHERE idUsuario = ?");
            stmt.setString(1, u.getNome());
            stmt.setString(2, u.getEmail());
            stmt.setString(3, u.getSenha());
            stmt.setString(4, u.getTelefone());
            stmt.setBytes(5, u.getFoto());
            stmt.setInt(6, u.getIdUsuario());

            stmt.executeUpdate();

            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(Usuario u) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("DELETE FROM carrinho WHERE usuario = ?");
            stmt.setInt(1, u.getIdUsuario());
            
            stmt.executeUpdate();
            
            stmt = conexao.prepareStatement("DELETE FROM usuario WHERE idUsuario = ?");
            stmt.setInt(1, u.getIdUsuario());
            
            stmt.executeUpdate();

            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
