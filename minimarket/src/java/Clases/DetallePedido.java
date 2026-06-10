package Clases;

import java.io.Serializable;

public class DetallePedido implements Serializable {
    private static final long serialVersionUID = 1L;

    private int idDetalle;
    private Pedido pedido; // Puede ser null al agregar al carrito
    private Producto producto;
    private int cantidad;
    private double subtotal;

    // Constructores
    public DetallePedido() {}

    public DetallePedido(int idDetalle, Pedido pedido, Producto producto, int cantidad, double subtotal) {
        this.idDetalle = idDetalle;
        this.pedido = pedido;
        this.producto = producto;
        this.cantidad = cantidad;
        this.subtotal = subtotal;
    }

    // Getters y Setters
    public int getIdDetalle() {
        return idDetalle;
    }

    public void setIdDetalle(int idDetalle) {
        this.idDetalle = idDetalle;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }
}
