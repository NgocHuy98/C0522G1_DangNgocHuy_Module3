package service.impl;

import model.Product;
import model.reponsitory.IRepositoryService;
import model.reponsitory.RepositoryService;

import java.util.List;

public class ProductService implements IProductService {
    private  static IRepositoryService iRepositoryService = new RepositoryService();

    @Override
    public List<Product> findAll() {
        return iRepositoryService.findAll();
    }


    @Override
    public void update(int id,Product product) {
        iRepositoryService.update(id,product);
    }


    @Override
    public void remove(int id) {
        iRepositoryService.remove(id);
    }



    @Override
    public Product findById(int id) {
        return iRepositoryService.findById(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        return iRepositoryService.search(name);
    }

    @Override
    public void save(Product product) {
        iRepositoryService.save(product);
    }

}
