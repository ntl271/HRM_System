package com.winterhold.DAO;

import java.time.LocalDate;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.winterhold.Model.Salary;
import com.winterhold.Model.Staff;

public class SalaryDAO {
    private SessionFactory sessionFactory;

    public SalaryDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    // Phương thức để tạo một Salary mới
    @SuppressWarnings("deprecation")
	public void saveSalary(Salary salary) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(salary);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    // Phương thức để lấy danh sách tất cả Salary
    public List<Salary> getAllSalaries() {
        try (Session session = sessionFactory.openSession()) {
            Query<Salary> query = session.createQuery("from Salary", Salary.class);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Phương thức để lấy Salary theo ID
    public Salary getSalaryById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Salary.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Phương thức để cập nhật Salary
    @SuppressWarnings("deprecation")
	public void updateSalary(Salary salary) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.update(salary);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    // Phương thức để xóa Salary
    @SuppressWarnings("deprecation")
	public void deleteSalary(int id) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            Salary salary = session.get(Salary.class, id);
            if (salary != null) {
                session.delete(salary);
                transaction.commit();
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    // Phương thức để lấy danh sách nhân viên chưa được chấm công trong tháng hiện tại
    public List<Staff> getStaffNotTimekeepingInCurrentMonth() {
        Transaction transaction = null;
        List<Staff> staffList = null;

        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            
            LocalDate now = LocalDate.now();
            int currentMonth = now.getMonthValue();

            String hql = "SELECT s FROM Staff s WHERE s.id NOT IN " +
                         "(SELECT st.staff.id FROM Salary st WHERE MONTH(st.dateCreate) = :currentMonth)";
            Query<Staff> query = session.createQuery(hql, Staff.class);
            query.setParameter("currentMonth", currentMonth);
            
            staffList = query.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }

        return staffList;
    }
}
