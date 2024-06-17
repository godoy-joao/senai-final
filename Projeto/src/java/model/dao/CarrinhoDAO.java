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
import model.bean.Carrinho;
import model.bean.CarrinhoProduto;
import model.bean.Produto;
import model.bean.Usuario;

/**
 *
 * @author Joao Guilherme
 */
public class CarrinhoDAO {

    /*
    Esse método deve retornar todos os produtos de um usuário fornecido como
    parâmetro, portanto deve ser chamado na página que exibe o carrinho.  
     */
    public List<Produto> lerProdutos(Usuario u) {

        List<Produto> produtos = new ArrayList();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT p.* FROM carrinhoProduto AS cp JOIN produto AS p ON cp.produto = p.idProduto"
                    + " JOIN carrinho AS c ON cp.carrinho = c.idCarrinho JOIN usuario AS u ON c.usuario = u.idUsuario WHERE u.idUsuario = ?");
            stmt.setInt(1, u.getIdUsuario());

            rs = stmt.executeQuery();

            while (rs.next()) {
                Produto p = new Produto();
                p.setIdProduto(rs.getInt("idProduto"));
                p.setNome(rs.getString("nome"));
                p.setDescricao(rs.getString("descricao"));
                p.setValor(rs.getFloat("valor"));
                p.setDesconto(rs.getFloat("desconto"));
                p.setValorFinal(rs.getFloat("valorFinal"));
                p.setDataRegistro(rs.getDate("dataRegistro"));
                produtos.add(p);
            }

            rs.close();
            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
        return produtos;
    }

    public void alterarQuantidade(CarrinhoProduto pc) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("UPDATE carrinhoproduto SET quantidade = ? WHERE idCarrinhoProduto = ?");
            stmt.setInt(1, pc.getQuantidade());
            stmt.setInt(2, pc.getIdCarrinhoProduto());

            stmt.executeUpdate();

            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public CarrinhoProduto selecionarCartProd(int id) {
        CarrinhoProduto pc = new CarrinhoProduto();

        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM carrinhoproduto WHERE idCarrinhoProduto = ?");
            stmt.setInt(1, id);

            rs = stmt.executeQuery();

            if (rs.next()) {
                pc.setIdCarrinhoProduto(rs.getInt("idCarrinhoProduto"));
                pc.setCarrinho(rs.getInt("carrinho"));
                pc.setProduto(rs.getInt("produto"));
                pc.setQuantidade(rs.getInt("quantidade"));
            }

            rs.close();
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pc;
    }

    public List<CarrinhoProduto> selecionarQuantidades(Carrinho c) {
        List<CarrinhoProduto> cps = new ArrayList();

        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM carrinhoProduto WHERE carrinho = ?");
            stmt.setInt(1, c.getIdCarrinho());

            rs = stmt.executeQuery();
            while (rs.next()) {
                CarrinhoProduto cp = new CarrinhoProduto();
                cp.setIdCarrinhoProduto(rs.getInt("idCarrinhoproduto"));
                cp.setCarrinho(rs.getInt("carrinho"));
                cp.setProduto(rs.getInt("produto"));
                cp.setQuantidade(rs.getInt("quantidade"));
                cps.add(cp);
            }

            rs.close();
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cps;
    }

    public Carrinho selecionarCarrinho(Usuario u) {
        Carrinho c = new Carrinho();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM carrinho WHERE usuario = ?");
            stmt.setInt(1, u.getIdUsuario());

            rs = stmt.executeQuery();
            if (rs.next()) {
                c.setIdCarrinho(rs.getInt("idCarrinho"));
                c.setUsuario(rs.getInt("usuario"));

            }

            rs.close();
            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return c;
    }

    public void esvaziarCarrinho(Usuario u) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("DELETE FROM carrinhoProduto WHERE carrinho = ?");
            stmt.setInt(1, u.getIdUsuario());

            stmt.executeUpdate();

            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /*
    Método que retorna caso item tenha inserido no carrinho do usuário ou não
     */
    public boolean adicionarProduto(Produto p, Carrinho c) {
        boolean produtoInserido = false;
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            List<CarrinhoProduto> cps = new ArrayList();
            //Seleciona todos os produtos do carrinho do usuário
            stmt = conexao.prepareStatement("select * from carrinhoproduto WHERE carrinho = ?");
            stmt.setInt(1, c.getIdCarrinho());

            ResultSet rs = stmt.executeQuery();
            int quantidade = 0;
            stmt = conexao.prepareStatement("select * from carrinhoproduto WHERE carrinho = ?");
            stmt.setInt(1, c.getIdCarrinho());

            ResultSet rs1 = stmt.executeQuery();

            while (rs1.next()) {
                quantidade += rs1.getInt("quantidade");
            }
            while (rs.next()) {
                CarrinhoProduto cp = new CarrinhoProduto();
                cp.setIdCarrinhoProduto(rs.getInt("idCarrinhoProduto"));
                cp.setProduto(rs.getInt("produto"));
                cp.setCarrinho(rs.getInt("carrinho"));
                cp.setQuantidade(rs.getInt("quantidade"));
                //Caso produto a ser inserido já esteja no carrinho do usuário, verificará se a soma da quantidade de todos os produtos no carrinho do usuário é
                // menor que 10, caso seja, aumentará a quantidade do mesmo produto no banco
                if (rs.getInt("produto") == p.getIdProduto()) {

                    if (quantidade < 10) {
                        stmt = conexao.prepareStatement("UPDATE carrinhoproduto SET quantidade = ? WHERE idCarrinhoProduto = ?");
                        stmt.setInt(1, cp.getQuantidade() + 1);
                        stmt.setInt(2, cp.getIdCarrinhoProduto());
                        stmt.executeUpdate();
                        produtoInserido = true;
                        return produtoInserido;
                    }

                }
                cps.add(cp);
            }
            //Caso o produto a ser inserido não esteja no carrinho do usuário, verificará a quantidade de produtos no carrinho, caso seja maior ou igual a 10, retornará falso
            // e o produto não será inserido no carrinho.
            if (quantidade >= 10) {
                return produtoInserido;
            } 
            // Caso o produto não esteja no carrinho e a quantidade de produtos seja menor que 10, adicionará uma unidade do produto no carrinho do usuário.
            stmt = conexao.prepareStatement("INSERT INTO carrinhoproduto (carrinho, produto, quantidade) VALUES (?, ?, 1)");
            stmt.setInt(1, c.getIdCarrinho());
            stmt.setInt(2, p.getIdProduto());

            stmt.executeUpdate();

            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
        return true;
    }

    public void removerProduto(Produto p, Carrinho c) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("DELETE FROM carrinhoProduto WHERE carrinho = ? AND produto = ? LIMIT 1");
            stmt.setInt(1, c.getIdCarrinho());
            stmt.setInt(2, p.getIdProduto());

            stmt.executeUpdate();

            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }
}
