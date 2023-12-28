package Control;

import Dao.ProductDao;
import service.Ulti;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.nio.file.Path;
import java.sql.SQLException;
import java.util.Collection;

@MultipartConfig
@WebServlet(name = "AdminAddProductController", value = "/AdminAddProduct")
public class AdminAddProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDao dao = new ProductDao();
        String id_product;
        try {
            id_product = dao.id_notfound();
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        Part part1 = request.getPart("image1");
        String text1 = uploadImage(part1);
            try {
                if(text1!=null)dao.insertImageProduct(id_product, text1);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        Part part2 = request.getPart("image2");
        String text2 = uploadImage(part2);
        try {
            if(text2!=null)dao.insertImageProduct(id_product, text2);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        Part part3 = request.getPart("image3");
        String text3 = uploadImage(part3);
        try {
            if(text3!=null)dao.insertImageProduct(id_product, text3);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        Part part4 = request.getPart("image4");
        String text4 = uploadImage(part4);
        try {
            if(text4!=null)dao.insertImageProduct(id_product, text4);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String nameproduct = request.getParameter("nameproduct");
        int category = Integer.parseInt(request.getParameter("category"));
        String brand = request.getParameter("brand");
        int price = Integer.parseInt(request.getParameter("price"));
        int pricebuy = Integer.parseInt(request.getParameter("pricebuy"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String detail = request.getParameter("detail");
        try {
            dao.insertProduct(id_product, nameproduct, brand, category, price, pricebuy, quantity, detail);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("AdminListProduct");
    }
    public String uploadImage(Part filePart) throws IOException {
        if (filePart!=null&&!filePart.getSubmittedFileName().equals("")) {
            InputStream fileContent = filePart.getInputStream();
            File file = new File("E:\\CVTWeb\\src\\main\\webapp\\Image\\Image\\"+filePart.getSubmittedFileName());
            FileOutputStream out = new FileOutputStream(file);
            File file2 = new File("E:\\CVTWeb\\target\\WebC\\Image\\Image\\"+filePart.getSubmittedFileName());
            FileOutputStream out2 = new FileOutputStream(file2);
            int i;
            byte[] arr = new byte[1024];
            while ((i=fileContent.read(arr))!=-1) {
                out.write(arr);
                out2.write(arr);
            }
            out.close();
            out2.close();
            return "Image/"+filePart.getSubmittedFileName();
        }
        return null;
    }
}
