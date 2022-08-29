package repository;

import model.User;

import java.util.List;

public interface IUserRepository {

        List<User> selectAllUsers();
        boolean insertUser(User user);

        boolean add(User user);

        User selectUser(int id);

        boolean updateUser(User user);

        boolean deleteUser(int id);

        void addUserTransaction(User user, int[] permission);

        List<User> searchByCountry(String countrySearch);
}
