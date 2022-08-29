package repository;

import model.User;

import java.util.List;

public interface IUserRepository {

        List<User> findByAll();


        boolean editUser(int id, User user);

        boolean deleteUser(int id);

        boolean save(User user);

        User findById(int id);

        List<User> sortByName();
}
