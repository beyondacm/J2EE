import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class TestLifeCycleServlet extends HttpServlet {
	
	
	
	@Override
	
	public void destroy() {
		System.out.println("destory");
	}

	@Override
	//init方法只执行一次
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init");
	}

	public TestLifeCycleServlet(){
		System.out.println("constructor");
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet");
	}
	
}
