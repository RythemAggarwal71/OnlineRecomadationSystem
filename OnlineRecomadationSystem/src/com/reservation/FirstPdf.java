package com.reservation;

import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

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


public class FirstPdf {
    private static String FILE = "C:/Users/sony/Desktop/FirstPdf.pdf";
    private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18,
            Font.BOLD);
    private static Font redFont = new Font(Font.FontFamily.TIMES_ROMAN, 12,
            Font.NORMAL, BaseColor.RED);
    private static Font subFont = new Font(Font.FontFamily.TIMES_ROMAN, 16,
            Font.BOLD);
    private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12,
            Font.BOLD);

    public static void main(String[] args) {
        try {
//            Document document = new Document();
//            PdfWriter.getInstance(document, new FileOutputStream(FILE));
//            document.open();
////            addMetaData(document);
////            addTitlePage(document);
//            addContent(document, 1);
//            document.close();
            int tid=2;
            mackeReciept(tid);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void mackeReciept(int tid) {
		// TODO Auto-generated method stub
try {

	Document document = new Document();
	document.open();
	PdfWriter.getInstance(document, new FileOutputStream("C:/Users/hp/Downloads/Reciept"+tid+".pdf"));
	document.open();

     FirstPdf.addMetaData(document);
//     addTitlePage(document);
     FirstPdf.addContent(document, tid);
   document.close();
} catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}

	}

	// iText allows to add metadata to the PDF which can be viewed in your Adobe
    // Reader
    // under File -> Properties
    public static void addMetaData(Document document) {
        document.addTitle("My first PDF");
        document.addSubject("Using iText");
        document.addKeywords("Java, PDF, iText");
        document.addAuthor("Lars Vogel");
        document.addCreator("Lars Vogel");
    }

    public static void addTitlePage(Document document)
            throws DocumentException {
        Paragraph preface = new Paragraph();
        // We add one empty line
        addEmptyLine(preface, 1);
        // Lets write a big header
        preface.add(new Paragraph("Title of the document", catFont));

        document.add(preface);
        // Start a new page

    }

    public static void addContent(Document document, int tid) throws DocumentException {
        Anchor anchor = new Anchor("Transaction Reciept", catFont);
        anchor.setName("First Chapter");

        // Second parameter is the number of the chapter
        Chapter catPart = new Chapter(new Paragraph(anchor), 1);

        Paragraph subPara = new Paragraph("table Showing details of transaction", subFont);
        Section subCatPart = catPart.addSection(subPara);
        Paragraph paragraph = new Paragraph();
        addEmptyLine(paragraph, 5);
        subCatPart.add(paragraph);

        // add a table
        createTable(subCatPart, tid);

        // now add all this to the document
        document.add(catPart);


    }
    public static void addContent(Document document) throws DocumentException {
        Anchor anchor = new Anchor("Transaction Reciept", catFont);
        anchor.setName("First Chapter");

        // Second parameter is the number of the chapter
        Chapter catPart = new Chapter(new Paragraph(anchor), 1);

        Paragraph subPara = new Paragraph("table Showing details of transaction", subFont);
        Section subCatPart = catPart.addSection(subPara);
        Paragraph paragraph = new Paragraph();
        addEmptyLine(paragraph, 5);
        subCatPart.add(paragraph);

        // add a table
        createTable(subCatPart);

        // now add all this to the document
        document.add(catPart);


    }

    public static void createTable(Section subCatPart)
            throws BadElementException {
        PdfPTable table = new PdfPTable(2);

        // t.setBorderColor(BaseColor.GRAY);
        // t.setPadding(4);
        // t.setSpacing(4);
        // t.setBorderWidth(1);

        PdfPCell c1 = new PdfPCell(new Phrase("Parameter"));
        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(c1);

        c1 = new PdfPCell(new Phrase("Values"));
        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(c1);

        table.addCell("1.0");
        table.addCell("1.1");
        table.addCell("1.2");
        table.addCell("2.1");


        subCatPart.add(table);

    }
    public static void createTable(Section subCatPart, int tid)
            throws BadElementException {
        PdfPTable table = new PdfPTable(2);

        // t.setBorderColor(BaseColor.GRAY);
        // t.setPadding(4);
        // t.setSpacing(4);
        // t.setBorderWidth(1);

        PdfPCell c1 = new PdfPCell(new Phrase("Parameter"));
        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(c1);

        c1 = new PdfPCell(new Phrase("Values"));
        c1.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(c1);

        String name="",address="",gender="",contact="",email="",from="",to="",bdate="",seat="",amount="",status="";
        
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

    public static void createList(Section subCatPart) {
        List list = new List(true, false, 10);
        list.add(new ListItem("First point"));
        list.add(new ListItem("Second point"));
        list.add(new ListItem("Third point"));
        subCatPart.add(list);
    }

    public static void addEmptyLine(Paragraph paragraph, int number) {
        for (int i = 0; i < number; i++) {
            paragraph.add(new Paragraph(" "));
        }
    }
}
