package model;

public class OfferLanguage {
	private int code;
	private String languageName;

	@Override
	public String toString() {
		return "OfferLanguage [code=" + code + ", languageId=" + languageName + "]";
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getLanguageName() {
		return languageName;
	}

	public void setLanguageName(String languageName) {
		this.languageName = languageName;
	}

}
