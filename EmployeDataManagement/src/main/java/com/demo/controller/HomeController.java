package com.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.Employee;
import com.demo.service.EmployeeService;

@Controller
public class HomeController {

	@Autowired
	private EmployeeService es;
	
	@GetMapping(value="/")
	public ModelAndView m1(ModelAndView m) {
		m.addObject("msg","hello");
		m.addObject("employees",es.findAll());
		m.setViewName("index.jsp");
		return m;
		
	}
	
	@PostMapping(value="/req1")
	public ModelAndView m2(ModelAndView m,Employee e,String b1)
	{
		if(b1.equalsIgnoreCase("add")) {
			
			e=es.save(e);
			if(e!=null)
				m.addObject("msg", "Record Inserted Successfully !!!");
			else
				m.addObject("msg","Record Not Inserted");
			m1(m);
		}
		if(b1.equalsIgnoreCase("delete")) {
			int check = es.deleteById(e.getId());
			if(check!=0)
				m.addObject("msg", "Record Deleted Successfully !!!");
			else
				m.addObject("msg","Record Not Found ");
			return m1(m);
		}
		if(b1.equalsIgnoreCase("update")) {
			
			e=es.save(e);
			m.addObject("msg","Record Updated Successfully !!");
			return m1(m);
	
		}
		return m;
	}
	
	  @GetMapping("/search")
	    @ResponseBody
	    public List<Employee> searchEmployees(@RequestParam("name") String name) {
	        return es.findByNameContainingIgnoreCase(name);
	    }
	
	
	
}
