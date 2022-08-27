package repository.impl;

import model.User;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository {
    private final String SELECT_ALL = "select * from users;";
    private final String INSERT_INTO = "insert into users(id,name,email, country) values (?,?,?,?)";


    @Override
    public List<User> findByAll() {
        List<User> userList = new ArrayList<>();
        // keets noi db
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");// columnLable : tên trường trong database
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id, name, email, country);
                userList.add(user);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    @Override
    public boolean add(User user) {
        // ket noi db roi them moi
        Connection connection = BaseRepository.getConnectDB();
        try {
//            name`,birthday, gender,`point`, class_id,`account`,email
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setDate(2, user.getEmail());
            preparedStatement.setBoolean(3, user.getCountry());

            int num = preparedStatement.executeUpdate();// trả về số hàng bị ảnh hưởng
//            if (num==1){
//                return true;
//            }else{
//                return false;
//            }
            return (num == 1);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
        }

