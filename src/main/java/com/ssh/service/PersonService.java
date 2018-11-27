package com.ssh.service;

import java.util.List;

import com.ssh.entity.Person;

public interface PersonService {
	
	Long savePerson(Person person);
	
	List<Person> findAll();
	
	Person getPersonById(Long id);
	
	void updatePerson(Person person);
	
	void deletePerson(Long id);
}
