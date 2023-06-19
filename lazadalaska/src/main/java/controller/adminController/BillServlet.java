package controller.adminController;
import dao.BillDAO;
import dto.PageAble;
import model.Bill;
import model.BillDetail;
import model.Product;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@WebServlet(name = "BillServlet", urlPatterns = "/bill")
public class BillServlet extends HttpServlet {
    private BillDAO billDAO;
    private int TOTAL_ITEMS = 5;
    @Override
    public void init() throws ServletException {
        billDAO = new BillDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "showBill":
                showBillDetail(request, response);
                break;
            default:
                showBill(response, request);
        }
    }

    private void showBill(HttpServletResponse resp, HttpServletRequest req) throws IOException, ServletException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        String search = req.getParameter("search");
        int page = 1;
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }

        String sortBy = req.getParameter("soryBy");
        if (sortBy == null) {
            sortBy = "asc";
        }

        String nameField = req.getParameter("nameField");
        if (nameField == null) {
            nameField = "id";
        }

        PageAble pageAble = new PageAble(search, page, TOTAL_ITEMS, nameField, sortBy);

        req.setAttribute("pageable", pageAble);
        List<Bill> bills = billDAO.findAll(pageAble);
        req.setAttribute("bills", bills);
        req.getRequestDispatcher("/admin/bill.jsp").forward(req,resp);
    }

    private void showBillDetail(HttpServletRequest request, HttpServletResponse response) {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public void destroy() {

    }
}