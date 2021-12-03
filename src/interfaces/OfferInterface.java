package interfaces;

import java.util.ArrayList;

import model.Language;
import model.Offer;

public interface OfferInterface {

	public int register(int userId, Offer o, ArrayList<Language> languages);
	
	public int update(Offer o);
	
	public int delete(Offer o);
	
	public int get(String code);

	public ArrayList<Offer> list();
	
	public ArrayList<Offer> listByTitle(String chain);
	
	public ArrayList<Offer> listByLanguage(String chain);
	
	public Offer listById(int code);
	
	public Offer getLastOffer();

}
