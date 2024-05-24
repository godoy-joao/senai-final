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
import java.util.ArrayList;
import java.util.List;
import model.bean.Pedido;
import model.bean.Produto;
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
    public void criar(Pedido p) {
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            stmt = conexao.prepareStatement("INSERT INTO pedido (usuario, enderecoEntrega, dataPedido, valorTotal) VALUES (?, ?, ?, ?)");
            stmt.setInt(1, p.getUsuario());
            stmt.setInt(2, p.getEnderecoEntrega());
            stmt.setTimestamp(3, p.getDataPedido());
            stmt.setFloat(4, p.getValorTotal());

            stmt.executeUpdate();

            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
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

    public void adicionarProdutos(List<Produto> produtos, Pedido p) {
        if (produtos == null) {
            return;
        }
        try {
            Connection conexao = Conexao.conectar();
            PreparedStatement stmt = null;

            for (int i = 0; i < produtos.size(); i++) {
                stmt = conexao.prepareStatement("INSERT INTO produtopedido (produto, pedido) VALUES (?, ?)");
                stmt.setInt(1, produtos.get(i).getIdProduto());
                stmt.setInt(2, p.getIdPedido());

                stmt.executeUpdate();
            }
            stmt.close();
            conexao.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
