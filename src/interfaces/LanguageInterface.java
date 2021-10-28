package interfaces;

import java.util.ArrayList;

import model.Language;

public interface LanguageInterface {
	
	public int register(Language l);
	
	public int update(Language l);
	
	public int get(String code);

	public ArrayList<Language> list();
}
