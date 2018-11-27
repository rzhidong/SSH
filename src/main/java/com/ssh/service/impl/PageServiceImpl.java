package com.ssh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssh.entity.Person;
import com.ssh.repository.PageRepository;
import com.ssh.service.PageService;
import com.ssh.util.PageUtil;

@Service("pageService")
public class PageServiceImpl implements PageService {
	
	@Autowired
	private PageRepository pageRepository;
	
	/**
	   * 分页查询 
	   * @param currentPage 当前页号：现在显示的页数
	   * @param pageSize 每页显示的记录条数
	   * @return 封闭了分页信息(包括记录集list)的Bean
	   * */
	 public PageUtil<Person> queryPageForPerson(int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		 PageUtil<Person> personPage = new PageUtil<Person>();
		 
		//总记录数
		 int sumRow = pageRepository.getPersonAllRowCount();
		 
		//当前页开始记录
		 int offset = personPage.countOffset(currentPage, pageSize);
		 
		//分页查询结果集
		 List<Person> list = pageRepository.queryPageForPerson(offset, pageSize);
		 
		 personPage.setPageNo(currentPage);
		 personPage.setPageSize(pageSize);
		 personPage.setTotalRecords(sumRow);
		 personPage.setList(list);
		 
		return personPage;
	}

}
