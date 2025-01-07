package codegym.controller;

import codegym.model.Product;
import codegym.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

    @WebServlet(name = "ProductServlet", urlPatterns = "/products")
public class ProductServlet extends HttpServlet {
    private ProductService productService;

    @Override
    public void init() {
        productService = new ProductService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String discount = request.getParameter("discount");
        String stockStr = request.getParameter("stock");

        if (name == null || name.isEmpty() || priceStr == null || priceStr.isEmpty() || discount == null || discount.isEmpty() || stockStr == null || stockStr.isEmpty()) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("views/addProduct.jsp").forward(request, response);
            return;
        }

        int price = Integer.parseInt(priceStr);
        int stock = Integer.parseInt(stockStr);

        if (price <= 100 || stock <= 10 || !(discount.equals("5%") || discount.equals("10%") || discount.equals("15%") || discount.equals("20%"))) {
            request.setAttribute("error", "Invalid input values.");
            request.getRequestDispatcher("views/addProduct.jsp").forward(request, response);
            return;
        }

        Product product = new Product(0, name, price, discount, stock);
        productService.addProduct(product);

        response.sendRedirect(request.getContextPath() + "/products");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("topProducts".equals(action)) {
            String topStr = request.getParameter("top");
            int top = Integer.parseInt(topStr);
            List<Product> productList = productService.getTopSellingProducts(top);
            request.setAttribute("productList", productList);
            request.getRequestDispatcher("views/productList.jsp").forward(request, response);
        } else {
            List<Product> productList = productService.getAllProducts();
            request.setAttribute("productList", productList);
            request.getRequestDispatcher("views/productList.jsp").forward(request, response);
        }
    }
}
