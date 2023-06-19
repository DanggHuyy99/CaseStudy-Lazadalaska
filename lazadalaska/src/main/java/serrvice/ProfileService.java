package serrvice;

import dao.CategoryDAO;
import dao.UserDAO;
import dto.PageAble;
import model.Category;
import model.Product;
import model.User;

import java.util.List;

public class ProfileService {
    private UserDAO userDAO = new UserDAO();
    public List<User> findAll() {
        return userDAO.findAll();
    }

    public User findById(int id) {
        return userDAO.findById(id);
    }
    public void updateProfile(User user) {
        userDAO.updateUser(user);
    }
    public void updatePassWord(User user){
        userDAO.updateUserPassWord(user);
    }

}
