package com.reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
 * Servlet implementation class Book
 */
@WebServlet("/Book")
public class Book extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Book() {
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
		PrintWriter out = response.getWriter();
		String user="",address="",gender="",contact="",email="",from="", to="", tdate="",seat="";
		double amount=0.0;
		int tid=0;
		user=request.getParameter("txt_uname");
		System.out.println("user===>"+user);
		address=request.getParameter("txt_uadd");
		gender=request.getParameter("txt_ugen");
		contact=request.getParameter("txt_umob");
		email=request.getParameter("txt_Uemail");
		from=request.getParameter("txt_Ufrm");
		to=request.getParameter("txt_Uto");
		tdate=request.getParameter("txt_Udate");
		seat=request.getParameter("txt_USeat");
//		System.out.println("amount===>"+request.getParameter("txt_Uamt"));
		amount=Double.parseDouble(request.getParameter("txt_Uamt"));
		double totamt=amount * Integer.parseInt(seat);
		session.setAttribute("amounttopay", totamt);
		int flg=0;
		try {
		Dbconn db=new Dbconn();
		Connection con=db.conn();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select max(Id) from book");
		
		if(rs.next())
		{
			tid=rs.getInt(1)+1;
		}
		session.setAttribute("tid", tid);
		PreparedStatement ps=con.prepareStatement("insert into Book values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
		
		ps.setInt(1, tid);
		ps.setString(2, user);
		ps.setString(3, address);
		ps.setString(4, gender);
		ps.setString(5, contact);
		ps.setString(6, email);
		ps.setString(7, from);
		ps.setString(8, to);
		ps.setString(9, tdate);
		ps.setString(10, seat);
		ps.setDouble(11, totamt);
		ps.setInt(12, flg);
		ps.setString(13,"");
		ps.executeUpdate();

		RequestDispatcher rd = request.getRequestDispatcher("/Proceedtopay.jsp");
		rd.include(request, response); 
		
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
				
	}

}
