package serrvice;

import dao.CategoryDAO;
import model.Category;

import java.util.List;

public class CategoryService {
    private CategoryDAO categoryDAO = new CategoryDAO();

    public List<Category> findAll(){
        return categoryDAO.findAll();
    }

    public Category findById(int id){
        return categoryDAO.findById(id);
}
    public void save(Category category) {
        categoryDAO.save(category);
    }
    public void editCategory(Category category){
        CategoryDAO.editCategory(category);

    }

}
