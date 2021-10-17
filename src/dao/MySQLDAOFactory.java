package dao;

import interfaces.UserInterface;
import management.DAOUserMySQL;

public class MySQLDAOFactory extends DAOFactory {

	@Override
	public UserInterface getUserDAO() {
		// retornar las implementaciones de la Interface con MySQL
		return new DAOUserMySQL();
	}
}
