package com.winterhold.Model;

import java.sql.Date;

import jakarta.persistence.*;

@Entity
@Table(name = "tb_timekeeping")
public class Timekeeping {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ID_tk;

    private Date tkDay;
    private int type;

    public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@ManyToOne
    @JoinColumn(name = "ID_staff", nullable = false)
    private Staff staff;

	public Timekeeping() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Timekeeping(int iD_tk, Date tkDay, int type, Staff staff) {
		super();
		ID_tk = iD_tk;
		this.tkDay = tkDay;
		this.type = type;
		this.staff = staff;
	}

	public Timekeeping(Date tkDay, int type, Staff staff) {
		super();
		this.tkDay = tkDay;
		this.type = type;
		this.staff = staff;
	}

	public int getID_tk() {
		return ID_tk;
	}

	public void setID_tk(int iD_tk) {
		ID_tk = iD_tk;
	}

	public Date getTkDay() {
		return tkDay;
	}

	public void setTkDay(Date tkDay) {
		this.tkDay = tkDay;
	}

	

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

}