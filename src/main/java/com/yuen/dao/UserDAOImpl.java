package com.yuen.dao;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.yuen.domain.User;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void create(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(user);
	}

	@Override
	public User findOne(String email) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "from User u " +
				 	 "where u.email = :email";
	
		try {
			return (User) session.createQuery(hql).setParameter("email", email).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}
