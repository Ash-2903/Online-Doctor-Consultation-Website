package com.entity;

public class Rating {

	private int rating;
	private int userId;
	private String docName;
	private String spid;
	
	public Rating(int rating, int userId, String docName, String spid) {
		super();
		this.rating = rating;
		this.userId = userId;
		this.docName = docName;
		this.spid = spid;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getDocName() {
		return docName;
	}

	public void setDocName(String spid) {
		this.docName = spid;
	}
	
	public String getSpid() {
		return spid;
	}

	public void setSpid(String spid) {
		this.spid = spid;
	}
	
	
	
	
	
}
