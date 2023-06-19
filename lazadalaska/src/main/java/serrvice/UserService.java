package serrvice;

import dao.UserDAO;
import model.User;

public class UserService {
    private static UserDAO userDAO = new UserDAO();
    public static User findById(int id) {
        return userDAO.findById(id);
    }

    public Object findAll() {
        return null;
    }
    public void createUser (User user) {
        userDAO.createUser(user);
    }
}
