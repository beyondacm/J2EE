import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloWorldServlet extends HttpServlet{

	@Override
	//request��װ�˿ͻ��˵��������˵�һϵ������ ����������servlet�ѽ��յ�����Ϣ���ݸ�servlet
	//response��װ�˷������˸��ͻ��˵���Ӧ
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet");
		response.getWriter().write("<a href='http://www.baidu.com'>Go</a>");
	}

}
