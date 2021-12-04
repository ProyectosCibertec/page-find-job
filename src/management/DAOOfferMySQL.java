package management;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import interfaces.OfferInterface;
import model.Language;
import model.Offer;
import utils.MySQLConnection;

public class DAOOfferMySQL implements OfferInterface {

	@Override
	public int register(int userId, Offer o, ArrayList<Language> languages) {
		int rs = 0;
		Connection con = null;
		PreparedStatement pst1 = null;
		PreparedStatement pst2 = null;
		PreparedStatement pst3 = null;
		try {
			con = MySQLConnection.getConnection();
			con.setAutoCommit(false);
			String query1 = "insert into offer values (?,?,?,?,curdate(),null,?)";
			pst1 = con.prepareStatement(query1);

			pst1.setInt(1, o.getCode());
			pst1.setString(2, o.getTitle());
			pst1.setString(3, o.getDescription());
			pst1.setString(4, o.getLimitDate());
			pst1.setInt(5, o.getVacants());

			rs = pst1.executeUpdate();

			String query2 = "call usp_add_offer_language(?,?)";
			pst2 = con.prepareStatement(query2);
			for (Language l : languages) {
				pst2 = con.prepareStatement(query2);
				pst2.setInt(1, o.getCode());
				pst2.setInt(2, l.getCode());

				rs += pst2.executeUpdate();
			}

			String query3 = "insert into empresa_offer values (null,?,?)";

			pst3 = con.prepareStatement(query3);

			pst3.setInt(1, userId);
			pst3.setInt(2, o.getCode());

			rs += pst3.executeUpdate();

			con.commit();

		} catch (Exception e) {
			System.out.println("Error al registrar oferta: " + e.getMessage());
		} finally {
			MySQLConnection.closeConnection(con);
		}
		// TODO Auto-generated method stub
		return rs;
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

	public ArrayList<Offer> listByTitle(String chain) {
		ArrayList<Offer> list = null;

		Connection con = null;
		PreparedStatement pst = null;
		ResultSet result = null;

		try {
			con = MySQLConnection.getConnection();
//			String sql = "select * from offer o where o.title like (%" + chain +"%)";
			String sql = "call usp_get_offer_by_title(?)";
			pst = con.prepareStatement(sql);
			pst.setString(1, chain);
			result = pst.executeQuery(sql);

			list = new ArrayList<Offer>();

			while (result.next()) {
				Offer o = new Offer(result.getInt(1), result.getString(2), result.getString(3), result.getString(4),
						result.getString(5), result.getString(6), result.getInt(7));
				list.add(o);
			}

		} catch (Exception e) {
			System.out.println("Error al listar las ofertas por titulo : " + e.getMessage());
		} finally {
			MySQLConnection.closeConnection(con);
		}

		return list;
	}

	@Override
	public ArrayList<Offer> listByLanguage(String chain) {
		ArrayList<Offer> offerList = null;

		return null;
	}

	@Override
	public Offer getLastOffer() {
		Offer o = null;
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet result = null;

		try {
			con = MySQLConnection.getConnection();
			String sql = "{call usp_get_last_offer()}";
			pst = con.prepareStatement(sql);

			result = pst.executeQuery(sql);

			o = new Offer();

			if (result.next()) {
				o = new Offer(result.getInt(1), result.getString(2), result.getString(3), result.getString(4),
						result.getString(5), result.getString(6), result.getInt(7));
			}

		} catch (Exception e) {
			System.out.println("Error al obtener ultima oferta : " + e.getMessage());
		} finally {
			MySQLConnection.closeConnection(con);
		}

		return o;
	}

	@Override
	public Offer listById(int code) {
		Offer o = null;
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet result = null;

		try {
			con = MySQLConnection.getConnection();
//			String sql = "{call usp_get_offer_by_id(?)}";
			String sql = "select * from offer where id = " + code;
			pst = con.prepareStatement(sql);
//			pst.setInt(1, code);
			result = pst.executeQuery(sql);

			o = new Offer();

			if (result.next()) {
				o = new Offer(result.getInt(1), result.getString(2), result.getString(3), result.getString(4),
						result.getString(5), result.getString(6), result.getInt(7));
			}

		} catch (Exception e) {
			System.out.println("Error al obtener oferta por id: " + e.getMessage());
		} finally {
			MySQLConnection.closeConnection(con);
		}

		return o;
	}

	@Override
	public ArrayList<Offer> listByOfferByUser(int codeUser, int isEmpresa) {
		ArrayList<Offer> list = null;

		Connection con = null;
		PreparedStatement pst = null;
		ResultSet result = null;

		try {
			con = MySQLConnection.getConnection();
			String sql = "{call usp_list_offer_by_usuario(?,?)}";
			pst = con.prepareStatement(sql);

			pst.setInt(1, codeUser);
			pst.setInt(2, isEmpresa);

			result = pst.executeQuery(sql);

			list = new ArrayList<Offer>();

			while (result.next()) {
				Offer o = new Offer(result.getInt(1), result.getString(2), result.getString(3), result.getString(4),
						result.getString(5), result.getString(6), result.getInt(7));
				list.add(o);
			}

		} catch (Exception e) {
			System.out.println("Error al listar las ofertas por id usuario : " + e.getMessage());
		} finally {
			MySQLConnection.closeConnection(con);
		}

		return list;
	}

}
