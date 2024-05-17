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
public class ProdutoCategoria {
    private int idProdutoCategoria;
    private int produto;
    private int categoria;

    public ProdutoCategoria(int idProdutoCategoria, int produto, int categoria) {
        this.idProdutoCategoria = idProdutoCategoria;
        this.produto = produto;
        this.categoria = categoria;
    }

    public ProdutoCategoria() {
    }

    public int getIdProdutoCategoria() {
        return idProdutoCategoria;
    }

    public void setIdProdutoCategoria(int idProdutoCategoria) {
        this.idProdutoCategoria = idProdutoCategoria;
    }

    public int getProduto() {
        return produto;
    }

    public void setProduto(int produto) {
        this.produto = produto;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }
    
    
}
