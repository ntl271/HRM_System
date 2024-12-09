package com.winterhold.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "tb_account")
public class Account {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ID_user;

	private String username;
	private String password;

	private boolean role;

	@OneToOne
	@JoinColumn(name = "ID_staff", nullable = false)
	private Staff staff;

	public Account(int iD_user, String username, String password, boolean role, Staff staff) {
		super();
		ID_user = iD_user;
		this.username = username;
		this.password = password;

		this.role = role;
		this.staff = staff;
	}

	public Account(String username, String password, boolean role, Staff staff) {
		super();
		this.username = username;
		this.password = password;
		this.role = role;
		this.staff = staff;
	}

	public Account() {
		super();
	}

	public int getID_user() {
		return ID_user;
	}

	public void setID_user(int iD_user) {
		ID_user = iD_user;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean getRole() {
		return role;
	}

	public void setRole(boolean role) {
		this.role = role;
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

}
