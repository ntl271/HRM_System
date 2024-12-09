package com.winterhold.Model;
import jakarta.persistence.*;
@Entity
@Table(name = "tb_office")
public class Office {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ID_of;

    private String ofName;
    private int salary;
    public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	@ManyToOne
    @JoinColumn(name = "ID_dp", nullable = false)
    private Department department;

	public Office() {
		super();
	}

	public Office(String ofName, int salary, Department department) {
		super();
		this.ofName = ofName;
		this.salary = salary;
		this.department = department;
	}

	public Office(int iD_of, String ofName, Department department) {
		super();
		ID_of = iD_of;
		this.ofName = ofName;
		this.department = department;
	}
	
	public Office(String ofName, Department department) {
		super();
		this.ofName = ofName;
		this.department = department;
	}

	public int getID_of() {
		return ID_of;
	}

	public void setID_of(int iD_of) {
		ID_of = iD_of;
	}

	public String getOfName() {
		return ofName;
	}

	public void setOfName(String ofName) {
		this.ofName = ofName;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

  
}
