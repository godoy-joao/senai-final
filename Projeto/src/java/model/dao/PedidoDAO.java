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
import model.bean.CarrinhoProduto;
import model.bean.Pedido;
import model.bean.Produto;
import model.bean.ProdutoPedido;
import model.bean.Usuario;

/**
 *
 * @author Joao Guilherme
 */
public class PedidoDAO {

    /* try {
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
    public int criar(Pedido p) {
        int idPedido = 0;
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("INSERT INTO pedido (usuario, enderecoEntrega, dataPedido, valorTotal, formaPagamento) VALUES (?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, p.getUsuario());
            stmt.setInt(2, p.getEnderecoEntrega());
            stmt.setTimestamp(3, p.getDataPedido());
            stmt.setFloat(4, p.getValorTotal());
            stmt.setString(5, p.getFormaPagamento());

            stmt.executeUpdate();

            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    idPedido = rs.getInt(1);
                }
            }

            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }

        return idPedido;
    }

    public List<ProdutoPedido> selecionarProdutoPedido(Pedido ped) {
        List<ProdutoPedido> listPp = new ArrayList();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM produtopedido WHERE pedido = ?");
            stmt.setInt(1, ped.getIdPedido());

            rs = stmt.executeQuery();

            while (rs.next()) {
                ProdutoPedido pp = new ProdutoPedido();
                pp.setIdProdutoPedido(rs.getInt("idProdutoPedido"));
                pp.setPedido(rs.getInt("pedido"));
                pp.setProduto(rs.getInt("produto"));
                pp.setQuantidade(rs.getInt("quantidade"));
                listPp.add(pp);
            }

            rs.close();
            stmt.close();
            conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listPp;
    }

    public List<Produto> selecionarProdutosDoPedido(Pedido ped) {
        List<Produto> produtos = new ArrayList();
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT p.* FROM produtopedido as pp JOIN produto AS p ON pp.produto = p.idProduto JOIN pedido AS ped ON pp.pedido = ped.idPedido WHERE ped.idPedido = ?");
            stmt.setInt(1, ped.getIdPedido());

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

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return produtos;
    }

    public Pedido selecionarPorId(int id) {
        Pedido p = new Pedido();

        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM pedido WHERE idPedido = ?");
            stmt.setInt(1, id);

            rs = stmt.executeQuery();

            while (rs.next()) {
                p.setIdPedido(rs.getInt("idPedido"));
                p.setUsuario(rs.getInt("usuario"));
                p.setFormaPagamento(rs.getString("formaPagamento"));
                p.setDataPedido(rs.getTimestamp("dataPedido"));
                p.setStatus(rs.getInt("status"));
                p.setEnderecoEntrega(rs.getInt("enderecoEntrega"));
                p.setValorTotal(rs.getFloat("valorTotal"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }

    public List<Pedido> lerPedidos() {
        List<Pedido> pedidos = new ArrayList();

        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM pedido");

            rs = stmt.executeQuery();
            while (rs.next()) {
                Pedido p = new Pedido();
                p.setIdPedido(rs.getInt("idPedido"));
                p.setUsuario(rs.getInt("usuario"));
                p.setEnderecoEntrega(rs.getInt("enderecoEntrega"));
                p.setValorTotal(rs.getFloat("valorTotal"));
                p.setDataPedido(rs.getTimestamp("dataPedido"));
                pedidos.add(p);
            }

            rs.close();
            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
        return pedidos;
    }

    public List<Pedido> lerPedidos(Usuario u) {
        List<Pedido> pedidos = new ArrayList();

        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;

            stmt = conexao.prepareStatement("SELECT * FROM pedido WHERE usuario = ?");
            stmt.setInt(1, u.getIdUsuario());

            rs = stmt.executeQuery();
            while (rs.next()) {
                Pedido p = new Pedido();
                p.setIdPedido(rs.getInt("idPedido"));
                p.setUsuario(rs.getInt("usuario"));
                p.setEnderecoEntrega(rs.getInt("enderecoEntrega"));
                p.setValorTotal(rs.getFloat("valorTotal"));
                p.setDataPedido(rs.getTimestamp("dataPedido"));
                pedidos.add(p);
            }

            rs.close();
            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
        return pedidos;
    }

    /*
    TABELA STATUS
    1 - Aguardando pagamento
    2 - Pagamento confirmado
    3 - Em trânsito
    4 - Entregue, aguardando confirmação do usuário
    5 - Concluído
    6 - Cancelado
    
     */
    public void definirStatus(Pedido p, int status) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("UPDATE pedido SET status = ? WHERE idPedido = ?");
            stmt.setInt(1, status);
            stmt.setInt(2, p.getIdPedido());

            stmt.executeUpdate();

            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void adicionarProdutos(List<CarrinhoProduto> produtos, Pedido p) {
        if (produtos == null) {
            return;
        }
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            for (int i = 0; i < produtos.size(); i++) {
                stmt = conexao.prepareStatement("INSERT INTO produtopedido (produto, pedido, quantidade) VALUES (?, ?, ?)");
                stmt.setInt(1, produtos.get(i).getProduto());
                stmt.setInt(2, p.getIdPedido());
                stmt.setInt(3, produtos.get(i).getQuantidade());

                stmt.executeUpdate();
            }
            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
