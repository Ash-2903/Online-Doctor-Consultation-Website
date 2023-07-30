package com.entity;

public class Specialist {

	private int id;
	private String specialistName;
	
	/* Constructors */
	
	public Specialist() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Specialist(int id, String specialistName) {
		super();
		this.id = id;
		this.specialistName = specialistName;
	}
	
	/* Getter and setters */


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSpecialistName() {
		return specialistName;
	}

	public void setSpecialistName(String specialistName) {
		this.specialistName = specialistName;
	}
	
	
}
