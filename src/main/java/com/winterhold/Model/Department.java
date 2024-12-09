package com.winterhold.Model;

import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name = "tb_department")
public class Department {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ID_dp;

	private String dpName;
	private String dpDescription;

	@OneToMany(mappedBy = "department", cascade = CascadeType.ALL, fetch = FetchType.EAGER) 
    private List<Staff> staff;

	@OneToMany(mappedBy = "department", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<Office> office;

	// Constructors
	public Department() {
	}

	public Department(String dpName) {
		this.dpName = dpName;
	}

	public Department(String dpName, String dpDescription) {
		super();
		this.dpName = dpName;
		this.dpDescription = dpDescription;
	}

	// Getters và setters
	public int getID_dp() {
		return ID_dp;
	}

	public void setID_dp(int ID_dp) {
		this.ID_dp = ID_dp;
	}

	public String getDpName() {
		return dpName;
	}

	public void setDpName(String dpName) {
		this.dpName = dpName;
	}

	public String getDpDescription() {
		return dpDescription;
	}

	public void setDpDescription(String dpDescription) {
		this.dpDescription = dpDescription;
	}

	public List<Office> getOffice() {
		return office;
	}

	public void setOffice(List<Office> office) {
		this.office = office;
	}

	public List<Staff> getStaff() {
		return staff;
	}

	public void setStaff(List<Staff> staff) {
		this.staff = staff;
	}
}
