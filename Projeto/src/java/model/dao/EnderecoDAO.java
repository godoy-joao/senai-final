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
import model.bean.Endereco;
import model.bean.Usuario;

/**
 *
 * @author Joao Guilherme
 */
public class EnderecoDAO {

    public int criar(Endereco end) {
        int id = 0;
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("INSERT INTO endereco (estado, cidade, cep, rua, numero, complemento, usuario) values (?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, end.getEstado());
            stmt.setString(2, end.getCidade());
            stmt.setString(3, end.getCep());
            stmt.setString(4, end.getRua());
            stmt.setString(5, end.getNumero());
            stmt.setString(6, end.getComplemento());
            stmt.setInt(7, end.getUsuario());

            stmt.executeUpdate();
            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    id = rs.getInt(1);
                }
            }

            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
        return id;
    }

    public void deletar(Endereco end) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("DELETE FROM endereco WHERE idEndereco = ?");
            stmt.setInt(1, end.getIdEndereco());

            stmt.executeUpdate();

            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    public Endereco selecionarPorUsuario(Usuario u) {
        Endereco e = new Endereco();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM endereco WHERE usuario = ?");
            stmt.setInt(1, u.getIdUsuario());

            rs = stmt.executeQuery();

            if (rs.next()) {
                e.setIdEndereco(rs.getInt("idEndereco"));
                e.setCep(rs.getString("cep"));
                e.setEstado(rs.getString("estado"));
                e.setCidade(rs.getString("cidade"));
                e.setBairro(rs.getString("bairro"));
                e.setRua(rs.getString("rua"));
                e.setNumero(rs.getString("numero"));
                e.setComplemento(rs.getString("complemento"));
                e.setUsuario(rs.getInt("usuario"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return e;
    }

    public Endereco selecionarPorId(int id) {
        Endereco e = new Endereco();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM endereco WHERE idEndereco = ?");
            stmt.setInt(1, id);

            rs = stmt.executeQuery();

            if (rs.next()) {
                e.setIdEndereco(rs.getInt("idEndereco"));
                e.setCep(rs.getString("cep"));
                e.setEstado(rs.getString("estado"));
                e.setCidade(rs.getString("cidade"));
                e.setBairro(rs.getString("bairro"));
                e.setRua(rs.getString("rua"));
                e.setNumero(rs.getString("numero"));
                e.setComplemento(rs.getString("complemento"));
                e.setUsuario(rs.getInt("usuario"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return e;
    }
}
