package com.winterhold.DAO;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.hibernate.query.criteria.HibernateCriteriaBuilder;
import com.winterhold.Model.Department;
import com.winterhold.Util.HibernateUtil;
import jakarta.persistence.criteria.CriteriaQuery;

public class DepartmentDAO {

    private SessionFactory sessionFactory;

    public DepartmentDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<Department> getAllDepartments() {
        List<Department> departmentList = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            HibernateCriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<Department> criteriaQuery = builder.createQuery(Department.class);
            criteriaQuery.select(criteriaQuery.from(Department.class));

            Query<Department> query = session.createQuery(criteriaQuery);
            departmentList = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return departmentList;
    }

    @SuppressWarnings("deprecation")
	public void addDepartment(Department department) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(department);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
    }

    public Department getDepartmentById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Department.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @SuppressWarnings("deprecation")
	public void updateDepartment(Department department) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.update(department);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
    }

    public void deleteDepartment(int id) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            Department department = session.get(Department.class, id);
            if (department != null) {
                session.remove(department);
            }
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }
    }

    public void close() {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }
    /**
     * Lấy một đối tượng Department cùng với danh sách nhân viên thuộc phòng ban đó từ cơ sở dữ liệu.
     * 
     * @param id ID của Department cần lấy
     * @return Đối tượng Department cùng với danh sách nhân viên hoặc null nếu không tìm thấy
     */
    public Department getDepartmentWithStaff(int id) {
        try (Session session = sessionFactory.openSession()) {
            Department department = session.get(Department.class, id);
            if (department != null) {
                // Khởi tạo danh sách nhân viên (fetch eagerly)
                department.getStaff().size(); // Lấy danh sách nhân viên của phòng ban
            }
            return department;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    
    
    public Department getDepartmentWithOffice(int id) {
        try (Session session = sessionFactory.openSession()) {
            Department dpWithOf = session.get(Department.class, id);
            if (dpWithOf != null) {
                // Khởi tạo danh sách nhân viên (fetch eagerly)
            	dpWithOf.getOffice().size(); // Lấy danh sách nhân viên của phòng ban
            }
            return dpWithOf;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Long countStaffInDepartment(int id) {
        Session session = sessionFactory.openSession();
        String hql = "SELECT COUNT(s) FROM Staff s WHERE s.department.id = :ID_dp";
        Query<Long> query = session.createQuery(hql, Long.class);
        query.setParameter("ID_dp", id);
        Long count = query.uniqueResult();
        session.close();
        return count;
    }
    
    // Phương thức lấy số lượng phòng ban
    public long getDepartmentCount() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Long> query = session.createQuery("SELECT COUNT(*) FROM Department", Long.class);
            return query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}
