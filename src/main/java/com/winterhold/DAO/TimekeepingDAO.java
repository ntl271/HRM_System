package com.winterhold.DAO;


import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.winterhold.Model.Staff;
import com.winterhold.Model.Timekeeping;

public class TimekeepingDAO {
    private SessionFactory sessionFactory;

    public TimekeepingDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @SuppressWarnings("deprecation")
	public void addTimekeeping(Timekeeping timekeeping) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(timekeeping);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public Timekeeping getTimekeepingById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Timekeeping.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Timekeeping> getAllTimekeepings() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from Timekeeping", Timekeeping.class).list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @SuppressWarnings("deprecation")
	public void updateTimekeeping(Timekeeping timekeeping) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.update(timekeeping);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    @SuppressWarnings("deprecation")
	public void deleteTimekeeping(int id) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            Timekeeping timekeeping = session.get(Timekeeping.class, id);
            if (timekeeping != null) {
                session.delete(timekeeping);
                transaction.commit();
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
    public int countWorkingDaysInMonth(int staffId, int month, int year) {
        Transaction transaction = null;
        Session session = null;
        int count = 0;

        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();

            // Tạo ngày bắt đầu và ngày kết thúc của tháng
            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.YEAR, year);
            calendar.set(Calendar.MONTH, month - 1); // Month is 0-based in Calendar
            calendar.set(Calendar.DAY_OF_MONTH, 1);
            Date startMonth = new Date(calendar.getTimeInMillis());
            calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
            Date endMonth = new Date(calendar.getTimeInMillis());

            // Query để đếm số ngày làm việc
            Query<Long> query = session.createQuery(
                "SELECT COUNT(tk) FROM Timekeeping tk " +
                "WHERE tk.staff.id = :staffId " +
                "AND tk.tkDay BETWEEN :startMonth AND :endMonth " +
                "AND (tk.type = 0 OR tk.type = 2)", Long.class);
            query.setParameter("staffId", staffId);
            query.setParameter("startMonth", startMonth);
            query.setParameter("endMonth", endMonth);

            // Lấy kết quả
            count = Math.toIntExact(query.getSingleResult());

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return count;
    }
    
    public List<Timekeeping> getCurrentMonthTimekeepingByStaff(Staff staff) {
        try (Session session = sessionFactory.openSession()) {
            Calendar calendar = Calendar.getInstance();
            int currentMonth = calendar.get(Calendar.MONTH) + 1; // Months are zero-based in Calendar
            int currentYear = calendar.get(Calendar.YEAR);

            String hql = "FROM Timekeeping t WHERE t.staff = :staff " +
                         "AND MONTH(t.tkDay) = :currentMonth " +
                         "AND YEAR(t.tkDay) = :currentYear";

            Query<Timekeeping> query = session.createQuery(hql, Timekeeping.class);
            query.setParameter("staff", staff);
            query.setParameter("currentMonth", currentMonth);
            query.setParameter("currentYear", currentYear);

            return query.list();
        }
    }
    public List<Timekeeping> getAllTimekeepingByStaff(Staff staff) {
        try (Session session = sessionFactory.openSession()) {
            Query<Timekeeping> query = session.createQuery("FROM Timekeeping WHERE staff = :staff", Timekeeping.class);
            query.setParameter("staff", staff);
            return query.list();
        }
    }
    
    public long countCurrentMonthTimekeepingByStaff(Staff staff) {
        try (Session session = sessionFactory.openSession()) {
            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.DAY_OF_MONTH, 1);
            Date startOfMonth =  calendar.getTime();

            calendar.add(Calendar.MONTH, 1);
            calendar.set(Calendar.DAY_OF_MONTH, 1);
            Date startOfNextMonth =calendar.getTime();

            Query<Long> query = session.createQuery("SELECT COUNT(*) FROM Timekeeping WHERE staff = :staff AND tkDay >= :startOfMonth AND tkDay < :startOfNextMonth", Long.class);
            query.setParameter("staff", staff);
            query.setParameter("startOfMonth", startOfMonth);
            query.setParameter("startOfNextMonth", startOfNextMonth);
            return query.uniqueResult();
        }
    }
}
