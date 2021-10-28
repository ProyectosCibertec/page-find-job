package management;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import interfaces.LanguageInterface;
import model.Language;
import utils.MySQLConnection;

public class DAOLanguageMySQL implements LanguageInterface {

	@Override
	public int register(Language l) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Language l) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int get(String code) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Language> list() {
		ArrayList<Language> list = null;

		Connection con = null;
		PreparedStatement pst = null;
		ResultSet result = null;

		try {
			con = MySQLConnection.getConnection();
			String sql = "SELECT * FROM languages";
			pst = con.prepareStatement(sql);

			result = pst.executeQuery(sql);

			list = new ArrayList<Language>();

			while (result.next()) {
				Language l = new Language();
				l.setCode(result.getInt(1));
				l.setName(result.getString(2));
				list.add(l);
			}

		} catch (Exception e) {
			System.out.println("Error al listar Lenguajes :" + e.getMessage());
		} finally {
			MySQLConnection.closeConnection(con);
		}

		return list;
	}

}
