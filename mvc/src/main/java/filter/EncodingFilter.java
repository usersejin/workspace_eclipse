package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;

// Servlet filter
// Http 요청과 응답을 가로채서 변경할 수 있는 자바 클래스
// 서블릿이 호출되기 전후에 추가적인 처리를 수행할 수 있음

// 특징
// 요청을 가로채고 처리를 할 수 있음
// 여러개의 필터를 체인으로 구성할 수 있음 (필터의 체인)

// 필터의 유용성
// 인증, 권한 검사
// 로깅 검사
// 인코딩 변환



/* 	<filter>
*		<filter-name>CharacterEncodingFilter</filter-name>
*		<filter-class>filter.EncodingFilter</filter-class> 
*	</filter>
*
*	<filter-mapping>
*		<filter-name>CharacterEncodingFilter</filter-name>
*		<url-pattern>/*</url-pattern>
*	</filter-mapping> 
*	
*	web.xml에서 작성하지말고 @WebFilter(urlPatterns = "/*")를 써
*/


@WebFilter(urlPatterns = "/*")
public class EncodingFilter implements Filter {
	// 필터 초기화 (처음에 사용할 때)
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("필터 초기화");
	}
	
	// 진짜 필터링하는 곳 => 필터
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("필터 처리");
		
		// 요청 인코딩
		request.setCharacterEncoding("UTF-8");
		// 응답의 컨텐츠타입 지정
		response.setContentType("text/html;charset=UTF-8");
		// 접속한 사람의 IP를 로그 테이블에 저장
		
		
		// 다음 필터 또는 서블릿에서 전달해주는 것
		chain.doFilter(request, response);
		
		
		}
	
	
	
	// 자원 정리
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		Filter.super.destroy();
	}
	

}
