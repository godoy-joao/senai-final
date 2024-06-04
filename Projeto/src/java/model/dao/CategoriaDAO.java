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
import java.util.ArrayList;
import java.util.List;
import model.bean.Categoria;
import model.bean.Produto;

/**
 *
 * @author Joao Guilherme
 */
public class CategoriaDAO {

    public int criar(Categoria c) {
        int idCategoria = -1;
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("INSERT INTO categoria (nome, capa) values (?, ?)", Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, c.getNome());
            stmt.setBytes(2, c.getCapa());

            stmt.executeUpdate();
            System.out.println("Categoria inserida");

            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                idCategoria = rs.getInt(1);
            }
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return idCategoria;
    }

    public List<Categoria> listarTodos() {
        List<Categoria> categorias = new ArrayList();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM categoria");

            rs = stmt.executeQuery();

            while (rs.next()) {
                Categoria c = new Categoria();
                c.setIdCategoria(rs.getInt("idCategoria"));
                c.setNome(rs.getString("nome"));
                c.setCapa(rs.getBytes("capa"));
                categorias.add(c);
            }
            rs.close();
            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
        return categorias;
    }

    public List<Categoria> listarCategoriasDoProduto(Produto p) {
        List<Categoria> categorias = new ArrayList();

        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = conexao.prepareStatement("SELECT c.* FROM categoria AS c JOIN produtocategoria AS pc ON c.idCategoria = pc.categoria JOIN produto AS p ON pc.produto = p.idProduto WHERE p.idProduto = ?");
            stmt.setInt(1, p.getIdProduto());
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Categoria c = new Categoria();
                c.setIdCategoria(rs.getInt("idCategoria"));
                c.setNome(rs.getString("nome"));
                c.setCapa(rs.getBytes("capa"));
                categorias.add(c);
            }
            
            rs.close();
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categorias;

    }

    public Categoria selecionarPorId(int id) {
        Categoria c = new Categoria();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM categoria WHERE idCategoria = ?");
            stmt.setInt(1, id);

            rs = stmt.executeQuery();

            if (rs.next()) {
                c.setIdCategoria(id);
                c.setNome(rs.getString("nome"));
                c.setCapa(rs.getBytes("capa"));
            }

            rs.close();
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return c;
    }

    public Categoria selecionarPorNome(String nome) {
        Categoria c = new Categoria();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM categoria WHERE nome = ?");
            stmt.setString(1, c.getNome());

            rs = stmt.executeQuery();

            if (rs.next()) {
                c.setIdCategoria(rs.getInt("idCategoria"));
                c.setNome(rs.getString("nome"));
                c.setCapa(rs.getBytes("capa"));
            }

            rs.close();
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return c;
    }

    public Categoria selecionarPorNome(Categoria c) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM categoria WHERE nome = ?");
            stmt.setString(1, c.getNome());

            rs = stmt.executeQuery();

            if (rs.next()) {
                c.setIdCategoria(rs.getInt("idCategoria"));
                c.setNome(rs.getString("nome"));
                c.setCapa(rs.getBytes("capa"));
            }

            rs.close();
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return c;
    }
}
