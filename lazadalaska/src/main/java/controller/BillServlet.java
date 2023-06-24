package controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import dao.BillHomeDAO;
import model.BillHome;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;

@WebServlet(urlPatterns = "/checkout")
public class BillServlet extends HttpServlet {
    private BillHomeDAO billHomeDAO = new BillHomeDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("idUser"));
        String cartS = req.getParameter("cart");
        Gson gson = new Gson();
        Type cartItemListType = new TypeToken<List<BillHome>>() {
        }.getType();
        List<BillHome> cartItems = gson.fromJson(cartS, cartItemListType);

//        for (Cart item : cartItems) {
//
//        }
        billHomeDAO.saveBilltoDataBase(id, cartItems);
        billHomeDAO.updateCartStatus(id);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write("Checkout successful");

    }
}
