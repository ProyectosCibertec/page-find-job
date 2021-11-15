package model;

public class UserSkills {

	private int id, usuarioId, skillsId;
	
	public UserSkills() {}

	public UserSkills(int id, int usuarioId, int skillsId) {
		this.id = id;
		this.usuarioId = usuarioId;
		this.skillsId = skillsId;
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

	public int getSkillsId() {
		return skillsId;
	}

	public void setSkillsId(int skillsId) {
		this.skillsId = skillsId;
	}
	
}
