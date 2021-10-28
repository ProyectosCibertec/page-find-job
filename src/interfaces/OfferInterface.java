package interfaces;

import java.util.ArrayList;

import model.Offer;

public interface OfferInterface {

	public int register(Offer o);
	
	public int update(Offer o);
	
	public int delete(Offer o);
	
	public int get(String code);

	public ArrayList<Offer> list();

}
