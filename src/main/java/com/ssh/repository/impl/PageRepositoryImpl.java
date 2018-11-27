package com.ssh.repository.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssh.entity.Person;
import com.ssh.repository.PageRepository;

@Repository("pageRepository")
public class PageRepositoryImpl implements PageRepository {

	@Autowired
	private SessionFactory sessionFactory;

	public Session getCurrentSession() {
		return this.sessionFactory.getCurrentSession();
	}

	/**
	 * 分页查询
	 * 
	 * @param hql
	 *            查询的条件
	 * @param offset
	 *            开始记录
	 * @param length
	 *            一次查询几条记录
	 * @return 返回查询记录集合
	 */
	@SuppressWarnings("unchecked")
	public List<Person> queryPageForPerson(int offset, int length) {
		List<Person> list = null;
		try {
			Query query = getCurrentSession().createQuery("FROM Person p WhERE p.flgdeleted = 0");
			query.setFirstResult(offset);
			query.setMaxResults(length);
			list = query.list();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	/**
	 * @return 返回总记录数
	 */
	public Integer getPersonAllRowCount() {
		Long count = (Long) getCurrentSession().createQuery("select count(*) from Person p where p.flgdeleted = 0").uniqueResult();
		return count.intValue();
	}

}
