package com.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.demo.model.Employee;

@Repository
public interface EmployeeDao extends JpaRepository<Employee, Integer> {

	List<Employee>findAll();
	Employee save(Employee e);// insert or update
	
	@Query(value = "delete from Employee where id=?1",nativeQuery = true)
	@Modifying
	int deleteById(int id);
	
	List<Employee> findByNameContainingIgnoreCase(String name);
	
}
