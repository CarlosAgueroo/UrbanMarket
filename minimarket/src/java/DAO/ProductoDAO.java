package DAO;

import Clases.Producto;
import Clases.Categoria;
import Conexion.Conectar;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO extends Conectar {

    // Método para crear un producto
    public boolean crear(Producto producto) {
        conectar();
        String sql = "INSERT INTO productos (nombre_producto, descripcion, precio, stock, sexo, id_categoria) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = getConexion().prepareStatement(sql);
            ps.setString(1, producto.getNombreProducto());
            ps.setString(2, producto.getDescripcion());
            ps.setDouble(3, producto.getPrecio());
            ps.setInt(4, producto.getStock());
            ps.setString(5, producto.getSexo());
            ps.setInt(6, producto.getCategoria().getIdCategoria());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            desconectar();
        }
    }

    // Método para obtener todos los productos
    public List<Producto> obtenerTodos() {
        conectar();
        List<Producto> productos = new ArrayList<>();
        String sql = "SELECT p.*, c.nombre_categoria FROM productos p INNER JOIN categorias c ON p.id_categoria = c.id_categoria";
        try {
            Statement st = getConexion().createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Categoria categoria = new Categoria(
                        rs.getInt("id_categoria"),
                        rs.getString("nombre_categoria")
                );
                Producto producto = new Producto(
                        rs.getInt("id_producto"),
                        rs.getString("nombre_producto"),
                        rs.getString("descripcion"),
                        rs.getDouble("precio"),
                        rs.getInt("stock"),
                        rs.getString("sexo"),
                        categoria
                );
                productos.add(producto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            desconectar();
        }
        return productos;
    }

    // Método para actualizar un producto
    public boolean actualizar(Producto producto) {
        conectar();
        String sql = "UPDATE productos SET nombre_producto = ?, descripcion = ?, precio = ?, stock = ?, sexo = ?, id_categoria = ? WHERE id_producto = ?";
        try {
            PreparedStatement ps = getConexion().prepareStatement(sql);
            ps.setString(1, producto.getNombreProducto());
            ps.setString(2, producto.getDescripcion());
            ps.setDouble(3, producto.getPrecio());
            ps.setInt(4, producto.getStock());
            ps.setString(5, producto.getSexo());
            ps.setInt(6, producto.getCategoria().getIdCategoria());
            ps.setInt(7, producto.getIdProducto());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            desconectar();
        }
    }

    // Método para borrar un producto
    public boolean borrar(int idProducto) {
        conectar();
        String sql = "DELETE FROM productos WHERE id_producto = ?";
        try {
            PreparedStatement ps = getConexion().prepareStatement(sql);
            ps.setInt(1, idProducto);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            desconectar();
        }
    }

    public Producto obtenerPorId(int idProducto) {
        conectar();
        Producto producto = null;
        String sql = "SELECT p.*, c.nombre_categoria FROM productos p INNER JOIN categorias c ON p.id_categoria = c.id_categoria WHERE p.id_producto = ?";
        try (PreparedStatement ps = getConexion().prepareStatement(sql)) {
            ps.setInt(1, idProducto);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Categoria categoria = new Categoria(
                        rs.getInt("id_categoria"),
                        rs.getString("nombre_categoria")
                );
                producto = new Producto(
                        rs.getInt("id_producto"),
                        rs.getString("nombre_producto"),
                        rs.getString("descripcion"),
                        rs.getDouble("precio"),
                        rs.getInt("stock"),
                        rs.getString("sexo"),
                        categoria
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            desconectar();
        }
        return producto;
    }

    public boolean actualizarStock(int idProducto, int nuevaCantidad) {
        String sql = "UPDATE productos SET stock = ? WHERE ID_producto = ?";
        try {
            PreparedStatement ps = getConexion().prepareStatement(sql);
            ps.setInt(1, nuevaCantidad);
            ps.setInt(2, idProducto);
            int filasActualizadas = ps.executeUpdate();
            return filasActualizadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            desconectar();
        }
    }

    public boolean reducirStock(int idProducto, int cantidad) {
        String sql = "UPDATE productos SET stock = stock - ? WHERE id_producto = ? AND stock >= ?";
        try {
            Connection conn = getConexion();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cantidad);
            ps.setInt(2, idProducto);
            ps.setInt(3, cantidad);
            int filasActualizadas = ps.executeUpdate();
            return filasActualizadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            desconectar();
        }
    }

}
