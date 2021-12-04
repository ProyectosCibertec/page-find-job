package management;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import interfaces.OfferLanguageInterface;
import model.OfferLanguage;
import utils.MySQLConnection;

public class DAOOfferLanguageMySQL implements OfferLanguageInterface {

	@Override
	public int register(OfferLanguage ol) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(OfferLanguage ol) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int get(String code) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<OfferLanguage> listByOffer(String code) {
		ArrayList<OfferLanguage> list = new ArrayList<OfferLanguage>();

		Connection con = null;
		PreparedStatement pst = null;
		ResultSet result = null;

		try {
			con = MySQLConnection.getConnection();

//			int id = Integer.parseInt(code);

			String sql = "{CALL usp_list_language_by_offer(?)}";
			pst = con.prepareStatement(sql);

			// pst.setInt(1, id);
			pst.setString(1, code);

			result = pst.executeQuery();

			while (result.next()) {
				OfferLanguage ol = new OfferLanguage();
				ol.setCode(result.getInt(1));
				ol.setLanguageName(result.getString(2));

				list.add(ol);
			}

		} catch (Exception e) {
			System.out.println(
					"Error al listar lenguage por oferta : " + e.getMessage() + "\n" + e.getLocalizedMessage());
		} finally {
			MySQLConnection.closeConnection(con);
		}

		return list;
	}

}
