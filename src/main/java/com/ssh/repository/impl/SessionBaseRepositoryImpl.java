package com.ssh.repository.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssh.repository.SessionBaseRepository;

@Repository
public class SessionBaseRepositoryImpl  implements SessionBaseRepository{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getCurrentSession() {
		// TODO Auto-generated method stub
		return this.sessionFactory.getCurrentSession();
	}

}
