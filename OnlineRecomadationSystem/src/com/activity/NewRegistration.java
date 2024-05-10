package com.activity;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.Dbconn;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.UpdatableResultSet;

/**
 * Servlet implementation class NewRegistration
 */
@WebServlet("/NewRegistration")
public class NewRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  response.setContentType("text/html;charset=UTF-8");
		HttpSession session=request.getSession(true);
		PrintWriter pw=response.getWriter();
		
		System.out.println("NewRegistration Servlet");
		String a,b,c,d,e,f,g,h;
	
		a=request.getParameter("txt_Uname");
		System.out.println("UserName"+a);
		b=request.getParameter("txt_Address");
		System.out.println("Address"+b);
		c=request.getParameter("txt_City");
		System.out.println("City"+c);
		d=request.getParameter("rd_gender");
		System.out.println("Gender"+d);
		e=request.getParameter("txt_Email");
		System.out.println("EmailId"+e);
		h=request.getParameter("txt_Mob");
		System.out.println("MobNo"+h);
		f=request.getParameter("txt_Password");
		System.out.println("Password"+f);
		g=request.getParameter("txt_ConPassword");
		System.out.println("conPassword"+g);
		
		if(f.endsWith(g))
		{
		  try
		  {
			Connection con;
			con = Dbconn.conn();
			
			
	            
			String sql="insert into information values(?,?,?,?,?,?,?)";
			PreparedStatement p=(PreparedStatement) con.prepareStatement(sql);
			
			String id = null;
			p.setString(1,a );
			p.setString(2, b);
			p.setString(3, c);
			p.setString(4, d);
			p.setString(5, e);
			p.setString(6, h);
			p.setString(7, f);
			
			int i=p.executeUpdate();
			if(i!=0)
			{
				System.out.println("OK ");
				
				RequestDispatcher rd = request.getRequestDispatcher("/Login.jsp");
				
				
				rd.include(request, response); 
				
				
			}
			else
			{
				
				RequestDispatcher rd = request.getRequestDispatcher("/NewRegistration.jsp");
						rd.include(request, response);
				//System.out.print(" Wrong ID and Password");
				
			}
		}
		catch(Exception exc)
		{
			
			RequestDispatcher rd = request.getRequestDispatcher("/NewRegistration.jsp");
			rd.include(request, response);
			exc.printStackTrace();
		}
		}
		else
		{
			pw.println("<script> alert(' Password and confirm Password not matched');</script>");
			RequestDispatcher rd = request.getRequestDispatcher("/NewRegistration.jsp");
			rd.include(request, response);


		}
	}

}
