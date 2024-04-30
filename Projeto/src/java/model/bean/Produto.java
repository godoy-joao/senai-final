/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bean;

/**
 *
 * @author Joao Guilherme
 */
public class Produto {
    private int idProduto;
    private int categoria;
    private String nome;
    private Float valor;
    private Float desconto;
    private Float valorFinal;

    public Produto() {
    }

    public Produto(int idProduto, int categoria, String nome, Float valor, Float desconto, Float valorFinal) {
        this.idProduto = idProduto;
        this.categoria = categoria;
        this.nome = nome;
        this.valor = valor;
        this.desconto = desconto;
        this.valorFinal = valorFinal;
    }

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Float getValor() {
        return valor;
    }

    public void setValor(Float valor) {
        this.valor = valor;
    }

    public Float getDesconto() {
        return desconto;
    }

    public void setDesconto(Float desconto) {
        this.desconto = desconto;
    }

    public Float getValorFinal() {
        return valorFinal;
    }

    public void setValorFinal(Float valorFinal) {
        this.valorFinal = valorFinal;
    }
    
}
