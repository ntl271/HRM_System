package com.winterhold.Model;

import java.sql.Date;

import jakarta.persistence.*;

@Entity
@Table(name = "tb_notification")
public class Notification {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ID_notifi;

	private String title;
	private String content;
	private Date date;
	@ManyToOne
	@JoinColumn(name = "ID_staff", nullable = false)
	private Staff staff;

	public Notification() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Notification(String title, String content, Date date, Staff staff) {
		super();
		this.title = title;
		this.content = content;
		this.date = date;
		this.staff = staff;
	}

	public Notification(int iD_notifi, String title, String content, Staff staff) {
		super();
		ID_notifi = iD_notifi;
		this.title = title;
		this.content = content;
		this.staff = staff;
	}

	public int getID_notifi() {
		return ID_notifi;
	}

	public void setID_notifi(int iD_notifi) {
		ID_notifi = iD_notifi;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	
}
