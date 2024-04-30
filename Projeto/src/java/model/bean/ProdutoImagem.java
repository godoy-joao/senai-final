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
public class ProdutoImagem {
    private int idProdutoImagem;
    private int produto;
    private int imagem;

    public ProdutoImagem() {
    }

    public ProdutoImagem(int idProdutoImagem, int produto, int imagem) {
        this.idProdutoImagem = idProdutoImagem;
        this.produto = produto;
        this.imagem = imagem;
    }

    public int getIdProdutoImagem() {
        return idProdutoImagem;
    }

    public void setIdProdutoImagem(int idProdutoImagem) {
        this.idProdutoImagem = idProdutoImagem;
    }

    public int getProduto() {
        return produto;
    }

    public void setProduto(int produto) {
        this.produto = produto;
    }

    public int getImagem() {
        return imagem;
    }

    public void setImagem(int imagem) {
        this.imagem = imagem;
    }
    
    
}
