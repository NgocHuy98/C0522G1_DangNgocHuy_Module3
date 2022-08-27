package service.impl;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();


    void update(int id,Product product);

    void remove(int id);

    Product findById(int id);

    List<Product> searchByName(String name);

    void save(Product product);
}
