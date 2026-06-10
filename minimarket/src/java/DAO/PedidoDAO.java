package DAO;

import Clases.Pedido;
import Clases.DetallePedido;
import Clases.Usuario;
import Conexion.Conectar;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PedidoDAO extends Conectar {

    // Método para crear un pedido con sus detalles en cascada
    public boolean crear(Pedido pedido, List<DetallePedido> detalles) {
        conectar();
        String sqlPedido = "INSERT INTO pedidos (id_usuario, subtotal, igv, total, fecha_pedido) VALUES (?, ?, ?, ?, ?)";
        String sqlDetalle = "INSERT INTO detalle_pedidos (id_pedido, id_producto, cantidad, precio_unitario, subtotal) VALUES (?, ?, ?, ?, ?)";
        try {
            getConexion().setAutoCommit(false); // Transacción manual

            // Insertar el pedido
            PreparedStatement psPedido = getConexion().prepareStatement(sqlPedido, Statement.RETURN_GENERATED_KEYS);
            psPedido.setInt(1, pedido.getUsuario().getIdUsuario());
            psPedido.setDouble(2, pedido.getSubtotal());
            psPedido.setDouble(3, pedido.getIgv());
            psPedido.setDouble(4, pedido.getTotal());
            psPedido.setTimestamp(5, new Timestamp(pedido.getFechaPedido().getTime()));
            psPedido.executeUpdate();

            // Obtener el ID del pedido generado
            ResultSet rs = psPedido.getGeneratedKeys();
            if (rs.next()) {
                int idPedido = rs.getInt(1);

                // Insertar los detalles del pedido
                for (DetallePedido detalle : detalles) {
                    PreparedStatement psDetalle = getConexion().prepareStatement(sqlDetalle);
                    psDetalle.setInt(1, idPedido);
                    psDetalle.setInt(2, detalle.getProducto().getIdProducto());
                    psDetalle.setInt(3, detalle.getCantidad());
                    psDetalle.setDouble(4, detalle.getProducto().getPrecio());
                    psDetalle.setDouble(5, detalle.getSubtotal());
                    psDetalle.executeUpdate();
                }
            }

            getConexion().commit();
            return true;
        } catch (SQLException e) {
            try {
                getConexion().rollback();
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                getConexion().setAutoCommit(true);
            } catch (SQLException autoCommitEx) {
                autoCommitEx.printStackTrace();
            }
            desconectar();
        }
    }

// Método para obtener todos los pedidos
    public List<Pedido> obtenerTodos() {
        conectar();
        List<Pedido> pedidos = new ArrayList<>();
        String sql = "SELECT * FROM pedidos";
        try {
            Statement st = getConexion().createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Pedido pedido = new Pedido(
                        rs.getInt("id_pedido"),
                        rs.getTimestamp("fecha_pedido"),
                        rs.getDouble("total"),
                        (Clases.Usuario) null
                );
                pedido.setSubtotal(rs.getDouble("subtotal"));
                pedido.setIgv(rs.getDouble("igv"));
                pedidos.add(pedido);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            desconectar();
        }
        return pedidos;
    }

    // Método para actualizar un pedido y sus detalles en cascada
    public boolean actualizar(Pedido pedido, List<DetallePedido> detalles) {
        conectar();
        String sqlPedido = "UPDATE pedidos SET total = ?, fecha_pedido = ? WHERE id_pedido = ?";
        String sqlEliminarDetalles = "DELETE FROM detalle_pedidos WHERE id_pedido = ?";
        String sqlInsertarDetalle = "INSERT INTO detalle_pedidos (id_pedido, id_producto, cantidad, subtotal) VALUES (?, ?, ?, ?)";

        try {
            getConexion().setAutoCommit(false);

            // Actualizar el pedido
            PreparedStatement psPedido = getConexion().prepareStatement(sqlPedido);
            psPedido.setDouble(1, pedido.getTotal());
            psPedido.setTimestamp(2, new Timestamp(pedido.getFechaPedido().getTime()));
            psPedido.setInt(3, pedido.getIdPedido());
            psPedido.executeUpdate();

            // Eliminar los detalles existentes
            PreparedStatement psEliminarDetalles = getConexion().prepareStatement(sqlEliminarDetalles);
            psEliminarDetalles.setInt(1, pedido.getIdPedido());
            psEliminarDetalles.executeUpdate();

            // Insertar los nuevos detalles
            for (DetallePedido detalle : detalles) {
                PreparedStatement psInsertarDetalle = getConexion().prepareStatement(sqlInsertarDetalle);
                psInsertarDetalle.setInt(1, pedido.getIdPedido());
                psInsertarDetalle.setInt(2, detalle.getProducto().getIdProducto());
                psInsertarDetalle.setInt(3, detalle.getCantidad());
                psInsertarDetalle.setDouble(4, detalle.getSubtotal());
                psInsertarDetalle.executeUpdate();
            }

            getConexion().commit();
            return true;
        } catch (SQLException e) {
            try {
                getConexion().rollback();
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                getConexion().setAutoCommit(true);
            } catch (SQLException autoCommitEx) {
                autoCommitEx.printStackTrace();
            }
            desconectar();
        }
    }

    // Método para eliminar un pedido y sus detalles en cascada
    public boolean borrar(int idPedido) {
        conectar();
        String sqlDetalle = "DELETE FROM detalle_pedidos WHERE id_pedido = ?";
        String sqlPedido = "DELETE FROM pedidos WHERE id_pedido = ?";
        try {
            getConexion().setAutoCommit(false);

            // Eliminar los detalles
            PreparedStatement psDetalle = getConexion().prepareStatement(sqlDetalle);
            psDetalle.setInt(1, idPedido);
            psDetalle.executeUpdate();

            // Eliminar el pedido
            PreparedStatement psPedido = getConexion().prepareStatement(sqlPedido);
            psPedido.setInt(1, idPedido);
            psPedido.executeUpdate();

            getConexion().commit();
            return true;
        } catch (SQLException e) {
            try {
                getConexion().rollback();
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                getConexion().setAutoCommit(true);
            } catch (SQLException autoCommitEx) {
                autoCommitEx.printStackTrace();
            }
            desconectar();
        }
    }
}
