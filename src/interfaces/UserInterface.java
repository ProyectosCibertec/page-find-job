package interfaces;

import model.User;

public interface UserInterface {

	public User get(String email, String password);

	public int register(User u);

	public int update(User u);

	public User findByIdOrEmail(String param);
}
