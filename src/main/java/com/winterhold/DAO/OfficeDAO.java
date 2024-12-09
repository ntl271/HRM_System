package com.winterhold.DAO;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.hibernate.query.criteria.HibernateCriteriaBuilder;

import com.winterhold.Model.Office;
import com.winterhold.Util.HibernateUtil;
import jakarta.persistence.criteria.CriteriaQuery;

public class OfficeDAO {

	private SessionFactory sessionFactory;

	public OfficeDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<Office> getAllOffices() {
		List<Office> officeList = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			HibernateCriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<Office> criteriaQuery = builder.createQuery(Office.class);
			criteriaQuery.select(criteriaQuery.from(Office.class));

			Query<Office> query = session.createQuery(criteriaQuery);
			officeList = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return officeList;
	}

	@SuppressWarnings("deprecation")
	public void addOffice(Office office) {
		Transaction transaction = null;
		try (Session session = sessionFactory.openSession()) {
			transaction = session.beginTransaction();
			session.save(office);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null && transaction.isActive()) {
				transaction.rollback();
			}
		}
	}

	public Office getOfficeById(int id) {
		try (Session session = sessionFactory.openSession()) {
			return session.get(Office.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings("deprecation")
	public void updateOffice(Office office) {
		Transaction transaction = null;
		try (Session session = sessionFactory.openSession()) {
			transaction = session.beginTransaction();
			session.update(office);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null && transaction.isActive()) {
				transaction.rollback();
			}
		}
	}

	public void deleteOffice(int id) {
		Transaction transaction = null;
		try (Session session = sessionFactory.openSession()) {
			transaction = session.beginTransaction();
			Office office = session.get(Office.class, id);
			if (office != null) {
				session.remove(office);
			}
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null && transaction.isActive()) {
				transaction.rollback();
			}
		}
	}

	

}
