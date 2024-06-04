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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import model.bean.Categoria;
import model.bean.Produto;

/**
 *
 * @author Joao Guilherme
 */
public class ProdutoDAO {

    public List<Produto> listarRecentes(int quantidade) {
        List<Produto> produtos = new ArrayList();

        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            if (quantidade > 0) {
                stmt = conexao.prepareStatement("SELECT * FROM produto ORDER BY dataRegistro LIMIT ?");
                stmt.setInt(1, quantidade);
            } else {
                stmt = conexao.prepareStatement("SELECT * FROM produto ORDER BY dataRegistro");
            }
            rs = stmt.executeQuery();

            while (rs.next()) {
                Produto p = new Produto();
                p.setIdProduto(rs.getInt("idProduto"));
                p.setNome(rs.getString("nome"));
                p.setValor(rs.getFloat("valor"));
                p.setDesconto(rs.getFloat("desconto"));
                p.setValorFinal(rs.getFloat("valorFinal"));
                p.setDescricao(rs.getString("descricao"));
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

    public List<Produto> listarTodosDisponiveis() {
        List<Produto> produtos = new ArrayList();

        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;
            String query = "SELECT * FROM produto AS p INNER JOIN estoque AS e ON p.idProduto = e.produto WHERE e.quantidade > 0";

            stmt = conexao.prepareStatement(query);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Produto p = new Produto();
                p.setIdProduto(rs.getInt("idProduto"));
                p.setNome(rs.getString("nome"));
                p.setValor(rs.getFloat("valor"));
                p.setDesconto(rs.getFloat("desconto"));
                p.setValorFinal(rs.getFloat("valorFinal"));
                p.setDescricao(rs.getString("descricao"));
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

    public List<Produto> listarTodos() {
        List<Produto> produtos = new ArrayList();

        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;
            String query = "SELECT * FROM produto";

            stmt = conexao.prepareStatement(query);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Produto p = new Produto();
                p.setIdProduto(rs.getInt("idProduto"));
                p.setNome(rs.getString("nome"));
                p.setValor(rs.getFloat("valor"));
                p.setDesconto(rs.getFloat("desconto"));
                p.setValorFinal(rs.getFloat("valorFinal"));
                p.setDescricao(rs.getString("descricao"));
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

    public List<Produto> listarPorCategoria(Categoria c) {
        List<Produto> produtos = new ArrayList();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;
            String query = "SELECT * FROM produto AS p INNER JOIN categoria AS c ON p.categoria = c.idCategoria WHERE c.nome = ?";

            stmt = conexao.prepareStatement(query);
            stmt.setString(1, c.getNome());

            rs = stmt.executeQuery();

            while (rs.next()) {
                Produto p = new Produto();
                p.setIdProduto(rs.getInt("idProduto"));
                p.setNome(rs.getString("nome"));
                p.setValor(rs.getFloat("valor"));
                p.setDesconto(rs.getFloat("desconto"));
                p.setValorFinal(rs.getFloat("valorFinal"));
                p.setDescricao(rs.getString("descricao"));
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

    public List<Produto> listarPorPesquisaCategoria(String busca, List<String> categorias) {
        List<Produto> produtos = new ArrayList();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            String distinct = "";
            if (categorias != null) {
                distinct = "DISTINCT";
            }
            if (busca == null) {
                busca = "";
            }
            busca = "%" + busca + "%";
            String sql = "SELECT " + distinct + " p.* FROM produto AS p JOIN produtocategoria AS pc ON p.idProduto = pc.produto JOIN categoria AS c ON pc.categoria = c.idCategoria WHERE p.nome LIKE ?";
            if (categorias != null) {
                for (int i = 0; i < categorias.size(); i++) {
                    if (i == 0) {
                        sql += " AND c.idCategoria = ?";
                    } else {
                        sql += " OR c.idCategoria = ?";
                    }

                }
            }
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, busca);
            if (categorias != null) {
                for (int i = 0; i < categorias.size(); i++) {
                    stmt.setInt(2 + i, Integer.parseInt(categorias.get(i)));
                }
            }
            rs = stmt.executeQuery();

            while (rs.next()) {
                Produto p = new Produto();
                p.setIdProduto(rs.getInt("idProduto"));
                p.setNome(rs.getString("nome"));
                p.setValor(rs.getFloat("valor"));
                p.setDesconto(rs.getFloat("desconto"));
                p.setValorFinal(rs.getFloat("valorFinal"));
                p.setDescricao(rs.getString("descricao"));
                p.setDataRegistro(rs.getDate("dataRegistro"));
                produtos.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return produtos;
    }

    public List<Produto> listarPorPesquisa(String search) {
        List<Produto> produtos = new ArrayList();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM produto WHERE nome LIKE ?");
            stmt.setString(1, search);

            rs = stmt.executeQuery();

            while (rs.next()) {
                Produto p = new Produto();
                p.setIdProduto(rs.getInt("idProduto"));
                p.setNome(rs.getString("nome"));
                p.setValor(rs.getFloat("valor"));
                p.setDesconto(rs.getFloat("desconto"));
                p.setValorFinal(rs.getFloat("valorFinal"));
                p.setDescricao(rs.getString("descricao"));
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

    public Produto selecionarPorId(int id) {
        Produto p = new Produto();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM produto WHERE idProduto = ?");
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                p.setIdProduto(rs.getInt("idProduto"));
                p.setNome(rs.getString("nome"));
                p.setValor(rs.getFloat("valor"));
                p.setDesconto(rs.getFloat("desconto"));
                p.setValorFinal(rs.getFloat("valorFinal"));
                p.setDescricao(rs.getString("descricao"));
                p.setDataRegistro(rs.getDate("dataRegistro"));
            }
            rs.close();
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }

    public List<Produto> listarTodosComDesconto() {
        List<Produto> produtos = new ArrayList();

        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM produto WHERE desconto > 1");
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

    public int adicionarCategoria(int produto, int categoria) {
        int totalCategorias = -1;
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("INSERT INTO produtoCategoria (produto, categoria) VALUES (?, ?)");
            stmt.setInt(1, produto);
            stmt.setInt(2, categoria);

            stmt.executeUpdate();

            stmt = conexao.prepareStatement("SELECT * FROM produtoCategoria WHERE produto = ?");
            stmt.setInt(1, produto);

            rs = stmt.executeQuery();
            while (rs.next()) {
                if (!(totalCategorias == -1)) {
                    totalCategorias++;
                } else {
                    totalCategorias = 1;
                }
            }

            rs.close();
            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalCategorias;
    }

    public int criar(Produto p) {
        int id = -1;
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("INSERT INTO produto (nome, descricao, valor, desconto) VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, p.getNome());
            stmt.setString(2, p.getDescricao());
            stmt.setFloat(3, p.getValor());
            stmt.setFloat(4, p.getDesconto());

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

    public void atualizar(Produto p) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("UPDATE produto SET nome = ?, valor = ?, desconto = ?, descricao = ? WHERE idProduto = ?");
            stmt.setString(1, p.getNome());
            stmt.setFloat(2, p.getValor());
            stmt.setFloat(3, p.getDesconto());
            stmt.setString(4, p.getDescricao());
            stmt.setInt(5, p.getIdProduto());

            stmt.executeUpdate();

            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deletar(int id) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("DELETE FROM produto WHERE idProduto = ?");
            stmt.setInt(1, id);

            stmt.executeUpdate();

            stmt = conexao.prepareStatement("DELETE FROM imagem WHERE produto = ?");
            stmt.setInt(1, id);

            stmt.executeUpdate();

            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
