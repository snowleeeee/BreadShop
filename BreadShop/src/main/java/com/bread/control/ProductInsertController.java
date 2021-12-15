package com.bread.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bread.service.ProductService;
import com.bread.vo.BreadProductVO;

public class ProductInsertController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// int productId, String productName, String productDesc, int productPrice,
		String productId = req.getParameter("product_id");
		String productName = req.getParameter("product_name");
		String productDesc = req.getParameter("product_desc");
		String productPrice = req.getParameter("product_price");
		String productImage = req.getParameter("product_image");
		String productCount = req.getParameter("product_count");
		String productGrade = req.getParameter("product_grade");
		String productInventory = req.getParameter("product_inventory");

		
		BreadProductVO vo = new BreadProductVO();
		vo.setProductDesc(productDesc);
		vo.setProductId(productId);
		vo.setProductImage(productImage);
		vo.setProductName(productName);
		vo.setProductPrice(Integer.parseInt(productPrice));
		vo.setProductCount(Integer.parseInt(productCount));
		vo.setProductGrade(Double.parseDouble(productGrade));
		vo.setProductInventory(Integer.parseInt(productInventory));

		ProductService service = new ProductService();
		service.insert(vo);
		req.setAttribute("product", vo);

		req.getRequestDispatcher("product/productOutput.jsp").forward(req, res);

	}
}
