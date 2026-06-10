
package DAO;

import Clases.DetallePedido;
import Clases.Producto;
import Conexion.Conectar;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DetallePedidoDAO extends Conectar {

    // Método para obtener todos los detalles de un pedido
    public List<DetallePedido> obtenerPorPedido(int idPedido) {
        conectar();
        List<DetallePedido> detalles = new ArrayList<>();
        String sql = "SELECT dp.*, p.nombre_producto, p.precio FROM detalle_pedidos dp "
                   + "INNER JOIN productos p ON dp.id_producto = p.id_producto "
                   + "WHERE dp.id_pedido = ?";
        try {
            PreparedStatement ps = getConexion().prepareStatement(sql);
            ps.setInt(1, idPedido);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Producto producto = new Producto(
                        rs.getInt("id_producto"),
                        rs.getString("nombre_producto"),
                        null, // No es necesario cargar la descripción aquí
                        rs.getDouble("precio"),
                        0, // No es necesario cargar el stock aquí
                        null, // Sexo no relevante aquí
                        null // Categoría no relevante aquí
                );
                DetallePedido detalle = new DetallePedido(
                        rs.getInt("id_detalle"),
                        null, // No es necesario cargar el pedido completo
                        producto,
                        rs.getInt("cantidad"),
                        rs.getDouble("subtotal")
                );
                detalles.add(detalle);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            desconectar();
        }
        return detalles;
    }

    // Método para eliminar todos los detalles de un pedido
    public boolean borrarPorPedido(int idPedido) {
        conectar();
        String sql = "DELETE FROM detalle_pedidos WHERE id_pedido = ?";
        try {
            PreparedStatement ps = getConexion().prepareStatement(sql);
            ps.setInt(1, idPedido);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            desconectar();
        }
    }
}
