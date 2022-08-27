package model.reponsitory;

import model.Product;

import java.util.List;

public interface IRepositoryService {
    List<Product> findAll();

    void save(Product product);

    Product findById(int id);

    void update(int id, Product product);

    void remove(int id);

    List<Product> search(String name);

    String view(int id);

}
