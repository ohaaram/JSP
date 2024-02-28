package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; // Fixed import

public class HelloServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public void init() throws ServletException {
        // 서블릿이 최초 실행될 때 초기화 작업 처리
        System.out.println("HelloServlet init()....");
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // GET 요청이 들어올 때
        System.out.println("HelloServlet doGet().....");
        
        //HTML 출력
        resp.setContentType("text/html;charset=utf-8");
        
        PrintWriter writer = resp.getWriter();
        writer.println("<html>");
        writer.println("<head>");
        writer.println("<meta chaset='UTF-8'>");
        writer.println("<title>HelloServlet</title>");
        writer.println("</head>");
        writer.println("<body>");
        writer.println("<h3>HelloServlet</h3>");
        writer.println("<a href = './ServletTest.jsp'>Servlet 메인</a>");
        writer.println("<a href = './hello.do'>HelloServlet</a>");
        writer.println("<a href = './welcome.do'>WelcomeServlet</a>");
        writer.println("<a href = './greeting.do'>Greeting Servlet</a>");
        writer.println("</body>");
        writer.println("</html>");
        writer.close();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // POST 요청이 들어올 때
        System.out.println("HelloServlet doPost().....");
    }

    public void destroy() { // Corrected method signature
        // 서블릿이 종료될 때
        System.out.println("HelloServlet destroy().....");
    }

}