package com.ssh.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ssh.entity.Person;
import com.ssh.repository.PageRepository;
import com.ssh.service.PageService;
import com.ssh.util.PageUtil;


public class SSHTest {
	
	private ApplicationContext context = null;
	
	private PageRepository pageRepository;
	
	private PageService pageService;
	
	{
		context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		
		pageRepository = (PageRepository) context.getBean("pageRepository");
		
		pageService = (PageService) context.getBean("pageService");
	}
	
	@Test
	public void testPageRepository() {
		System.out.println(pageRepository.getPersonAllRowCount());
		System.out.println(pageRepository.queryPageForPerson(0, 5));
	}
	
	@Test
	public void testPageService() {
		PageUtil<Person> pageUtil = pageService.queryPageForPerson(1, 10);
		System.out.println(pageUtil.getTotalPages());
		System.out.println(pageUtil.getNextPageNo());
	}
}
