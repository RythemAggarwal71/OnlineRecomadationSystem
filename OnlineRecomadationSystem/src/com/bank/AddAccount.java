package com.bank;

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

/**
 * Servlet implementation class AddAccount
 */
@WebServlet("/AddAccount")
public class AddAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAccount() {
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
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(true);
		PrintWriter pw=response.getWriter();
	String uname, bank, accno, pin;
	bank=request.getParameter("txt_Ubank");
	accno=request.getParameter("txt_UAcc");
	pin=request.getParameter("txt_Pin");
	uname=request.getParameter("txt_Uname");
	int amount=Integer.parseInt(request.getParameter("txt_amt"));
	
	
	try {
		Dbconn db=new Dbconn();
		Connection con=db.conn();
		
		Statement st1=con.createStatement();
 		ResultSet rs=st1.executeQuery("select * from bankinfo where User='"+uname+"' and BankName='"+bank+"'");
 				if(rs.next())
 				{
 					
 					pw.println("<script> alert(' User with same bank alredy registerd');</script>");
 					RequestDispatcher rd=request.getRequestDispatcher("AddAccount.jsp");
 					rd.include(request, response);
 				}
 				else
 				{
		Statement st=con.createStatement();
		st.executeUpdate("insert into bankinfo values('"+uname+"','"+bank+"','"+accno+"','"+pin+"','"+amount+"')");
		
		RequestDispatcher rd=request.getRequestDispatcher("AddAccount.jsp");
		rd.include(request, response);
 				}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	
	}

}
