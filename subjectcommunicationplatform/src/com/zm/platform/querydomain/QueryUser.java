package com.zm.platform.querydomain;

public class QueryUser extends QueryPage{
	private Long user_id;	//id
	private String user_name;		//姓名
	private String user_password;	//密码
	private String user_token;		//token
	private String user_phone;	//电话	
	private double user_money;//余额
	private double user_deposit;//租金
	private String user_idnumber;//身份证号
	
	private String user_role;//身份标识
	private String user_head;//头像
	
	
	
	public String getUser_head() {
		return user_head;
	}
	public void setUser_head(String user_head) {
		this.user_head = user_head;
	}
	
	public String getUser_role() {
		return user_role;
	}
	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}
	public Long getUser_id() {
		return user_id;
	}
	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_token() {
		return user_token;
	}
	public void setUser_token(String user_token) {
		this.user_token = user_token;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public double getUser_money() {
		return user_money;
	}
	public void setUser_money(double user_money) {
		this.user_money = user_money;
	}
	public double getUser_deposit() {
		return user_deposit;
	}
	public void setUser_deposit(double user_deposit) {
		this.user_deposit = user_deposit;
	}
	public String getUser_idnumber() {
		return user_idnumber;
	}
	public void setUser_idnumber(String user_idnumber) {
		this.user_idnumber = user_idnumber;
	}
	@Override
	public String toString() {
		return "QueryUser [user_id=" + user_id + ", user_name=" + user_name + ", user_password=" + user_password
				+ ", user_token=" + user_token + ", user_phone=" + user_phone + ", user_money=" + user_money
				+ ", user_deposit=" + user_deposit + ", user_idnumber=" + user_idnumber + "]";
	}
	public QueryUser(Long user_id, String user_name, String user_password, String user_token, String user_phone,
			double user_money, double user_deposit, String user_idnumber) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_password = user_password;
		this.user_token = user_token;
		this.user_phone = user_phone;
		this.user_money = user_money;
		this.user_deposit = user_deposit;
		this.user_idnumber = user_idnumber;
	}
	public QueryUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
