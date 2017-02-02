package com.yuen.dao;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.yuen.domain.Product;

@Repository
@Transactional
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> findAll(int max) {
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "from Product p " +
				 	 "order by p.id desc";
	
		return session.createQuery(hql).setMaxResults(max).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> search(String q) {
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "from Product p " +
				 	 "where p.name like :q";
	
		return session.createQuery(hql).setParameter("q", "%" + q + "%").getResultList();
	}
	
	@Override
	public Product findOne(int id) {
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "select p " +
			 	 	 "from Product p " +
			 	 	 "left join fetch p.category " +
			 	 	 "where p.id = :id";

		try {
			return (Product) session.createQuery(hql).setParameter("id", id).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}
