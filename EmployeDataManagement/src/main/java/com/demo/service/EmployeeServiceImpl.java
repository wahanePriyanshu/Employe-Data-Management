package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.dao.EmployeeDao;
import com.demo.model.Employee;



@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDao ed;

	@Override
	public List<Employee> findAll() {
		
		return ed.findAll();
		}

	@Override
	public Employee save(Employee e) {
		
		return ed.save(e);
	}

	@Override
	public int deleteById(int id) {
		
		return ed.deleteById(id);
	}

	@Override
	public List<Employee> findByNameContainingIgnoreCase(String name) {
		
		return ed.findByNameContainingIgnoreCase(name);
	}
}
