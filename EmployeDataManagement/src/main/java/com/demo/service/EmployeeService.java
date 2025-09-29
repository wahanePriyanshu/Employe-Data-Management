package com.demo.service;

import java.util.List;

import com.demo.model.Employee;

public interface EmployeeService {

	List<Employee>findAll();
	Employee save(Employee e);// insert or update
	int deleteById(int id);
	
	List<Employee> findByNameContainingIgnoreCase(String name);
}
