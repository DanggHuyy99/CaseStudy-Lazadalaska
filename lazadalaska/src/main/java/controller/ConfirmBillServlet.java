package controller;

import dao.BillDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/confirmBillServlet")
public class ConfirmBillServlet extends HttpServlet {
    private BillDAO billDAO;

    public void init() {
        billDAO = new BillDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int billId = Integer.parseInt(req.getParameter("billId"));
        billDAO.confirmBill(billId);
        resp.sendRedirect("/bill");
    }
}
