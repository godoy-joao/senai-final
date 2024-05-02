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
    private byte[] imagem;

    public Imagem() {
    }

    public Imagem(int idImagem, byte[] imagem) {
        this.idImagem = idImagem;
        this.imagem = imagem;
    }

    public int getIdImagem() {
        return idImagem;
    }

    public void setIdImagem(int idImagem) {
        this.idImagem = idImagem;
    }

    public byte[] getImagem() {
        return imagem;
    }

    public void setImagem(byte[] imagem) {
        this.imagem = imagem;
    }

    
    
}
