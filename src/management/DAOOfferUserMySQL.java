package management;

import java.sql.Connection;
import java.sql.PreparedStatement;

import interfaces.OfferUserInterface;
import utils.MySQLConnection;

public class DAOOfferUserMySQL implements OfferUserInterface {

	@Override
	public int registerOfferUser(int offerId, int userId) {
		int result = 0;

		Connection conn = null;
		PreparedStatement pst = null;
		PreparedStatement pst2 = null;

		try {
			conn = MySQLConnection.getConnection();
			conn.setAutoCommit(false);
			String sql = "{call usp_add_offer_user(?,?)}";

			pst = conn.prepareStatement(sql);

			pst.setInt(1, offerId);
			pst.setInt(2, userId);
			result = pst.executeUpdate();
			
			String sql2 = "{call usp_update_offer_vacants(?)}";
			
			pst2 = conn.prepareStatement(sql2);
			
			pst2.setInt(1, offerId);
			result = pst2.executeUpdate();
			
			conn.commit();

		} catch (Exception e) {
			System.out.println("Error al aplicar oferta: " + e.getMessage());
		} finally {
			MySQLConnection.closeConnection(conn);
		}

		return result;
	}

}
