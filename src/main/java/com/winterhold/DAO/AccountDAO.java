package com.winterhold.DAO;

import com.winterhold.Model.Account;
import com.winterhold.Model.Staff;
import com.winterhold.Util.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.hibernate.SessionFactory;

import java.util.List;

public class AccountDAO {
    private SessionFactory sessionFactory;

    public AccountDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    // Thêm một tài khoản mới
    @SuppressWarnings("deprecation")
	public void addAccount(Account account) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.save(account);
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

    // Cập nhật một tài khoản
    @SuppressWarnings("deprecation")
	public void updateAccount(Account account) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.update(account);
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

    // Xóa một tài khoản
    @SuppressWarnings("deprecation")
	public void deleteAccount(int accountId) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            Account account = session.get(Account.class, accountId);
            if (account != null) {
                session.delete(account);
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

    // Lấy một tài khoản theo ID
    public Account getAccountById(int accountId) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return session.get(Account.class, accountId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Lấy tất cả tài khoản
    public List<Account> getAllAccounts() {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return session.createQuery("from Account", Account.class).list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Lấy tài khoản theo nhân viên
    public Account getAccountByStaff(Staff staff) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            Query<Account> query = session.createQuery("from Account where staff = :staff", Account.class);
            query.setParameter("staff", staff);
            return query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
    
 // Sửa đổi mật khẩu của một Account
    @SuppressWarnings("deprecation")
	public void updatePassword(int accountId, String newPassword) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Account account = session.get(Account.class, accountId);
            if (account != null) {
                account.setPassword(newPassword);
                session.update(account);
                tx.commit();
            }
        } catch (RuntimeException e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            throw e; // Re-throwing the exception
        } finally {
            session.close();
        }
    }

    // Sửa đổi vai trò (role) của một Account
    @SuppressWarnings("deprecation")
	public void updateRole(int accountId, boolean newRole) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Account account = session.get(Account.class, accountId);
            if (account != null) {
                account.setRole(newRole);
                session.update(account);
                tx.commit();
            }
        } catch (RuntimeException e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            throw e; // Re-throwing the exception
        } finally {
            session.close();
        }
    }
    
 // Phương thức lấy số lượng account
    public long getAccountCount() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Long> query = session.createQuery("SELECT COUNT(*) FROM Account", Long.class);
            return query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    public Account getAccountByUsernameAndPassword(String username, String password) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Account> query = session.createQuery("FROM Account a WHERE a.username = :username AND a.password = :password", Account.class);
            query.setParameter("username", username);
            query.setParameter("password", password);
            return query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}

