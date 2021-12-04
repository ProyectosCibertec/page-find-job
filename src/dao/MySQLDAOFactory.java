package dao;

import interfaces.LanguageInterface;
import interfaces.OfferInterface;
import interfaces.OfferLanguageInterface;
import interfaces.OfferUserInterface;
import interfaces.UserInterface;
import management.DAOLanguageMySQL;
import management.DAOOfferLanguageMySQL;
import management.DAOOfferMySQL;
import management.DAOOfferUserMySQL;
import management.DAOUserMySQL;

public class MySQLDAOFactory extends DAOFactory {

	@Override
	public UserInterface getUserDAO() {
		// retornar las implementaciones de la Interface con MySQL
		return new DAOUserMySQL();
	}

	@Override
	public LanguageInterface getLanguageDAO() {
		// TODO Auto-generated method stub
		return new DAOLanguageMySQL();
	}

	@Override
	public OfferInterface getOfferDAO() {
		// TODO Auto-generated method stub
		return new DAOOfferMySQL();
	}

	@Override
	public OfferLanguageInterface getOfferLanguageDAO() {
		// TODO Auto-generated method stub
		return new DAOOfferLanguageMySQL();
	}

	@Override
	public OfferUserInterface getOfferUserDAO() {
		// TODO Auto-generated method stub
		return new DAOOfferUserMySQL();
	}
}
