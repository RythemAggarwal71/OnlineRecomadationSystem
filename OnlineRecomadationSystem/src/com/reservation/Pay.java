package com.reservation;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.Dbconn;

/**
 * Servlet implementation class Pay
 */
@WebServlet("/Pay")
public class Pay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pay() {
        super();
        // 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 
		HttpSession session=request.getSession(true);
		PrintWriter pw=response.getWriter();
		String uname=(String)session.getAttribute("name");
		int tid=Integer.parseInt(session.getAttribute("tid").toString());
		Connection con = null;
		
		PreparedStatement ps;
		
		String bank = null;
		String credit=null,pin=null;
		double currentbal=0.0;
		Timestamp ts=new Timestamp(System.currentTimeMillis());
	     System.out.println("Current Time Stamp==>"+ts);
		bank = request.getParameter("bank");
		credit = request.getParameter("card");
		pin = request.getParameter("pin");
		
		
		try{	
			con=Dbconn.conn();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from bankinfo");
			if (rs.next()) {
				double avilbal=rs.getDouble(5);
				double amtpay=Double.parseDouble(session.getAttribute("amounttopay").toString());
				currentbal=avilbal-amtpay;
				
				Statement st2=con.createStatement();
				st2.executeUpdate("update book set flag=1 where Id='"+tid+"'");
				Statement st3=con.createStatement();
				st3.executeUpdate("insert into transaction values('"+uname+"','"+bank+"',00.0,'"+amtpay+"','"+currentbal+"','"+ts+"')");
				Statement st4=con.createStatement();
				st4.executeUpdate("update bankinfo set Currentbalance='"+currentbal+"' where User='"+uname+"' and BankName='"+bank+"'");
				
			}
			else
			{
				pw.println("<script> alert(' Please select Correct bank... Transaction Declined...!!!');</script>");	
					RequestDispatcher rd=request.getRequestDispatcher("Proceedtopay.jsp");
					rd.include(request, response);
			}
		}
		catch(SQLException sqle){
			System.out.println("Payment:SqlException"+sqle);
					} catch (ClassNotFoundException e) {
			// 
			e.printStackTrace();
		}
			
		RequestDispatcher rd=request.getRequestDispatcher("Successfulltransaction.jsp");
		rd.include(request, response);
		
		
	}

}
