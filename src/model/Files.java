package model;

public class Files {

	private int id, usuarioId;
    private String file, title;
    
    public Files() {}
    
	public Files(int id, int usuarioId, String file, String title) {
		this.id = id;
		this.usuarioId = usuarioId;
		this.file = file;
		this.title = title;
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
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}	
    
}
