package com.ssh.repository.impl;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssh.entity.Person;
import com.ssh.repository.PersonRepository;

@Repository("personRepository")
public class PersonRepositoryImpl extends SessionBaseRepositoryImpl implements PersonRepository {


	public Person load(Long id) {
		// TODO Auto-generated method stub
		return (Person) getCurrentSession().load(Person.class, id);
	}

	public Person get(Long id) {
		// TODO Auto-generated method stub
		return (Person) getCurrentSession().get(Person.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Person> findAll() {
		// TODO Auto-generated method stub
		return getCurrentSession().createQuery("from Person where flgdeleted = 0").list();
	}

	public void persist(Person entity) {
		// TODO Auto-generated method stub
		getCurrentSession().persist(entity);
	}

	public Long save(Person entity) {
		// TODO Auto-generated method stub
		return (Long) getCurrentSession().save(entity);
	}

	public void saveOrUpdate(Person entity) {
		// TODO Auto-generated method stub
		getCurrentSession().saveOrUpdate(entity);
	}

	public void delete(Long id) {
		// TODO Auto-generated method stub
		getCurrentSession().createQuery("UPDATE Person p set p.flgdeleted = 1 where p.id=" + id).executeUpdate();
	}

	public void flush() {
		// TODO Auto-generated method stub
		getCurrentSession().flush();
	}

	public void update(Person entity) {
		// TODO Auto-generated method stub
		getCurrentSession().createQuery("UPDATE Person p set p.username='" + entity.getUsername() + "',p.address='"
				+ entity.getAddress() + "',p.phone='" + entity.getPhone() + "',p.remark='" + entity.getRemark()
				+ "' WHERE p.id=" + entity.getId()).executeUpdate();

	}

}
