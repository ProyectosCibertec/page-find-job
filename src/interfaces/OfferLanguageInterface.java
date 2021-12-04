package interfaces;

import java.util.ArrayList;

import model.OfferLanguage;

public interface OfferLanguageInterface {

	public int register(OfferLanguage ol);

	public int update(OfferLanguage ol);

	public int get(String code);

	public ArrayList<OfferLanguage> listByOffer(String code);

}
