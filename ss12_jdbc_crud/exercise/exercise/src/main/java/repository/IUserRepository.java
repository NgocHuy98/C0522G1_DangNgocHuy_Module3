package repository;

import model.User;

import java.util.List;

public interface IUserRepository {

        List<User> findByAll();
        boolean add(User user);

}
