package com.winterhold.DAO;

import java.sql.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.winterhold.Model.Leave;
import com.winterhold.Model.Staff;

public class LeaveDAO {
    private SessionFactory sessionFactory;

    public LeaveDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @SuppressWarnings("deprecation")
	public void addLeave(Leave leave) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(leave);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    @SuppressWarnings("deprecation")
	public void updateLeave(Leave leave) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.update(leave);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    @SuppressWarnings("deprecation")
	public void deleteLeave(int idLeave) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            Leave leave = session.get(Leave.class, idLeave);
            if (leave != null) {
                session.delete(leave);
                transaction.commit();
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public Leave getLeaveById(int idLeave) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Leave.class, idLeave);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Leave> getAllLeaves() {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Leave";
            Query<Leave> query = session.createQuery(hql, Leave.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Leave> getLeavesByStaffId(int staffId) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Leave WHERE staff.ID_staff = :staffId";
            Query<Leave> query = session.createQuery(hql, Leave.class);
            query.setParameter("staffId", staffId);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Leave> getLeavesByDate(Date dayOff) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Leave WHERE dayOff = :dayOff";
            Query<Leave> query = session.createQuery(hql, Leave.class);
            query.setParameter("dayOff", dayOff);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public List<Leave> getAllLeavesByStaff(Staff staff) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Leave WHERE staff = :staff";
            Query<Leave> query = session.createQuery(hql, Leave.class);
            query.setParameter("staff", staff);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

	
}
