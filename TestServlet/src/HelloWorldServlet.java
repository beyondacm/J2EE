import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloWorldServlet extends HttpServlet{

	@Override
	//request封装了客户端到服务器端的一系列请求 服务器调用servlet把接收到的信息传递给servlet
	//response封装了服务器端给客户端的响应
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet");
		response.getWriter().write("<a href='http://www.baidu.com'>Go</a>");
	}

}
