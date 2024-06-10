/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bean;

/**
 *
 * @author Senai
 */
public class Avaliacao {
    private int idAvaliacao;
    private int usuario;
    private int produto;
    private int nota;
    private String conteudo;

    public Avaliacao() {
    }

    public Avaliacao(int idAvaliacao, int usuario, int produto, int nota, String conteudo) {
        this.idAvaliacao = idAvaliacao;
        this.usuario = usuario;
        this.produto = produto;
        this.nota = nota;
        this.conteudo = conteudo;
    }

    public int getIdAvaliacao() {
        return idAvaliacao;
    }

    public void setIdAvaliacao(int idAvaliacao) {
        this.idAvaliacao = idAvaliacao;
    }

    public int getUsuario() {
        return usuario;
    }

    public void setUsuario(int usuario) {
        this.usuario = usuario;
    }

    public int getProduto() {
        return produto;
    }

    public void setProduto(int produto) {
        this.produto = produto;
    }

    public int getNota() {
        return nota;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }

    public String getConteudo() {
        return conteudo;
    }

    public void setConteudo(String conteudo) {
        this.conteudo = conteudo;
    }
    
    
}
