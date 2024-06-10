/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import conexao.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.bean.Avaliacao;

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
       } catch (SQLException e){
           e.printStackTrace();
       } 
   }
}
