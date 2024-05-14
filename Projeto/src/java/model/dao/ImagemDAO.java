/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.sql.Connection;
import conexao.Conexao;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import model.bean.Imagem;
import model.bean.Produto;

/**
 *
 * @author Joao Guilherme
 */
public class ImagemDAO {

    /*
    try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;
            String query = "";
            
            stmt = conexao.prepareStatement(query);
            
            
            rs.close();
            stmt.close();
            conexao.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
                   
        }
     */
    public int insertImagem(Imagem imagem) throws FileNotFoundException {
        int idImagem = -1;
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("INSERT INTO imagem (produto, imagem, formato) VALUES (?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, imagem.getProduto());
            stmt.setBytes(2, imagem.getImagem());
            stmt.setString(3, imagem.getFormato());
            
            stmt.executeUpdate();
            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    idImagem = rs.getInt(1);
                }
            }
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return idImagem;
    }
    
    public Imagem getFirstImagem(Produto p) {
        Imagem img = new Imagem();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM imagem WHERE produto = ? LIMIT 1");
            stmt.setInt(1, p.getIdProduto());

            rs = stmt.executeQuery();

            if (rs.next()) {
                img.setIdImagem(rs.getInt("idImagem"));
                img.setProduto(rs.getInt("produto"));
                img.setImagem(rs.getBytes("imagem"));
                img.setFormato(rs.getString("formato"));
            }

            rs.close();
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return img;
    }

    public Imagem getImagem(int id) {
        Imagem img = new Imagem();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM imagem WHERE id = ?");
            stmt.setInt(1, id);

            rs = stmt.executeQuery();

            if (rs.next()) {
                img.setIdImagem(id);
                //img.setImagem(rs.getBlob("imagem"));
            }

            rs.close();
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return img;
    }

    public List<Imagem> getImageList(Produto p) {
        List<Imagem> imagens = new ArrayList();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM imagem WHERE produto = ?");
            stmt.setInt(1, p.getIdProduto());
            
            rs = stmt.executeQuery();
            while (rs.next()) {
                Imagem i = new Imagem();
                i.setIdImagem(rs.getInt("idImagem"));
                i.setProduto(rs.getInt("produto"));
                i.setImagem(rs.getBytes("imagem"));
                i.setFormato(rs.getString("formato"));
                imagens.add(i);
            }
            
            rs.close();
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return imagens;
    }

    public void delete(int id) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("DELETE FROM imagem WHERE idImagem = ?");
            stmt.setInt(1, id);

            stmt.executeUpdate();

            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

}
