package serrvice;

import dao.CategoryDAO;
import dao.StatusDAO;
import model.Category;
import model.Status;

import java.util.List;

public class StatusService {
    private StatusDAO statusDAO = new StatusDAO();

    public List<Status> findAll(){
        return statusDAO.findAll();
    }

    public Status findById(int id){
        return statusDAO.findById(id);
    }

}
