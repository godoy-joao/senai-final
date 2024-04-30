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
    public void insertImagem(File imagem) throws FileNotFoundException {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            FileInputStream inputStream = new FileInputStream(imagem);

            stmt = conexao.prepareStatement("INSERT INTO imagem (imagem) VALUES (?)");
            stmt.setBlob(1, inputStream);

            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
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
                img.setImagem(rs.getBlob("imagem"));
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

            stmt = conexao.prepareStatement("SELECT i.* FROM imagem i "
                    + "JOIN produto_imagem pi ON i.idImagem = pi.imagem WHERE pi.produto = ?");
            
            rs = stmt.executeQuery();
            while (rs.next()) {
                Imagem i = new Imagem();
                i.setIdImagem(rs.getInt("idImagem"));
                i.setImagem(rs.getBlob("imagem"));
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

    public ImageIcon blobToImage(Blob blob) throws SQLException, IOException {
        byte[] imageBytes = blob.getBytes(1, (int) blob.length());
        Image imagem = ImageIO.read(new ByteArrayInputStream(imageBytes));
        ImageIcon img = new ImageIcon(imagem);
        return img;
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
