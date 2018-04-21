

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
    	String username = request.getParameter("username");
    	String password= request.getParameter("password");
    	
//    	System.out.println(username);
//    	System.out.println(password);
    	 String psw =new User().findUsername(username);  
//        System.out.println(psw);
         if(psw ==null){  
             request.setAttribute("msg", "NO THIS USER");  
             request.getRequestDispatcher("/login.jsp").forward(request, response);  
             return;  
         }  
         if(psw!=null&&!psw.equals(password)){  
             request.setAttribute("msg", "PASSWORD IS WRONG");  
             request.getRequestDispatcher("/login.jsp").forward(request, response);  
             return;  
         }  
         if(psw.equals(password)){  
             request.setAttribute("msg", "Welcome "+username+" to this Web");  
             request.getRequestDispatcher("/index.jsp").forward(request, response);  
             //response.setHeader("Refresh","1;url=welcome.jsp");  
         }  
             
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
