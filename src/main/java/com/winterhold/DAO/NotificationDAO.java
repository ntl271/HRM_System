package com.winterhold.DAO;

import com.winterhold.Model.Notification;
import com.winterhold.Model.Staff;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.hibernate.SessionFactory;
import java.util.List;

public class NotificationDAO {
    private SessionFactory sessionFactory;

    public NotificationDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    // Thêm một thông báo mới
    @SuppressWarnings("deprecation")
	public void addNotification(Notification notification) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.save(notification);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.getStatus().canRollback()) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Cập nhật một thông báo
    @SuppressWarnings("deprecation")
	public void updateNotification(Notification notification) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.update(notification);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.getStatus().canRollback()) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Xóa một thông báo
    @SuppressWarnings("deprecation")
	public void deleteNotification(int notificationId) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            Notification notification = session.get(Notification.class, notificationId);
            if (notification != null) {
                session.delete(notification);
                transaction.commit();
            }
        } catch (Exception e) {
            if (transaction != null && transaction.getStatus().canRollback()) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Lấy một thông báo theo ID
    public Notification getNotificationById(int notificationId) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return session.get(Notification.class, notificationId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Lấy tất cả thông báo
    public List<Notification> getAllNotifications() {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return session.createQuery("from Notification", Notification.class).list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Lấy thông báo theo nhân viên
    public List<Notification> getNotificationsByStaff(Staff staff) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query<Notification> query = session.createQuery("from Notification where staff = :staff", Notification.class);
            query.setParameter("staff", staff);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
}
