/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import conexao.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.bean.Avaliacao;
import model.bean.Produto;

/**
 *
 * @author Senai
 */
public class AvaliacaoDAO {

    public void create(Avaliacao ava) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("INSERT INTO avaliacao (usuario, produto, nota, conteudo) VALUEs (?, ?, ?, ?)");
            stmt.setInt(1, ava.getUsuario());
            stmt.setInt(2, ava.getProduto());
            stmt.setInt(3, ava.getNota());
            stmt.setString(4, ava.getConteudo());

            stmt.executeUpdate();

            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Avaliacao> selecionarPorProduto(Produto p) {
        List<Avaliacao> avaliacoes = new ArrayList();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM avaliacoes WHERE produto = ?");
            stmt.setInt(1, p.getIdProduto());

            rs = stmt.executeQuery();

            while (rs.next()) {
                Avaliacao aval = new Avaliacao();
                aval.setIdAvaliacao(rs.getInt("idAvaliacao"));
                aval.setProduto(rs.getInt("produto"));
                aval.setProduto(rs.getInt("usuario"));
                aval.setNota(rs.getInt("nota"));
                aval.setConteudo(rs.getString("conteudo"));
                avaliacoes.add(aval);
            }

            rs.close();
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return avaliacoes;
    }

    public Avaliacao selecionarPorId(int id) {
        Avaliacao aval = new Avaliacao();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM avaliacao WHERE idAvaliacao = ?");
            stmt.setInt(1, id);

            rs = stmt.executeQuery();

            if (rs.next()) {
                aval.setIdAvaliacao(rs.getInt("idAvaliacao"));
                aval.setProduto(rs.getInt("produto"));
                aval.setProduto(rs.getInt("usuario"));
                aval.setNota(rs.getInt("nota"));
                aval.setConteudo(rs.getString("conteudo"));
            }

            rs.close();
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return aval;
    }

    public void delete(int id) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("DELETE FROM avaliacao WHERE idAvaliacao = ?");
            stmt.setInt(1, id);

            stmt.executeUpdate();

            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
