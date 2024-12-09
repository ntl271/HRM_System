package com.winterhold.Model;

import java.util.Date;

import jakarta.persistence.*;

@Entity
@Table(name = "tb_ticketandthumup")
public class TicketAndThumup {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ID_card;

    private boolean type;
    private float money_aos;
    private String description;
    public String getDescription() {
		return description;
	}

	public int getID_card() {
		return ID_card;
	}

	public void setID_card(int iD_card) {
		ID_card = iD_card;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	

	public TicketAndThumup(boolean type, float money_aos, String description, Date extraDay, Staff staff) {
		super();
		this.type = type;
		this.money_aos = money_aos;
		this.description = description;
		this.extraDay = extraDay;
		this.staff = staff;
	}



	@Temporal(TemporalType.DATE)
    private Date extraDay;

    @ManyToOne
    @JoinColumn(name = "ID_staff", nullable = false)
    private Staff staff;

	public TicketAndThumup() {
		super();
	}

	public TicketAndThumup(int iD_card, boolean type, float money_aos, Date extraDay, Staff staff) {
		super();
		ID_card = iD_card;
		this.type = type;
		this.money_aos = money_aos;
		this.extraDay = extraDay;
		this.staff = staff;
	}

	public int getID_tt() {
		return ID_card;
	}

	public void setID_tt(int iD_card) {
		ID_card = iD_card;
	}

	public boolean isType() {
		return type;
	}

	public void setType(boolean type) {
		this.type = type;
	}

	public float getMoney_aos() {
		return money_aos;
	}

	public void setMoney_aos(float money_aos) {
		this.money_aos = money_aos;
	}

	public Date getExtraDay() {
		return extraDay;
	}

	public void setExtraDay(Date extraDay) {
		this.extraDay = extraDay;
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

}
