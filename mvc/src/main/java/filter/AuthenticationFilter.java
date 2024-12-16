package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//@WebFilter("/*")
public class AuthenticationFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;

		HttpServletResponse httpResponse = (HttpServletResponse) response;

		// 세션에서 로그인 정보가 있는지 확인
		HttpSession session = httpRequest.getSession();
		// 세션이 null 이거나 session.getAttribute("vo") == null 둘 중 하나 참이면 boolean isNotLogin에 참값이 담김
		// 한번도 사이트에 방문한적이 없거나, vo에 없다면 (즉 둘 중 하나가 참이라면) isNotLogin이 true 값을 가짐
		boolean isNotLogin = (session == null || session.getAttribute("vo") == null);
		
		// 로그인 페이지의 URL
		// httpRequest.getContextPath() <== 프로젝트명 : localhost:8080/mvc/...
		String loginURI = httpRequest.getContextPath()+"/login";
		
		if(isNotLogin) {
			// 로그인 된적이 없다면 login페이지로 이동
			httpResponse.sendRedirect(loginURI);
		}else {
			chain.doFilter(httpRequest, httpResponse);
		}
		

	}

}
