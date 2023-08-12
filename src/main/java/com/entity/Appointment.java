package com.entity;

public class Appointment {
	
	private int id;
	private int userId;
	private String fullName;
	private String gender;
	private String age;
	private String appoinTime;
	private String email;
	private String phNo;
	private String diseases;
	private int spId;
	private String address;
	private String status;
	private String doctor;
	private String date;
	
	
	public Appointment() {
		super();
	}


	public Appointment(int userId, String fullName, String gender, String age, String appoinTime, String email,
			String phNo, String diseases, int spId, String address, String status, String doctor, String date) {
		super();
		this.userId = userId;
		this.fullName = fullName;
		this.gender = gender;
		this.age = age;
		this.appoinTime = appoinTime;
		this.email = email;
		this.phNo = phNo;
		this.diseases = diseases;
		this.spId = spId;
		this.address = address;
		this.status = status;
		this.doctor = doctor;
		this.date = date;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getFullName() {
		return fullName;
	}


	public void setFullName(String fullName) {
		this.fullName = fullName;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public String getAppoinTime() {
		return appoinTime;
	}


	public void setAppoinTime(String appoinTime) {
		this.appoinTime = appoinTime;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhNo() {
		return phNo;
	}


	public void setPhNo(String phNo) {
		this.phNo = phNo;
	}


	public String getDiseases() {
		return diseases;
	}


	public void setDiseases(String diseases) {
		this.diseases = diseases;
	}


	public int getSpId() {
		return spId;
	}


	public void setSpId(int spId) {
		this.spId = spId;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}


	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}
	
	public String getDoctor() {
		return doctor;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
	public String getDate() {
		return date;
	}


	


	
	
	
	
	

}
