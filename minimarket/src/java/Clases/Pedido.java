/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.util.Date;
import java.util.List;

public class Pedido {

    private int idPedido;
    private Date fechaPedido;
    private double subtotal;
    private double igv;
    private double total;
    private Usuario usuario;
    private int id_usuario;
    private List<DetallePedido> detalles;

    public Pedido() {
    }

    public Pedido(int idPedido, Date fechaPedido, double total, Usuario usuario, List<DetallePedido> detalles) {
        this.idPedido = idPedido;
        this.fechaPedido = fechaPedido;
        this.total = total;
        this.usuario = usuario;
        this.detalles = detalles;
    }

    // Constructor
    public Pedido(int idPedido, Date fechaPedido, double total, Usuario usuario) {
        this.idPedido = idPedido;
        this.fechaPedido = fechaPedido;
        this.total = total;
        this.usuario = usuario;
    }

    public Pedido(int idPedido, Date fechaPedido, double total, int id_usuario) {
        this.idPedido = idPedido;
        this.fechaPedido = fechaPedido;
        this.total = total;
        this.id_usuario = id_usuario;
    }

    // Getters y Setters
    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public Date getFechaPedido() {
        return fechaPedido;
    }

    public void setFechaPedido(Date fechaPedido) {
        this.fechaPedido = fechaPedido;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public double getIgv() {
        return igv;
    }

    public void setIgv(double igv) {
        this.igv = igv;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public List<DetallePedido> getDetalles() {
        return detalles;
    }

    public void setDetalles(List<DetallePedido> detalles) {
        this.detalles = detalles;
    }
}
