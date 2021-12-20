package com.bread.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bread.service.ProductService;
import com.bread.vo.BreadProductVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductUpdateController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 이미지
		String saveUrl = req.getRealPath("/upload");
		int maxSize = 30 * 1024 * 1024;
		String encoding = "UTF-8";
		MultipartRequest mRequest = new MultipartRequest(req, saveUrl, maxSize, encoding,
				new DefaultFileRenamePolicy());

		// product_id, product_name, product_desc, product_price, product_image,
		// product_inventory
		
		String productId = mRequest.getParameter("product_id");
		String productName = mRequest.getParameter("product_name");
		String productDesc = mRequest.getParameter("product_desc");
		String productPrice = mRequest.getParameter("product_price");
		String productImage = mRequest.getFilesystemName("product_image");
		String productInventory = mRequest.getParameter("product_inventory");

		
		
		
		
		// 밑의 두개는 일단 넣어둬봤음...
		String productCount = mRequest.getParameter("product_count");
		String productGrade = mRequest.getParameter("product_grade");


		BreadProductVO vo = new BreadProductVO();
		vo.setProductId(productId);
		vo.setProductName(productName);
		vo.setProductDesc(productDesc);
		vo.setProductPrice(Integer.parseInt(productPrice));
		vo.setProductImage(productImage);
		vo.setProductInventory(Integer.parseInt(productInventory));

		// vo.setProductCount(Integer.parseInt(productCount));
		vo.setProductGrade(Double.parseDouble(productGrade));

		ProductService service = new ProductService();
		service.update(vo);

//		req.setAttribute("update_id", productId);
//		req.setAttribute("update_name", productName);
//		req.setAttribute("update_desc", productDesc);
//		req.setAttribute("update_price", productDesc);
//		req.setAttribute("update_image", productImage);
//		req.setAttribute("update_inventory", productInventory);

		req.setAttribute("product", vo);

		req.getRequestDispatcher("product/productUpdateOutput.jsp").forward(req, res);
	}

}
