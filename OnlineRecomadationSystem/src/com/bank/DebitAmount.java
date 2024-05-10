package com.bank;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
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
 * Servlet implementation class DebitAmount
 */
@WebServlet("/DebitAmount")
public class DebitAmount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DebitAmount() {
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
	String uname, bank, Action;
	long Amount;
	bank=request.getParameter("txt_Ubank");
	Amount=Long.parseLong(request.getParameter("txt_UAmt"));
	if(Amount<0) {
		pw.println("<script>alert('Plzz Enter the Valid amount')</script>");
		RequestDispatcher rd=request.getRequestDispatcher("DebitAmount.jsp");
			rd.include(request, response);
	}
	else {
	Action="Credit";
	uname=(String)session.getAttribute("name");
	long crntbal=0, avabal=0;
	Timestamp ts=new Timestamp(System.currentTimeMillis());
     System.out.println("Current Time Stamp==>"+ts);
     
     
	try {
		Dbconn db=new Dbconn();
		Connection con=db.conn();
		
		
		Statement st1=con.createStatement();
 		ResultSet rs=st1.executeQuery("select * from bankinfo where User='"+uname+"' and BankName='"+bank+"'");
 				if(rs.next())
 				{
 					avabal=Long.parseLong(rs.getString("Currentbalance"));
 					crntbal=avabal-Amount;
 					String crntbal1=String.valueOf(crntbal);
 					String Amount1=String.valueOf(Amount);
 					Statement st2=con.createStatement();        
 			        String qry2="update bankinfo set Currentbalance='"+crntbal1+"' where User='"+uname+"' and BankName='"+bank+"'";
 			        int rs2=st2.executeUpdate(qry2);
 			        if(rs2!=0)
 			        {
 	 					Statement st=con.createStatement();
 	 					st.executeUpdate("insert into transaction values('"+uname+"','"+bank+"',00.0,'"+Amount1+"','"+crntbal1+"','"+ts+"')");
 
 	 					pw.println("<script> alert(' Debited Successfully');</script>");	
 	 					RequestDispatcher rd=request.getRequestDispatcher("DebitAmount.jsp");
 	 					rd.include(request, response);
 			        }
 					
 				}
 				else
 				{
 					pw.println("<script> alert(' There is no bank account in bank for perticular user');</script>");
 					RequestDispatcher rd=request.getRequestDispatcher("AddAccount.jsp");
 					rd.include(request, response);
 				}				
 			        

 					

 	
	} catch (Exception e) {
		e.printStackTrace();
	}
	}
	}
}
