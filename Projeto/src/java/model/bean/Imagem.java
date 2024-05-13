/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bean;

import java.sql.Blob;

/**
 *
 * @author Joao Guilherme
 */
public class Imagem {

    private int idImagem;
    private int produto;
    private byte[] imagem;
    private String formato;

    public Imagem() {
    }

    public Imagem(int idImagem, int produto, byte[] imagem, String formato) {
        this.idImagem = idImagem;
        this.produto = produto;
        this.imagem = imagem;
        this.formato = formato;
    }

    public int getIdImagem() {
        return idImagem;
    }

    public void setIdImagem(int idImagem) {
        this.idImagem = idImagem;
    }

    public int getProduto() {
        return produto;
    }

    public void setProduto(int produto) {
        this.produto = produto;
    }

    public byte[] getImagem() {
        return imagem;
    }

    public void setImagem(byte[] imagem) {
        this.imagem = imagem;
    }

    public String getFormato() {
        return formato;
    }

    public void setFormato(String formato) {
        this.formato = formato;
    }

    
}
