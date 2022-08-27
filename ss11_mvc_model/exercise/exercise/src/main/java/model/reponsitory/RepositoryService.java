package model.reponsitory;

import model.Product;

import java.util.*;

public class RepositoryService implements IRepositoryService {

    private static Map<Integer, Product> productList = new HashMap<>();

    static {


        productList.put(1, new Product(1, "bánh chocolate", 30000, "Mềm, ngon", "12/07/2022", "Đà Nẵng"));
        productList.put(2, new Product(2, "bánh gạo", 50000, "Giòn, ngon", "12/07/2022", "Đà Nẵng"));
        productList.put(3, new Product(3, "bánh oreo", 20000, "Giòn, ngon", "12/08/2022", "Tp. HCM"));
        productList.put(4, new Product(4, "bánh pía", 30000, "Mềm, ngon", "12/08/2022", "Tp. HCM"));
        productList.put(5, new Product(5, "bánh snack", 10000, "Giòn, ngon", "12/08/2022", "Tp. HCM"));
    }


    @Override
    public List<Product> findAll() {

        return new ArrayList<>(productList.values());
    }

    @Override
    public String view(int id) {
        return null;
    }

    @Override
    public void save(Product product) {
        productList.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return productList.get(id);
    }

    @Override
    public void update(int id, Product product) {
        productList.put(id, product);
    }

    @Override
    public void remove(int id) {
        productList.remove(id);
    }

    @Override
    public List<Product> search(String name) {
        List<Product> list = new ArrayList<>();
        Set<Integer> set = productList.keySet();
        for (Integer integer : set) {
            if (productList.get(integer).getName().contains(name)) {
                list.add(productList.get(integer));
            }
        }
        return list;

    }


}
