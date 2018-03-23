package com.zm.platform.querydomain;

public class QueryPage{
	private int page=1;
	private int rows=10;		//select 。。。  limit  page,rows
	private String  order;	//排序方式   desc/asc
	private String sort;  //排序列名
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public QueryPage(int page, int rows, String order, String sort) {
		super();
		this.page = page;
		this.rows = rows;
		this.order = order;
		this.sort = sort;
	}
	public QueryPage() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
