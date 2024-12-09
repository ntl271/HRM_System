package com.winterhold.Model;
import java.sql.Date;

import jakarta.persistence.*;
@Entity
@Table(name = "tb_leave")
public class Leave {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ID_leave;

    private Date dayOff;
    private String description;

    public Leave(Date dayOff, String description, Staff staff) {
		super();
		this.dayOff = dayOff;
		this.description = description;
		this.staff = staff;
	}

	@ManyToOne
    @JoinColumn(name = "ID_staff", nullable = false)
    private Staff staff;

	public Leave() {
		super();
	}

	public Leave(int iD_leave, Date dayOff, String description, Staff staff) {
		super();
		ID_leave = iD_leave;
		this.dayOff = dayOff;
		this.description = description;
		this.staff = staff;
	}

	public int getID_leave() {
		return ID_leave;
	}

	public void setID_leave(int iD_leave) {
		ID_leave = iD_leave;
	}

	public Date getDayOff() {
		return dayOff;
	}

	public void setDayOff(Date dayOff) {
		this.dayOff = dayOff;
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
