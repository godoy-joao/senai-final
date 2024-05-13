/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bean;

import java.sql.Timestamp;

/**
 *
 * @author Joao Guilherme
 */
public class Pedido {

    private int idPedido;
    private int usuario;
    private int enderecoEntrega;
    private Timestamp dataPedido;
    private float valorTotal;
    private String formaPagamento;
    private int status; // 1 - Aguardando pagamento, 2 - Confirmado, 3 - Em Trânsito, 4 - Entregue, 5 - Concluído, 0 - Cancelado

    public Pedido() {
    }

    public Pedido(int idPedido, int usuario, int enderecoEntrega, Timestamp dataPedido, float valorTotal, String formaPagamento, int status) {
        this.idPedido = idPedido;
        this.usuario = usuario;
        this.enderecoEntrega = enderecoEntrega;
        this.dataPedido = dataPedido;
        this.valorTotal = valorTotal;
        this.formaPagamento = formaPagamento;
        this.status = status;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public int getUsuario() {
        return usuario;
    }

    public void setUsuario(int usuario) {
        this.usuario = usuario;
    }

    public int getEnderecoEntrega() {
        return enderecoEntrega;
    }

    public void setEnderecoEntrega(int enderecoEntrega) {
        this.enderecoEntrega = enderecoEntrega;
    }

    public Timestamp getDataPedido() {
        return dataPedido;
    }

    public void setDataPedido(Timestamp dataPedido) {
        this.dataPedido = dataPedido;
    }

    public float getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(float valorTotal) {
        this.valorTotal = valorTotal;
    }

    public String getFormaPagamento() {
        return formaPagamento;
    }

    public void setFormaPagamento(String formaPagamento) {
        this.formaPagamento = formaPagamento;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    
}
