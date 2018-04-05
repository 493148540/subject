package com.zm.platform.domain;

public class Dictionaries {
	private Long dictionariesId;
	private String dictionariesName;
	private String dictionariesCode;
	private String dictionariesTypeName;
	private String dictionariesTypeCode;
	private String dictionariesParentId;
	public Long getDictionariesId() {
		return dictionariesId;
	}
	public void setDictionariesId(Long dictionariesId) {
		this.dictionariesId = dictionariesId;
	}
	public String getDictionariesName() {
		return dictionariesName;
	}
	public void setDictionariesName(String dictionariesName) {
		this.dictionariesName = dictionariesName;
	}
	public String getDictionariesCode() {
		return dictionariesCode;
	}
	public void setDictionariesCode(String dictionariesCode) {
		this.dictionariesCode = dictionariesCode;
	}
	public String getDictionariesTypeName() {
		return dictionariesTypeName;
	}
	public void setDictionariesTypeName(String dictionariesTypeName) {
		this.dictionariesTypeName = dictionariesTypeName;
	}
	public String getDictionariesTypeCode() {
		return dictionariesTypeCode;
	}
	public void setDictionariesTypeCode(String dictionariesTypeCode) {
		this.dictionariesTypeCode = dictionariesTypeCode;
	}
	public String getDictionariesParentId() {
		return dictionariesParentId;
	}
	public void setDictionariesParentId(String dictionariesParentId) {
		this.dictionariesParentId = dictionariesParentId;
	}
	public Dictionaries(Long dictionariesId, String dictionariesName, String dictionariesCode,
			String dictionariesTypeName, String dictionariesTypeCode, String dictionariesParentId) {
		super();
		this.dictionariesId = dictionariesId;
		this.dictionariesName = dictionariesName;
		this.dictionariesCode = dictionariesCode;
		this.dictionariesTypeName = dictionariesTypeName;
		this.dictionariesTypeCode = dictionariesTypeCode;
		this.dictionariesParentId = dictionariesParentId;
	}
	public Dictionaries() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Dictionaries [dictionariesId=" + dictionariesId + ", dictionariesName=" + dictionariesName
				+ ", dictionariesCode=" + dictionariesCode + ", dictionariesTypeName=" + dictionariesTypeName
				+ ", dictionariesTypeCode=" + dictionariesTypeCode + ", dictionariesParentId=" + dictionariesParentId
				+ "]";
	}
	
	
	
	
	
}
