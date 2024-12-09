package com.winterhold.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.hibernate.query.criteria.HibernateCriteriaBuilder;

import com.winterhold.Model.Department;
import com.winterhold.Model.Office;
import com.winterhold.Model.Staff;
import com.winterhold.Util.HibernateUtil;

import jakarta.persistence.criteria.CriteriaQuery;

public class StaffDAO {

	private SessionFactory sessionFactory;

	public StaffDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<Staff> getAllStaff() {
		List<Staff> staffList = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			HibernateCriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<Staff> criteriaQuery = builder.createQuery(Staff.class);
			criteriaQuery.select(criteriaQuery.from(Staff.class));

			Query<Staff> query = session.createQuery(criteriaQuery);
			staffList = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return staffList;
	}

	@SuppressWarnings("deprecation")
	public void addStaff(Staff staff) {
		Transaction transaction = null;
		try (Session session = sessionFactory.openSession()) {
			transaction = session.beginTransaction();
			session.save(staff);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null && transaction.isActive()) {
				transaction.rollback();
			}
		}
	}

	public Staff getStaffById(int id) {
		try (Session session = sessionFactory.openSession()) {
			return session.get(Staff.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings("deprecation")
	public void updateStaff(Staff staff) {
		Transaction transaction = null;
		try (Session session = sessionFactory.openSession()) {
			transaction = session.beginTransaction();
			session.update(staff);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null && transaction.isActive()) {
				transaction.rollback();
			}
		}
	}

	@SuppressWarnings("deprecation")
	public void deleteStaff(int id) {
		Transaction transaction = null;
		try (Session session = sessionFactory.openSession()) {
			transaction = session.beginTransaction();

			Staff staff = session.get(Staff.class, id);
			if (staff != null) {
				// Xóa tham chiếu từ Department và Office trước khi xóa Staff
				staff.getDepartment().getStaff().remove(staff);

				// Xóa Staff
				session.delete(staff);
			} else {
				System.out.println("Không tìm thấy nhân viên với ID " + id);
			}

			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	@SuppressWarnings("deprecation")
	public void updatePosition(int staffId, int newPositionId) {
		try (Session session = sessionFactory.openSession()) {
			Transaction transaction = session.beginTransaction();
			Staff staff = session.get(Staff.class, staffId);

			if (staff == null) {
				throw new IllegalArgumentException("Staff with ID " + staffId + " does not exist");
			}

			Office newOffice = session.get(Office.class, newPositionId);
			staff.setOffice(newOffice);

			session.update(staff);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("deprecation")
	public void updatePositionDepartment(int staffId, int newDepartmentId, int newPositionId) {
		try (Session session = sessionFactory.openSession()) {
			Transaction transaction = session.beginTransaction();

			Staff staff = session.get(Staff.class, staffId);
			Department newDepartment = session.get(Department.class, newDepartmentId);
			Office newPosition = session.get(Office.class, newPositionId);

			// Set new position and department
			staff.setOffice(newPosition);
			staff.setDepartment(newDepartment); // Make sure department is set

			session.update(staff);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Department getStaffinAssignment(int id) {
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

	public List<Staff> getStaffWithoutAccount() {
		Session session = sessionFactory.openSession();
		try {
			String hql = "SELECT s FROM Staff s WHERE s.ID_staff NOT IN (SELECT a.staff.ID_staff FROM Account a)";
			Query<Staff> query = session.createQuery(hql, Staff.class);
			return query.getResultList();
		} finally {
			session.close();
		}
	}

	public void close() {
		if (sessionFactory != null) {
			sessionFactory.close();
		}
	}
	
	// Phương thức lấy số lượng staff
    public long getStaffCount() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Long> query = session.createQuery("SELECT COUNT(*) FROM Staff", Long.class);
            return query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
 // Phương thức lấy danh sách nhân viên với ID_dp = 5 và ID_of = 16
    public List<Staff> getStaffByDepartmentAndOffice(int departmentId, int officeId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Staff> query = session.createQuery("FROM Staff s WHERE s.department.ID_dp = :departmentId AND s.office.ID_of = :officeId", Staff.class);
            query.setParameter("departmentId", departmentId);
            query.setParameter("officeId", officeId);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
