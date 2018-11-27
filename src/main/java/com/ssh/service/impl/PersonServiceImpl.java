package com.ssh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssh.entity.Person;
import com.ssh.repository.PersonRepository;
import com.ssh.service.PersonService;

@Service("personService")
public class PersonServiceImpl implements PersonService{

	@Autowired
	private PersonRepository personRepository;
	
	public Long savePerson(Person person) {
		return personRepository.save(person);
	}

	public List<Person> findAll() {
		// TODO Auto-generated method stub
		return personRepository.findAll();
	}

	public Person getPersonById(Long id) {
		// TODO Auto-generated method stub
		return personRepository.get(id);
	}

	public void updatePerson(Person person) {
		// TODO Auto-generated method stub
		personRepository.update(person);
	}

	public void deletePerson(Long id) {
		// TODO Auto-generated method stub
		personRepository.delete(id);
	}

}
