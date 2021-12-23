package com.bread.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bread.service.BreadMemberService;
import com.bread.vo.BreadMemberVO;

public class LoginController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String passwd = req.getParameter("passwd");
		
		BreadMemberService service = new BreadMemberService();
		BreadMemberVO vo = service.login(id, passwd);
		
		HttpSession session = req.getSession();
		PrintWriter out = res.getWriter();
		
		if( vo != null) {
			
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			
			req.getRequestDispatcher("index.jsp").forward(req, res);
			
		} else {
			
			out.write("<script>alert('장바구니에 담긴 상품이 없습니다'); history.back(); </script>");
			res.sendRedirect("login.jsp");
			
		}
	}

}
