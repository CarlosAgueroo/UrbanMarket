/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Clases.Categoria;
import Conexion.Conectar;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAO extends Conectar {

    // Método para crear una nueva categoría
    public boolean crear(Categoria categoria) {
        conectar();
        String sql = "INSERT INTO categorias (nombre_categoria) VALUES (?)";
        try {
            PreparedStatement ps = getConexion().prepareStatement(sql);
            ps.setString(1, categoria.getNombreCategoria());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            desconectar();
        }
    }

    // Método para obtener todas las categorías
    public List<Categoria> obtenerTodas() {
        conectar();
        List<Categoria> categorias = new ArrayList<>();
        String sql = "SELECT * FROM categorias";
        try {
            Statement st = getConexion().createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Categoria categoria = new Categoria(
                        rs.getInt("id_categoria"),
                        rs.getString("nombre_categoria")
                );
                categorias.add(categoria);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            desconectar();
        }
        return categorias;
    }

    // Método para actualizar una categoría
    public boolean actualizar(Categoria categoria) {
        conectar();
        String sql = "UPDATE categorias SET nombre_categoria = ? WHERE id_categoria = ?";
        try {
            PreparedStatement ps = getConexion().prepareStatement(sql);
            ps.setString(1, categoria.getNombreCategoria());
            ps.setInt(2, categoria.getIdCategoria());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            desconectar();
        }
    }

    // Método para eliminar una categoría
    public boolean borrar(int idCategoria) {
        conectar();
        String sql = "DELETE FROM categorias WHERE id_categoria = ?";
        try {
            PreparedStatement ps = getConexion().prepareStatement(sql);
            ps.setInt(1, idCategoria);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            desconectar();
        }
    }

    public Categoria obtenerPorId(int idCategoria) {
        conectar();
        Categoria categoria = null;
        String sql = "SELECT * FROM categorias WHERE id_categoria = ?";
        try {
            PreparedStatement ps = getConexion().prepareStatement(sql);
            ps.setInt(1, idCategoria);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                categoria = new Categoria(
                        rs.getInt("id_categoria"),
                        rs.getString("nombre_categoria")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            desconectar();
        }
        return categoria;
    }

}
