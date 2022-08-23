import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ProducServlet", value = "/product")
public class ProducServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String product = request.getParameter("product");
        double price = Double.parseDouble(request.getParameter("price"));
        double percent = Double.parseDouble(request.getParameter("percent"));

        double discountAmount =  price * percent * 0.01;
        double discountPrice =  price-discountAmount;

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");

        request.setAttribute("product",product);
        request.setAttribute("price",price);
        request.setAttribute("discountPrice",discountPrice);

        requestDispatcher.forward(request,response);

    }
}
