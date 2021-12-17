package com.bread.control;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharsetFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		   // place your code here
	      System.out.println("doFilter() before");
	      //필터할 내용들
	      request.setCharacterEncoding("UTF-8");
	      
	      response.setCharacterEncoding("UTF-8");
	      response.setContentType("text/html;charset=utf-8");
	      // pass the request along the filter chain
	      chain.doFilter(request, response);//서블릿 실행
	      //실행후 필요한 내용들
	      System.out.println("doFilter() after");


	}

}
