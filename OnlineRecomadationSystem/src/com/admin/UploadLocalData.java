package com.admin;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.connection.Dbconn;

import java.util.logging.Logger;
/**
 * Servlet implementation class UploadLocalData
 */
@WebServlet("/UploadLocalData")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 50, // 50MB
maxFileSize = 1024 * 2048 * 100, // 100 MB

maxRequestSize = 1024 * 2048 * 1000)
public class UploadLocalData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getAnonymousLogger();
	public String data;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadLocalData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	
	String getFileName(Part filePart) {

		String partHeader = filePart.getHeader("content-disposition");
		logger.info("Part Header = " + partHeader);

		for (String cd : partHeader.split(";")) {
			if (cd.trim().startsWith("filename")) {
				String fileName = cd.substring(cd.indexOf('=') + 1).trim()
						.replace("\"", "");
				return fileName.substring(fileName.lastIndexOf('/') + 1)
						.substring(fileName.lastIndexOf('\\') + 1);

			}

		}

		return null;

	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		System.out.println("Welcome");
		Part filePart = request.getPart("file");
		String username = (String) session.getAttribute("name");
		String fileName = getFileName(filePart);
		String transporttype = request.getParameter("txt_transport");

		String ContentType = filePart.getContentType();

		if (filePart != null) {
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());

			System.out.println("ContentType:-" + ContentType);
			if (filePart.getContentType().startsWith("image/")
					|| filePart.getContentType().startsWith("audio/")
					|| filePart.getContentType().startsWith("video/")
					|| filePart.getContentType().startsWith("application/")
					|| filePart.getContentType().startsWith(
							"application/vnd.ms-word")
					|| filePart.getContentType().startsWith(
							"application/vnd.ms-excel")
					|| filePart.getContentType().startsWith(
							"application/vnd.ms-powerpoint")
					|| filePart.getContentType().startsWith("application/pdf")
					|| filePart.getContentType().startsWith("text/")) {

				
				InputStream inputStream = filePart.getInputStream();
				BufferedReader br = null;
				StringBuilder sb = new StringBuilder();
				String cvsSplitBy = ",";
				String line;

				String[] country = null;
				int i = 0;
				br = new BufferedReader(new InputStreamReader(inputStream));
				while ((line = br.readLine()) != null) {
					i++;
					// use comma as separator
					country = line.split(cvsSplitBy);
							
					System.out.println("src===>"+country[0]);
					System.out.println("dest===>"+country[1]);
					System.out.println("point===>"+country[2]);
					System.out.println("routeno===>"+country[3]);
					System.out.println("dist===>"+country[4]);
					System.out.println("time===>"+country[5]);
					System.out.println("price===>"+country[6]);
					
					if(i>1)
					{
							try {
								Connection con;
								con = Dbconn.conn();
								String sql = "insert into localpmtroute(src,dest,points,routeno,distance,time,price) values(?,?,?,?,?,?,?)";
								PreparedStatement p = (PreparedStatement) con
										.prepareStatement(sql);

								int id = 0;
								p.setString(1, country[0]);// address
								p.setString(2, country[1]);// cat
								p.setString(3, country[2]);// lat
								p.setString(4, country[3]);// lng
								p.setString(5, country[4]);// loc
								p.setString(6, country[5]);// name
								p.setDouble(7,Double.parseDouble(country[6]));// numrating
								p.executeUpdate();
								

							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						
					}

				}

				br.close();

				PrintWriter out1 = null;
				response.setContentType("text/html;charset=UTF-8");
				out1 = response.getWriter();
				out1.println("<html><script>alert('File Uploaded Successfully.....');</script><body>");
				out1.println("");
				out1.println("</body></html>");
				RequestDispatcher rd = request.getRequestDispatcher("/UploadLocalRoute.jsp");

				rd.include(request, response);

				System.out.print("-----" + fileName);
				System.out.println("" + username);

			}

		}
	}

}
