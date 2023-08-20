package com.entity;

public class Prescription {

	private int pId;
	private int uId;
	private int aId;
	private String prescribe;
	
	
	public Prescription() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Prescription(String prescribe, int uid,int aId) {
		super();
		this.prescribe = prescribe;
		this.uId = uid;
		this.aId = aId;
	}


	public int getpId() {
		return pId;
	}


	public void setpId(int pId) {
		this.pId = pId;
	}
	
	public int getaId() {
		return aId;
	}


	public void setaId(int aId) {
		this.aId = aId;
	}
	
	public int getuId() {
		return uId;
	}


	public void setuId(int uId) {
		this.uId = uId;
	}


	public String getPrescribe() {
		return prescribe;
	}


	public void setPrescribe(String prescribe) {
		this.prescribe = prescribe;
	}
	

	
}
