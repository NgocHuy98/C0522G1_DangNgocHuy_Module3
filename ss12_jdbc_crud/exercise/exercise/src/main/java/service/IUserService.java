package service;

import model.User;

import java.util.List;

public interface IUserService {

    List<User> findAll();


    boolean save(User user);

    User findById(int id);

    boolean deleteUser(int id);


    boolean editUser(int id, User user);

    List<User> sortByName();
}
