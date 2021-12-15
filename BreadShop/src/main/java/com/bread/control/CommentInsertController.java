package com.bread.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bread.service.CommentService;
import com.bread.vo.CommentVO;

public class CommentInsertController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	
		int borderNo = Integer.parseInt(req.getParameter("borderNo"));
		String commentContent = req.getParameter("commentContent");
	
		CommentVO vo = new CommentVO();

		vo.setBorderNo(borderNo);
		vo.setCommentContent(commentContent);
	
		CommentService service = new CommentService();
		service.insert(vo);
		req.setAttribute("comment", vo);
		
		req.getRequestDispatcher("breadShop/borderOutput.jsp").forward(req, res);

	}

}
