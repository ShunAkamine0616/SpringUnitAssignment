package com.example.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.dao.UserDao;
import com.example.entity.User;

public class UserServiceImpl {
	@Autowired
	private UserDao userDao;
	public List<User> findAll() {
		return userDao.findAll();
	}

	public User findByUserIdAndPass(String userId, String pass) {
		return userDao.findByUserIdAndPass(userId, pass);
	}
}
