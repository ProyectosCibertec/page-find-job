package management;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import interfaces.UserInterface;
import model.User;
import utils.MySQLConnection;

public class DAOUserMySQL implements UserInterface {

	@Override
	public User get(String email, String password) {
		User u = null;
		ResultSet result = null;

		Connection conn = null;
		PreparedStatement pst = null;

		try {
			conn = MySQLConnection.getConnection();

			String sql = "{call usp_get_user(?,?)}";

			pst = conn.prepareStatement(sql);

			pst.setString(1, email);
			pst.setString(2, password);

			result = pst.executeQuery();

			if (result.next()) {
				u = new User(result.getInt(1), result.getString(2), result.getString(3), result.getString(4),
						result.getString(5), result.getString(6), result.getString(7), result.getInt(8),
						result.getInt(9), result.getInt(10), result.getString(11), result.getInt(12),
						result.getString(13), result.getString(14));
			}

		} catch (Exception e) {
			System.out.println("Handle error -> Get User :  " + e.getMessage());
		} finally {
			MySQLConnection.closeConnection(conn);
		}

		return u;
	}

	@Override
	public int register(User u) {
		int result = 0;

		Connection conn = null;
		PreparedStatement pst = null;

		try {
			conn = MySQLConnection.getConnection();
			String sql = "{call usp_insert_user(?,?,?)}";

			pst = conn.prepareStatement(sql);

			pst.setString(1, u.getPasworrd());
			pst.setString(2, u.getEmail());
			pst.setString(3, u.getCreationDate());

			result = pst.executeUpdate();

		} catch (Exception e) {
			System.out.println("Handle error -> register user : " + e.getMessage());
		} finally {
			MySQLConnection.closeConnection(conn);
		}

		return result;
	}

	@Override
	public int update(User u) {
		int result = 0;

		// template
		Connection conn = null;
		PreparedStatement pst = null;

		try {
			conn = MySQLConnection.getConnection();
			String sql = "{call usp_update_user(?,?,?)}";

			pst = conn.prepareStatement(sql);

			pst.setString(1, u.getEmail());
			pst.setString(2, u.getPasworrd());
			pst.setString(3, u.getUpdateDate());

			result = pst.executeUpdate();

		} catch (Exception e) {
			System.out.println("Handle Error -> Update User: " + e.getMessage());
		} finally {
			MySQLConnection.closeConnection(conn);
		}

		return result;
	}

	@Override
	public User findByIdOrEmail(String param) {
		User u = null;
		ResultSet result = null;

		Connection conn = null;
		PreparedStatement pst = null;

		try {
			conn = MySQLConnection.getConnection();
			String identified = param.matches("@") ? "email" : "id";

			String sql = "SELECT * FROM usuario WHERE " + identified + "=?";

			pst = conn.prepareStatement(sql);
			pst.setString(0, param);

			result = pst.executeQuery();

			if (result.next()) {
				u = new User(result.getInt(1), result.getString(2), result.getString(3), result.getInt(4),
						result.getInt(5), result.getString(6), result.getString(7));
			}

		} catch (Exception e) {
			System.out.println("Handle error -> Get User :  " + e.getMessage());
		} finally {
			MySQLConnection.closeConnection(conn);
		}

		return u;
	}

}
