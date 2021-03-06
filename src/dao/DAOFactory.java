package dao;

import interfaces.LanguageInterface;
import interfaces.OfferInterface;
import interfaces.OfferLanguageInterface;
import interfaces.OfferUserInterface;
import interfaces.UserInterface;

// "Crear" las implementaciones con las fuentes de datos
public abstract class DAOFactory {
	// Fuentes de datos
	public static final int MYSQL = 1;
	public static final int SQL = 2;

	// Interfaces con los procesos a desarrollar

	public abstract UserInterface getUserDAO();

	public abstract LanguageInterface getLanguageDAO();

	public abstract OfferInterface getOfferDAO();

	public abstract OfferLanguageInterface getOfferLanguageDAO();
	
	public abstract OfferUserInterface getOfferUserDAO();

	public static DAOFactory getDAOFactory(int qBD) { // "Constructo"
		switch (qBD) {
		case MYSQL:
			return new MySQLDAOFactory();
		default:
			return null;
		}
	}
}
