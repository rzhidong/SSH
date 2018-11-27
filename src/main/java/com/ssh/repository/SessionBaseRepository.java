package com.ssh.repository;

import org.hibernate.Session;

public interface SessionBaseRepository {
	
	public Session getCurrentSession();
}
