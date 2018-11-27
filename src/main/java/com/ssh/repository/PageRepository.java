package com.ssh.repository;

import java.util.List;

import com.ssh.entity.Person;

public interface PageRepository {

	public List<Person> queryPageForPerson(int offset, int length);
	
	public Integer getPersonAllRowCount();
}
