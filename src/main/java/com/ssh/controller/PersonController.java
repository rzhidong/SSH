package com.ssh.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssh.entity.Person;
import com.ssh.service.PageService;
import com.ssh.service.PersonService;
import com.ssh.util.PageUtil;

@Controller
public class PersonController {
	
	@Autowired
	private PersonService personService;
	
	@Autowired
	private PageService pageService;
	
	@RequestMapping(value="/savePerson",method=RequestMethod.POST)
	public String savePerson(Person person,Model model,int pageNo) {
		System.out.println(person);
		personService.savePerson(person);
		if (pageNo == 0) {
			pageNo = 1;
		}
		
		PageUtil<Person> personPage = pageService.queryPageForPerson(pageNo, 10);
		
		model.addAttribute("page",personPage);
		model.addAttribute("list", personPage.getList());
		return "list";
	}
	
	@RequestMapping("/findAll")
	public String findAll(Model model,int pageNo) {
		
		if (pageNo == 0) {
			pageNo = 1;
		}
		
		PageUtil<Person> personPage = pageService.queryPageForPerson(pageNo, 10);
		
		model.addAttribute("page",personPage);
		model.addAttribute("list", personPage.getList());
		return "list";
	}
	
	@RequestMapping("/getPerson")
	@ResponseBody
	public Person getPerson(@RequestParam("uid") long id) {
		return personService.getPersonById(id);
	}
	
	@RequestMapping("/updatePerson")
	public String updatePerson(Person person,Model model,int pageNo) {
		System.out.println(person);
//		/*Person data = personService.getPersonById(person.getId());
//		data.setUsername(person.getUsername());
//		data.setAddress(person.getAddress());
//		data.setPhone(person.getPhone());
//		data.setRemark(person.getRemark());
//		System.out.println(data);*/
		personService.updatePerson(person);
		
		if (pageNo == 0) {
			pageNo = 1;
		}
		
		PageUtil<Person> personPage = pageService.queryPageForPerson(pageNo, 10);
		
		model.addAttribute("page",personPage);
		model.addAttribute("list", personPage.getList());
		return "list";
	}
	
	@RequestMapping("/deletePerson")
	public String deletePerson(Long id,Model model,int pageNo) {
		personService.deletePerson(id);
		if (pageNo == 0) {
			pageNo = 1;
		}
		
		PageUtil<Person> personPage = pageService.queryPageForPerson(pageNo, 10);
		
		model.addAttribute("page",personPage);
		model.addAttribute("list", personPage.getList());
		return "list";
	}
	
}