package control;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DispatcherServlet
 */
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Properties env = new Properties();

	public void init() throws ServletException {
		super.init();

		FileInputStream fis;
		String fileName = getServletContext().getRealPath("web.properties");

		try {
			fis = new FileInputStream(fileName);
			env.load(fis);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String path = request.getServletPath();
		String url = null;
		Controller c = null;
		// 1. web.properties 파일을 찾아 파일의 = 기준으로 프로퍼티 이름과 값을 구분

		// 2. 요청URL에 맞는 클래스이름 찾기
		// e.g) /singup.do 요청되면 control.SignupController 클래스 이름 찾음
		String className = env.getProperty(path);

		// 3. 클래스 이름으로 클래스로드, 객체 생성, Controller 타입으로 다운 캐스팅
		try {
			
			Class clazz = Class.forName(className);
			Object obj = clazz.newInstance();
			c = (Controller) obj;
			
			//request의 messagecontent 영역의 인코딩 변경한다.
			//GET 방식의 요청은 messagecontent 영역을 사용 안함
			request.setCharacterEncoding("UTF-8");
			url = c.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (ClassNotFoundException e) {

		} catch (InstantiationException e) {

		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (c == null) {
			System.out.println("Controller is not found");
			return;
		}

	}

}
