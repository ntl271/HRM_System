package com.winterhold.Model;
import java.sql.Date;

import jakarta.persistence.*;
@Entity
@Table(name = "tb_otbonus")
public class OTBonus {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ID_ot;

    private Date otDay;
    private int otTime;
    private float coefficient;
    private String description;
    private boolean type;

    public boolean isType() {
		return type;
	}

	public void setType(boolean type) {
		this.type = type;
	}

	@ManyToOne
    @JoinColumn(name = "ID_staff", nullable = false)
    private Staff staff;

	public OTBonus() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	

	public OTBonus(int iD_ot, Date otDay, int otTime, float coefficient, String description, boolean type,
			Staff staff) {
		super();
		ID_ot = iD_ot;
		this.otDay = otDay;
		this.otTime = otTime;
		this.coefficient = coefficient;
		this.description = description;
		this.type = type;
		this.staff = staff;
	}

	public OTBonus(Date otDay, int otTime, float coefficient, String description, boolean type, Staff staff) {
		super();
		this.otDay = otDay;
		this.otTime = otTime;
		this.coefficient = coefficient;
		this.description = description;
		this.type = type;
		this.staff = staff;
	}
	
	

	public OTBonus(int iD_ot, float coefficient, boolean type, Staff staff) {
		super();
		ID_ot = iD_ot;
		this.coefficient = coefficient;
		this.type = type;
		this.staff = staff;
	}

	

	public int getID_ot() {
		return ID_ot;
	}

	public void setID_ot(int iD_ot) {
		ID_ot = iD_ot;
	}

	public Date getOtDay() {
		return otDay;
	}

	public void setOtDay(Date otDay) {
		this.otDay = otDay;
	}

	public int getOtTime() {
		return otTime;
	}

	public void setOtTime(int otTime) {
		this.otTime = otTime;
	}

	public float getCoefficient() {
		return coefficient;
	}

	public void setCoefficient(float coefficient) {
		this.coefficient = coefficient;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

}
