package controller;

import model.Product;
import service.impl.IProductService;
import service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/products")
public class ProductServlet extends HttpServlet {
    private static IProductService iProductService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
            showCreateForm(request, response);
            break;
            case "edit":
                showUpdateForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "view":
                searchProduct(request, response);
                break;
            case "search":
                viewProduct(request, response);

                break;
            default:
                listProduct(request, response);

                break;
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = iProductService.findAll();
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        request.setAttribute("productList", productList);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
              addNewProduct(request, response);
                break;
            case "edit":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;

            default:
                break;
        }

    }
    private void searchProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = new ArrayList<>();
        String name = request.getParameter("nameSearch");
        productList = iProductService.searchByName(name);
        request.setAttribute("name", name);
        request.setAttribute("productList",productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/search.jsp");
        try {
           dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void viewProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = iProductService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("product/view.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = iProductService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("product/delete.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = iProductService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("product/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }



    private void addNewProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String dateOfFacture = request.getParameter("dateOfFacture");
        String address = request.getParameter("address");
        Product product = new Product(id, name, price, description, dateOfFacture,address);
        iProductService.save(product);

        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        request.setAttribute("message", "Successfully added new");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String dateOfFacture = request.getParameter("dateOfFacture");
        String address = request.getParameter("address");
            Product product = iProductService.findById(id);

        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            product.setId(id);
            product.setName(name);
            product.setPrice(price);
            product.setDescription(description);
            product.setDateOfManufacture(dateOfFacture);
            product.setAddress(address);
            iProductService.update(id,product);
            request.setAttribute("product", product);
            request.setAttribute("message", "Cập nhập sản phẩm thành công");
            dispatcher = request.getRequestDispatcher("product/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = iProductService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            iProductService.remove(id);
            try {
                response.sendRedirect("product/delete.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
