package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {

    private IUserRepository iRepository = new UserRepository();
    @Override
  public List<User> findAll(){
        return iRepository.findByAll();
    }

    @Override

    public boolean save(User user) {
        return iRepository.save(user);
    }

    @Override
    public User findById(int id) {
        return iRepository.findById(id);
    }

    @Override
    public boolean deleteUser(int id) {
        return iRepository.deleteUser(id);
    }

    @Override
    public boolean editUser(int id, User user) {
        return iRepository.editUser(id,user);
    }

    @Override
    public List<User> sortByName() {
        return iRepository.sortByName();
    }

}
