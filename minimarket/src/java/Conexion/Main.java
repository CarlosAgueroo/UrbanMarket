/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;

import DAO.ProductoDAO;

/**
 *
 * @author USUARIO
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        ProductoDAO productoDAO = new ProductoDAO();
        int idProducto = 1; // Reemplaza con un ID de producto válido
        int nuevaCantidad = 15; // Reemplaza con una cantidad válida

        boolean resultado = productoDAO.actualizarStock(idProducto, nuevaCantidad);
        System.out.println("Actualización exitosa: " + resultado);
    }

}
