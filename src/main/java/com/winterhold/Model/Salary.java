package com.winterhold.Model;


import java.sql.Date;

import jakarta.persistence.*;
@Entity
@Table(name = "tb_salarytb")
public class Salary {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ID_salary;

    private Date dateCreate;
    public Salary(Date dateCreate, float total_ticket, float total_thumup, float total_bonus,
			float total_salaryTimekeeping, Staff staff) {
		super();
		this.dateCreate = dateCreate;
		this.total_ticket = total_ticket;
		this.total_thumup = total_thumup;
		this.total_bonus = total_bonus;
		this.total_salaryTimekeeping = total_salaryTimekeeping;
		this.staff = staff;
	}

	public Date getDateCreate() {
		return dateCreate;
	}

	public void setDateCreate(Date dateCreate) {
		this.dateCreate = dateCreate;
	}

	private float total_ticket;
    private float total_thumup;
    private float total_bonus;
    private float total_salaryTimekeeping;
    public float getTotal_salaryTimekeeping() {
		return total_salaryTimekeeping;
	}

	public void setTotal_salaryTimekeeping(float total_salaryTimekeeping) {
		this.total_salaryTimekeeping = total_salaryTimekeeping;
	}

	@ManyToOne
    @JoinColumn(name = "ID_staff", nullable = false)
    private Staff staff;

	public Salary() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	

	public int getID_salary() {
		return ID_salary;
	}

	public void setID_salary(int iD_salary) {
		ID_salary = iD_salary;
	}

	

	public float getTotal_ticket() {
		return total_ticket;
	}

	public void setTotal_ticket(float total_ticket) {
		this.total_ticket = total_ticket;
	}

	public float getTotal_thumup() {
		return total_thumup;
	}

	public void setTotal_thumup(float total_thumup) {
		this.total_thumup = total_thumup;
	}

	public float getTotal_bonus() {
		return total_bonus;
	}

	public void setTotal_bonus(float total_bonus) {
		this.total_bonus = total_bonus;
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	public float total_salary() {
		float sum =total_bonus+total_salaryTimekeeping+total_thumup-total_ticket;
		return sum;
	}
	
}
