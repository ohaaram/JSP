package sub2;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FilterB implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)throws IOException, ServletException {
		//필터에서 처리될 로직 수행
		System.out.println("FilterB doFilter()...");
		
		//인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		
		//다음 필터로 요청
		chain.doFilter(request, response);

	}

}
