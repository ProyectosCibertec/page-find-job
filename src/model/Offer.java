package model;

public class Offer {

	private int code, vacants;
	private String title, description, limitDate, createDate, updateDate;

	@Override
	public String toString() {
		return "Offer [code=" + code + ", vacants=" + vacants + ", title=" + title + ", description=" + description
				+ ", limitDate=" + limitDate + ", createDate=" + createDate + ", updateDate=" + updateDate + "]";
	}
	
	public Offer() {}

	public Offer(int code, String title, String description, String limitDate, String createDate, String updateDate,
			int vacants) {
		this.code = code;
		this.vacants = vacants;
		this.title = title;
		this.description = description;
		this.limitDate = limitDate;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getVacants() {
		return vacants;
	}

	public void setVacants(int vacants) {
		this.vacants = vacants;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLimitDate() {
		return limitDate;
	}

	public void setLimitDate(String limitDate) {
		this.limitDate = limitDate;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

}
