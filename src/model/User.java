package model;

public class User {

	private String name, lastName, pasworrd, email, creationDate, updateDate, birthDate, phone, address;
	int code, active, supperUser, isEmpresa, paisId;

	@Override
	public String toString() {
		return "User [name=" + name + ", lastName=" + lastName + ", pasworrd=" + pasworrd + ", email=" + email
				+ ", creationDate=" + creationDate + ", updateDate=" + updateDate + ", brithDate=" + birthDate
				+ ", phone=" + phone + ", address=" + address + ", code=" + code + ", active=" + active
				+ ", supperUser=" + supperUser + ", isEmpresa=" + isEmpresa + ", paisId=" + paisId + "]";
	}

	public User() {
	}

	public User(String email, String pasworrd, String name, String lastName, String birthDate, int isEmpresa,
			String creationDate) {
		this.email = email;
		this.pasworrd = pasworrd;
		this.name = name;
		this.lastName = lastName;
		this.birthDate = birthDate;
		this.isEmpresa = isEmpresa;
		this.creationDate = creationDate;
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

	public User(int code, String email, String pasworrd, String name, String lastName, String phone, String birthDate,
			int active, int supperUser, int isEmpresa, String address, int paisId, String creationDate,
			String updateDate) {
		this.name = name;
		this.lastName = lastName;
		this.pasworrd = pasworrd;
		this.email = email;
		this.creationDate = creationDate;
		this.updateDate = updateDate;
		this.birthDate = birthDate;
		this.phone = phone;
		this.address = address;
		this.code = code;
		this.active = active;
		this.paisId = paisId;
		this.supperUser = supperUser;
		this.isEmpresa = isEmpresa;
	}

	public int getPaisId() {
		return paisId;
	}

	public void setPaisId(int paisId) {
		this.paisId = paisId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBrithDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getIsEmpresa() {
		return isEmpresa;
	}

	public void setIsEmpresa(int isEmpresa) {
		this.isEmpresa = isEmpresa;
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
