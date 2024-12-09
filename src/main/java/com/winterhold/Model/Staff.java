package com.winterhold.Model;

import jakarta.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "tb_staff")

public class Staff {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_staff") // Đảm bảo tên cột phù hợp
    private int ID_staff;
    private String stName;
    private boolean gender;
    @Temporal(TemporalType.DATE)
    private Date dateOfBirth;
    private String email;
    private String phoneNumber;
    private String address;
    private String CCCD;
    private String image;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ID_dp", nullable = false)
    
    private Department department;

    @ManyToOne
    @JoinColumn(name = "ID_of", nullable = false)
    private Office office;

    @OneToMany(mappedBy = "staff")
    private List<Account> accounts;

    public Staff() {
        super();
    }

    public Staff(String stName, boolean gender, Date dateOfBirth, String email, String phoneNumber,
                 String address, String cCCD, String image, Department department, Office office, List<Account> accounts) {
        this.stName = stName;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.CCCD = cCCD;
        this.image = image;
        this.department = department;
        this.office = office;
        this.accounts = accounts;
    }

    // Getters và setters
    public int getID_staff() {
        return ID_staff;
    }

    public void setID_staff(int ID_staff) {
        this.ID_staff = ID_staff;
    }

    public String getStName() {
        return stName;
    }

    public void setStName(String stName) {
        this.stName = stName;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCCCD() {
        return CCCD;
    }

    public void setCCCD(String CCCD) {
        this.CCCD = CCCD;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Office getOffice() {
        return office;
    }

    public void setOffice(Office office) {
        this.office = office;
    }

    public List<Account> getAccounts() {
        return accounts;
    }

    public void setAccounts(List<Account> accounts) {
        this.accounts = accounts;
    }
}
