package model;

public class PostulantOffer {

	private int id, usuarioId, offerId;
	
	public PostulantOffer() {}

	public PostulantOffer(int id, int usuarioId, int offerId) {
		this.id = id;
		this.usuarioId = usuarioId;
		this.offerId = offerId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUsuarioId() {
		return usuarioId;
	}

	public void setUsuarioId(int usuarioId) {
		this.usuarioId = usuarioId;
	}

	public int getOfferId() {
		return offerId;
	}

	public void setOfferId(int offerId) {
		this.offerId = offerId;
	}
	
	
}
