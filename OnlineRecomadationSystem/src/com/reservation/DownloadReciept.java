package com.reservation;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.tomcat.jni.File;

import com.connection.Dbconn;

import com.itextpdf.text.Anchor;
import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chapter;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.List;
import com.itextpdf.text.ListItem;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Section;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * Servlet implementation class DownloadReciept
 */
@WebServlet("/DownloadReciept")
public class DownloadReciept extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18,
            Font.BOLD);
    private static Font redFont = new Font(Font.FontFamily.TIMES_ROMAN, 12,
            Font.NORMAL, BaseColor.RED);
    private static Font subFont = new Font(Font.FontFamily.TIMES_ROMAN, 16,
            Font.BOLD);
    private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12,
            Font.BOLD);
    public static byte[]  imgdata;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadReciept() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession(true);
		PrintWriter pw=response.getWriter();
		
		int tid=Integer.parseInt(request.getParameter("txtId"));
		System.out.println("Thanks==>"+tid);
		
		
		
		   try {
	           
	            
//				response.setHeader("Content-Type",
//						"application/octet-stream");
//				response.setContentType("text/plain");
//				response.setHeader("Content-Disposition",
//						"attachment; filename=\"Reciept.pdf\"");
////				byte[] b=document.toString().getBytes();
//				op.close();
			   FirstPdf.mackeReciept(tid);
			   pw.println("<script> alert(' Reciept Downloaded successfully in download folder');</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/PreviousHistory.jsp");
						rd.include(request, response);
			   
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
	}

	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}







	    private static void createTable(Section subCatPart, int tid)
	            throws BadElementException {
	        PdfPTable table = new PdfPTable(2);

	        // t.setBorderColor(BaseColor.GRAY);
	        // t.setPadding(4);
	        // t.setSpacing(4);
	        // t.setBorderWidth(1);
	        
	        String name="",address="",gender="",contact="",email="",from="",to="",bdate="",seat="",amount="",status="";
	        PdfPCell c1 = new PdfPCell(new Phrase("Parameter"));
	        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	        table.addCell(c1);

	        c1 = new PdfPCell(new Phrase("Values"));
	        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
	        table.addCell(c1);
String txid=""+tid;
	        
			try {
				Dbconn db=new Dbconn();
				Connection con=db.conn();
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery("select * from book where Id='"+tid+"'");
				if (rs.next()) {
					name=rs.getString(2);
					address=rs.getString(3);
					gender=rs.getString(4);
					contact=rs.getString(5);
					email=rs.getString(6);
					from=rs.getString(7);
					to=rs.getString(8);
					bdate=rs.getString(9);
					seat=rs.getString(10);
					amount=rs.getString(11);
					status="Paid";
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			table.addCell("Transaction Id");
	        table.addCell(txid);
	        table.addCell("name");
	        table.addCell(name);
			table.addCell("Address");
	        table.addCell(address);
	        table.addCell("Gender");
	        table.addCell(gender);
			table.addCell("Contact");
	        table.addCell(contact);
	        table.addCell("Email Id");
	        table.addCell(email);
	        table.addCell("From");
	        table.addCell(from);
	        table.addCell("To");
	        table.addCell(to);
			table.addCell("Date of Travelling");
	        table.addCell(bdate);
	        table.addCell("Seat");
	        table.addCell(seat);
			table.addCell("Amount");
	        table.addCell(amount);
	        table.addCell("Status");
	        table.addCell(status);

	        subCatPart.add(table);

	    }

	    private static void createList(Section subCatPart) {
	        List list = new List(true, false, 10);
	        list.add(new ListItem("First point"));
	        list.add(new ListItem("Second point"));
	        list.add(new ListItem("Third point"));
	        subCatPart.add(list);
	    }

	    private static void addEmptyLine(Paragraph paragraph, int number) {
	        for (int i = 0; i < number; i++) {
	            paragraph.add(new Paragraph(" "));
	        }
	    }
	
}
