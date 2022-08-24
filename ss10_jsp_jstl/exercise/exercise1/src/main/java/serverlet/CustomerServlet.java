package serverlet;


import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList= new ArrayList<>();
    static {

        customerList.add(new Customer(1, "Bùi Hùng", "29/5/1993", "Đà Nẵng", "https://xahara.vn/wp-content/uploads/%E1%BA%A3nh-ch%C3%B3-m%C3%A8o-%C4%91%E1%BA%B9p-cover.jpg"));
        customerList.add(new Customer(2, "Hà Bảo Ân", "1/1/1993", "Gia Lai", "https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2020/5/2/802649/Bat-Cuoi-Truoc-Loat-.png"));
        customerList.add(new Customer(3, "Nguyễn Văn Phúc", "29/5/1998", "Nghệ An", "https://vcdn-vnexpress.vnecdn.net/2019/10/09/2c564760ec79c7047265b5207705c0-2886-5326-1570628692.jpg"));
        customerList.add(new Customer(4, "Nguyễn Tất Thành", "29/9/2000", "Đà Nẵng", "https://lyso.vn/download/file.php?id=12990"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/list.jsp");
        request.setAttribute("customerList",customerList);
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
