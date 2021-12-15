package com.bread.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FrontController extends HttpServlet {

	HashMap<String, Controller> list = null;

	@Override
	public void init(ServletConfig config) throws ServletException {

		list = new HashMap<String, Controller>();
		list.put("/productList.do", new ProductListController());
		list.put("/productInsert.do", new ProductInsertController());
		list.put("/productSearch.do", new ProductSearchController());
		list.put("/productUpdate.do", new ProductUpdateController());
		list.put("/productDelete.do", new ProductDeleteController());
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String url = req.getRequestURI();// uri : 알짜배기만 가져오기
		String context = req.getContextPath();
		String path = url.substring(context.length());

		Controller subCont = list.get(path);
		subCont.execute(req, res);
	}

}
