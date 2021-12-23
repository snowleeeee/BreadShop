package com.bread.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bread.service.CartService;
import com.bread.vo.BreadCartVO;

public class CartDeleteController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String cartId = req.getParameter("cartId");
		String memberId = req.getParameter("memberId");

		CartService service = new CartService();

		// 상품 삭제하기
		BreadCartVO vo = new BreadCartVO();
		service.delete(cartId);
		PrintWriter out = res.getWriter();

		out.println("<script>alert('상품이 삭제되었습니다'); </script>");

		// 장바구니 리스트 출력하기
		List<BreadCartVO> list = service.searchList(memberId);
		req.setAttribute("cartList", list);
		req.getRequestDispatcher("cart/cartList.jsp").forward(req, res);

	}

}
