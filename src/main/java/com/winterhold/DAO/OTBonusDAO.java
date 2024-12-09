package com.winterhold.DAO;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.winterhold.Model.OTBonus;
import com.winterhold.Model.Office;
import com.winterhold.Model.Staff;

import org.hibernate.SessionFactory;

public class OTBonusDAO {

	private SessionFactory sessionFactory;

	public OTBonusDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("deprecation")
	public void addOTBonus(OTBonus otBonus) {
		Transaction transaction = null;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			session.save(otBonus);
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
	}

	@SuppressWarnings("deprecation")
	public void updateOTBonus(OTBonus otBonus) {
		Transaction transaction = null;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			session.update(otBonus);
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
	}

	@SuppressWarnings("deprecation")
	public void deleteOTBonus(int id) {
		Transaction transaction = null;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			OTBonus otBonus = session.get(OTBonus.class, id);
			if (otBonus != null) {
				session.delete(otBonus);
				System.out.println("OTBonus is deleted");
			}
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
	}

	public OTBonus getOTBonusById(int id) {
		Transaction transaction = null;
		Session session = null;
		OTBonus otBonus = null;
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			otBonus = session.get(OTBonus.class, id);
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
		return otBonus;
	}

	public List<OTBonus> getAllOTBonuses() {
		Transaction transaction = null;
		Session session = null;
		List<OTBonus> otBonuses = null;
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			otBonuses = session.createQuery("from OTBonus", OTBonus.class).list();
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
		return otBonuses;
	}

	public float calculateOTSalary(int staffId, int month) {
		Transaction transaction = null;
		float totalOtSalary = 0;
		Session session = null;

		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();

			// Lấy danh sách OTBonus của Staff dựa trên staffId, tháng và type = 1
			Query<OTBonus> query = session.createQuery(
					"FROM OTBonus WHERE staff.id = :staffId " + "AND MONTH(otDay) = :month AND type = true",
					OTBonus.class);
			query.setParameter("staffId", staffId);
			query.setParameter("month", month);
			List<OTBonus> otBonuses = query.list();

			for (OTBonus otBonus : otBonuses) {
				// Lấy thông tin Office từ Staff
				Office office = otBonus.getStaff().getOffice();

				if (office != null) {
					// Lấy thông tin cần thiết
					float salary = office.getSalary();
					float coefficient = otBonus.getCoefficient();
					int otTime = otBonus.getOtTime();

					// Tính tổng lương OT
					float otSalary = (salary / 8) * coefficient * otTime;
					totalOtSalary += otSalary;
				}
			}

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

		return totalOtSalary;
	}
	
	 public List<OTBonus> getAllOTBonusesByStaff(Staff staff) {
	        try (Session session = sessionFactory.openSession()) {
	            String hql = "FROM OTBonus WHERE staff = :staff";
	            Query<OTBonus> query = session.createQuery(hql, OTBonus.class);
	            query.setParameter("staff", staff);
	            return query.getResultList();
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }
	    }

}
