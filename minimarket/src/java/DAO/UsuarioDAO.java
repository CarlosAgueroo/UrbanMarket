package DAO;

import Clases.Usuario;
import Conexion.Conectar;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO extends Conectar {

    // Método para crear un nuevo usuario
    public boolean crear(Usuario usuario) {
        conectar();
        String sql = "INSERT INTO usuarios (nombre_usuario, correo, contrasena, rol) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = getConexion().prepareStatement(sql);
            ps.setString(1, usuario.getNombreUsuario());
            ps.setString(2, usuario.getCorreo());
            ps.setString(3, usuario.getContrasena());
            ps.setString(4, usuario.getRol());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            desconectar();
        }
    }

    // Método para obtener todos los usuarios
    public List<Usuario> obtenerTodos() {
        conectar();
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuarios";
        try {
            Statement st = getConexion().createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Usuario usuario = new Usuario(
                        rs.getInt("id_usuario"),
                        rs.getString("nombre_usuario"),
                        rs.getString("correo"),
                        rs.getString("contrasena"),
                        rs.getString("rol")
                );
                usuarios.add(usuario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            desconectar();
        }
        return usuarios;
    }

    // Método para actualizar un usuario
    public boolean actualizar(Usuario usuario) {
        conectar();
        String sql = "UPDATE usuarios SET nombre_usuario = ?, correo = ?, contrasena = ?, rol = ? WHERE id_usuario = ?";
        try {
            PreparedStatement ps = getConexion().prepareStatement(sql);
            ps.setString(1, usuario.getNombreUsuario());
            ps.setString(2, usuario.getCorreo());
            ps.setString(3, usuario.getContrasena());
            ps.setString(4, usuario.getRol());
            ps.setInt(5, usuario.getIdUsuario());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            desconectar();
        }
    }

    // Método para eliminar un usuario
    public boolean borrar(int idUsuario) {
        conectar();
        String sql = "DELETE FROM usuarios WHERE id_usuario = ?";
        try {
            PreparedStatement ps = getConexion().prepareStatement(sql);
            ps.setInt(1, idUsuario);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            desconectar();
        }
    }

    // Método para validar credenciales y obtener el objeto Usuario completo
    public Usuario validarCredenciales(String correo, String contrasena) {
        conectar();
        Usuario usuario = null;
        String sql = "SELECT * FROM usuarios WHERE correo = ? AND contrasena = ?";
        try {
            PreparedStatement ps = getConexion().prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, contrasena);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                usuario = new Usuario(
                        rs.getInt("id_usuario"),
                        rs.getString("nombre_usuario"),
                        rs.getString("correo"),
                        rs.getString("contrasena"),
                        rs.getString("rol")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            desconectar();
        }
        return usuario;
    }

    // Método adicional para obtener Usuario por nombreUsuario si es necesario
    public Usuario obtenerPorNombre(String nombreUsuario) {
        conectar();
        Usuario usuario = null;
        String sql = "SELECT * FROM usuarios WHERE nombre_usuario = ?";
        try {
            PreparedStatement ps = getConexion().prepareStatement(sql);
            ps.setString(1, nombreUsuario);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                usuario = new Usuario(
                        rs.getInt("id_usuario"),
                        rs.getString("nombre_usuario"),
                        rs.getString("correo"),
                        rs.getString("contrasena"),
                        rs.getString("rol")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            desconectar();
        }
        return usuario;
    }
}
