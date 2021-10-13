package model;

public class User {

	private String pasworrd, email, creationDate, updateDate;
	int code, active, supperUser;

	@Override
	public String toString() {
		return "User [code=" + code + ", pasworrd=" + pasworrd + ", email=" + email + ", creationDate=" + creationDate
				+ ", updateDate=" + updateDate + ", active=" + active + ", supperUser=" + supperUser + "]";
	}

	public User() {
	}

	public User(String pasworrd, String email, String creationDate) {
		this.pasworrd = pasworrd;
		this.email = email;
		this.creationDate = creationDate;
	}

	public User(int code, String pasworrd, String email, int active, int supperUser, String creationDate,
			String updateDate) {
		this.code = code;
		this.pasworrd = pasworrd;
		this.email = email;
		this.creationDate = creationDate;
		this.updateDate = updateDate;
		this.active = active;
		this.supperUser = supperUser;
	}

	public int getSupperUser() {
		return supperUser;
	}

	public void setSupperUser(int supperUser) {
		this.supperUser = supperUser;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getPasworrd() {
		return pasworrd;
	}

	public void setPasworrd(String pasworrd) {
		this.pasworrd = pasworrd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

}
