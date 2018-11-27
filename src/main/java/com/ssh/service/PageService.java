package com.ssh.service;

import com.ssh.entity.Person;
import com.ssh.util.PageUtil;

public interface PageService {
	
	public PageUtil<Person> queryPageForPerson(int currentPage,int pageSize);

}
