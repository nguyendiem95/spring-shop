package com.yuen.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.yuen.domain.Item;

@Repository
@Transactional
public class ItemDAOImpl implements ItemDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void create(Item item) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(item);
	}

}
