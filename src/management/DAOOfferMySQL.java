package management;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import interfaces.OfferInterface;
import model.Offer;
import utils.MySQLConnection;

public class DAOOfferMySQL implements OfferInterface {

	@Override
	public int register(Offer o) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Offer o) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Offer o) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int get(String code) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Offer> list() {
		ArrayList<Offer> list = null;

		Connection con = null;
		PreparedStatement pst = null;
		ResultSet result = null;

		try {
			con = MySQLConnection.getConnection();
			String sql = "SELECT * FROM offer";
			pst = con.prepareStatement(sql);

			result = pst.executeQuery(sql);

			list = new ArrayList<Offer>();

			while (result.next()) {
				Offer o = new Offer(result.getInt(1), result.getString(2), result.getString(3), result.getString(4),
						result.getString(5), result.getString(6), result.getInt(7));
				list.add(o);
			}

		} catch (Exception e) {
			System.out.println("Error al listar las ofertas : " + e.getMessage());
		} finally {
			MySQLConnection.closeConnection(con);
		}

		return list;
	}

}
