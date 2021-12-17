package com.bread.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bread.service.CartService;
import com.bread.vo.BreadCartVO;

public class CartInsertController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		필요한 값 String memberId, String productId, int cartCount

		String memberId = req.getParameter("memberId");
		String productId = req.getParameter("productId");
		String cartCount = req.getParameter("cartCount");
		String uri = req.getParameter("uri");

		BreadCartVO vo = new BreadCartVO();

		CartService service = new CartService();

		List<BreadCartVO> list = service.searchList(memberId);

		// 같은 항목이 list에 있는지 확인하기
		boolean run = false;
		int count = 0;
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
			System.out.println(list.get(i).getMemberId());
			System.out.println(list.get(i).getProductId());
			if (list.get(i).getMemberId().equals(memberId) && list.get(i).getProductId().equals(productId)) {
				// 이미 같은걸 추가한 경우
				run = true;
				count = list.get(i).getCartCount();
				break;

			}
		}

		if (run) {// 값이 있는 경우 -->값 수정

			PrintWriter out = res.getWriter();

			out.println("<script>alert('출력'); location.href='" + uri + "'; </script>");
//			location.href='이동주소';

			//출처: https: // epthffh.tistory.com/entry/JAVA단에서-alert창-띄우기 [물고기 개발자의 블로그]
			vo = service.update(memberId, productId, count);

		} else { // 값이 없는 경우 --> 새로운 값 입력
			vo = service.insert(memberId, productId, Integer.parseInt(cartCount));
		}

		req.setAttribute("cart", vo);
		//장바구니 추가후 장바구니 전체리스트
		

	}

}
