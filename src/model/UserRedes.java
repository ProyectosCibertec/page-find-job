package model;

public class UserRedes {

	private int id, usuarioId, redesId;
	
	public UserRedes() {}

	public UserRedes(int id, int usuarioId, int redesId) {
		this.id = id;
		this.usuarioId = usuarioId;
		this.redesId = redesId;
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

	public int getRedesId() {
		return redesId;
	}

	public void setRedesId(int redesId) {
		this.redesId = redesId;
	}
	
}
