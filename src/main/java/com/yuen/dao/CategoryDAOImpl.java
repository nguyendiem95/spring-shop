package com.yuen.dao;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.yuen.domain.Category;

@Repository
@Transactional
public class CategoryDAOImpl implements CategoryDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Category> findAll() {
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "from Category";
		
		return session.createQuery(hql).getResultList();
	}
	
	@Override
	public Category findOne(int id) {
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "select c " +
				 	 "from Category c " +
				 	 "left join fetch c.products " +
				 	 "where c.id = :id";
	
		try {
			return (Category) session.createQuery(hql).setParameter("id", id).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}
