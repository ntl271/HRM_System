package com.winterhold.DAO;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.winterhold.Model.Staff;
import com.winterhold.Model.TicketAndThumup;

public class TicketAndThumupDAO {
    private SessionFactory sessionFactory;

    public TicketAndThumupDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @SuppressWarnings("deprecation")
	public void addTicketAndThumup(TicketAndThumup ticketAndThumup) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(ticketAndThumup);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    @SuppressWarnings("deprecation")
	public void updateTicketAndThumup(TicketAndThumup ticketAndThumup) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.update(ticketAndThumup);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public TicketAndThumup getTicketAndThumupById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(TicketAndThumup.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @SuppressWarnings("deprecation")
	public void deleteTicketAndThumup(int id) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            TicketAndThumup ticketAndThumup = session.get(TicketAndThumup.class, id);
            if (ticketAndThumup != null) {
                session.delete(ticketAndThumup);
                transaction.commit();
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public List<TicketAndThumup> getAllTicketAndThumups() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from TicketAndThumup", TicketAndThumup.class).list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public List<TicketAndThumup> getTicketAndThumupByStaffWithTrueTypeAndMonth(Staff staff, String month) {
        try (Session session = sessionFactory.openSession()) {
            Query<TicketAndThumup> query = session.createQuery(
                "from TicketAndThumup where staff = :staff and type = true and month(extraDay) = :month",
                TicketAndThumup.class
            );
            query.setParameter("staff", staff);
            query.setParameter("month", month);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public float calculateTotalMoneyAosThumupForStaffAndMonth(int staffId, int month) {
        float totalMoneyAos = 0;
        List<TicketAndThumup> ticketAndThumups = getTicketAndThumupByStaffWithTrueTypeAndMonth(staffId, month);
        if (ticketAndThumups != null) {
            for (TicketAndThumup tt : ticketAndThumups) {
                totalMoneyAos += tt.getMoney_aos();
            }
        }
        return totalMoneyAos;
    }

    public List<TicketAndThumup> getTicketAndThumupByStaffWithTrueTypeAndMonth(int staffId, int month) {
        try (Session session = sessionFactory.openSession()) {
            Query<TicketAndThumup> query = session.createQuery(
                "from TicketAndThumup where staff.id = :staffId and type = true and month(extraDay) = :month",
                TicketAndThumup.class
            );
            query.setParameter("staffId", staffId);
            query.setParameter("month", month);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public float calculateTotalMoneyAosTicketForStaffAndMonth(int staffId, int month) {
        float totalMoneyAos = 0;
        List<TicketAndThumup> ticketAndThumups = getTicketAndThumupByStaffWithFalseTypeAndMonth(staffId, month);
        if (ticketAndThumups != null) {
            for (TicketAndThumup tt : ticketAndThumups) {
                totalMoneyAos += tt.getMoney_aos();
            }
        }
        return totalMoneyAos;
    }

    public List<TicketAndThumup> getTicketAndThumupByStaffWithFalseTypeAndMonth(int staffId, int month) {
        try (Session session = sessionFactory.openSession()) {
            Query<TicketAndThumup> query = session.createQuery(
                "from TicketAndThumup where staff.id = :staffId and type = false and month(extraDay) = :month",
                TicketAndThumup.class
            );
            query.setParameter("staffId", staffId);
            query.setParameter("month", month);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public List<TicketAndThumup> getTicketsByStaffAndType(Staff staff, boolean type) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM TicketAndThumup t WHERE t.staff = :staff AND t.type = :type";
            Query<TicketAndThumup> query = session.createQuery(hql, TicketAndThumup.class);
            query.setParameter("staff", staff);
            query.setParameter("type", type);
            return query.list();
        }
    }
    
    public long countTicketsByStaffAndType(Staff staff, boolean type) {
        try (Session session = sessionFactory.openSession()) {
            Query<Long> query = session.createQuery("SELECT COUNT(*) FROM TicketAndThumup WHERE staff = :staff AND type = :type", Long.class);
            query.setParameter("staff", staff);
            query.setParameter("type", type);
            return query.uniqueResult();
        }
    }

}
