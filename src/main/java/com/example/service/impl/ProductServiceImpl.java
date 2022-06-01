package com.example.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.ProductDao;
import com.example.entity.Product;
import com.example.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;

    public List<Product> findAll(String sort) {
        return productDao.findAll(sort);
    }
    public Product findById(Integer id) {
        return productDao.findById(id);
    }
    public List<Product> findByKeyword(String keyword, String sort) {
        return productDao.findByKeyword(keyword, sort);
    }
    public void insert(Product product) {
        productDao.register(product);
    }
    public void update(Integer productId, Product product) {
        productDao.update(productId, product);
    }
    public void delete(Integer ptoructId) {
    	productDao.delete(ptoructId);
    }
}

