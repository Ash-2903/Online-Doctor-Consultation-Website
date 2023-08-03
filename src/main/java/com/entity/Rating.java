package com.entity;

public class Rating {

	private int rating;
	private int userId;
	private String docName;
	
	public Rating(int rating, int userId, String docName) {
		super();
		this.rating = rating;
		this.userId = userId;
		this.docName = docName;
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

	public void setDocName(String docName) {
		this.docName = docName;
	}
	
	
	
	
	
}
