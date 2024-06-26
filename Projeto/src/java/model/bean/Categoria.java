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
public class Categoria {

    private int idCategoria;
    private String nome;
    private byte[] capa;
    private String capaBase64;

    public Categoria() {
    }

    public Categoria(int idCategoria, String nome, byte[] capa, String capaBase64) {
        this.idCategoria = idCategoria;
        this.nome = nome;
        this.capa = capa;
        this.capaBase64 = capaBase64;
    }

    public String getCapaBase64() {
        return capaBase64;
    }

    public void setCapaBase64(String capaBase64) {
        this.capaBase64 = capaBase64;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public byte[] getCapa() {
        return capa;
    }

    public void setCapa(byte[] capa) {
        this.capa = capa;
    }

}
