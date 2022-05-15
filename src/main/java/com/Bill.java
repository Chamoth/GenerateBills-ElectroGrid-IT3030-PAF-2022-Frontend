package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * 
 * @author IT19976518_Ketipearachchi C. D.
 * @email it19976518@my.sliit.lk
 *
 */
public class Bill {
	
	/**
	 * This method is used to connect the database
	 * @return
	 */
	private Connection connect() {
		
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electrogrid_db?useSSL=false", "root", "990219");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}




	/**
	 * 
	 * This method is used to retrieve all bills
	 * @return
	 */
	public String readBills() {
		
		String output = "";
		
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for reading.";
			}
			// Prepare the html table to be displayed
			output = "<table class='table table-striped'><tr><th style=width:100px; >Invoice No</th>"
					+ "<th style=width:100px; >Account Number</th>"
					+ "<th style=width:100px; >User Name</th>"
					+ "<th style=width:100px; >Email</th>"
					+ "<th style=width:100px; >Mobile No</th>"
					+ "<th style=width:100px; >Home Address</th>"
					+ "<th style=width:100px; >Date</th>"
					+ "<th style=width:100px; >Bill Amount</th>"
					+ "<th style=width:50px; >Update</th>"
					+ "<th style=width:50px; >Remove</th></tr>";


			String query = "SELECT * FROM electrogrid_db.bills";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			// iterate through the rows in the result set
			while (rs.next()) {
				String id = Integer.toString(rs.getInt("id"));
				String invoiceNo = rs.getString("invoiceNo");
				String accountNo = rs.getString("accountNo");
				String userName = rs.getString("userName");
				String email = rs.getString("email");
				String mobileNo = rs.getString("mobileNo");
				String home = rs.getString("home");
				String date = rs.getString("date");
				String billAmount = rs.getString("billAmount");
				// Add into the html table
				output += "<tr><td><input id='hidBillIDUpdate'name='hidBillIDUpdate'type='hidden' value='" + id
						+ "'>" + invoiceNo + "</td>";
				output += "<td>" + accountNo + "</td>";
				output += "<td>" + userName + "</td>";
				output += "<td>" + email + "</td>";
				output += "<td>" + mobileNo + "</td>";
				output += "<td>" + home + "</td>";
				output += "<td>" + date + "</td>";
				output += "<td>" + billAmount + "</td>";
				// buttons
				output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary'>"
						+ "</td><td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-id='"+id+"'></td></tr>";
			}
			con.close();
			// Complete the html table
			output += "</table>";
		} catch (Exception e) {
			output = "Error while reading bills.";
			System.err.println(e.getMessage());
		}
		return output;
	}



	/**
	 * 
	 * This method is used to insert bills
	 * 
	 * @param invoiceNo
	 * @param accountNo
	 * @param userName
	 * @param email
	 * @param mobileNo
	 * @param home
	 * @param date
	 * @param billAmount
	 * @return
	 */
	public String insertBill(String invoiceNo, String accountNo, String userName, String email, String mobileNo, String home, String date, String billAmount) {

		String output = "";
		
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for inserting.";
			}
			// create a prepared statement
			String query = "insert into electrogrid_db.bills (id, invoiceNo, accountNo, userName, email, mobileNo, home, date, billAmount) values (?,?,?,?,?,?,?,?,?)";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, invoiceNo);
			preparedStmt.setString(3, accountNo);
			preparedStmt.setString(4, userName);
			preparedStmt.setString(5, email);
			preparedStmt.setString(6, mobileNo);
			preparedStmt.setString(7, home);
			preparedStmt.setString(8, date);
			preparedStmt.setString(9, billAmount);
			// execute the statement
			preparedStmt.execute();
			con.close();
			String newBills = readBills();
			output = "{\"status\":\"success\", \"data\": \"" +
					newBills + "\"}";
		}
		catch (Exception e) {
			output = "status:error ,data:Error while inserting bill.";
			System.err.println(e.getMessage());
		}
		return output;
	}



	/**
	 * 
	 * This method is used to update bills
	 * 
	 * @param id
	 * @param invoiceNo
	 * @param accountNo
	 * @param userName
	 * @param email
	 * @param mobileNo
	 * @param home
	 * @param date
	 * @param billAmount
	 * @return
	 */
	public String updateBill(String id, String invoiceNo, String accountNo, String userName, String email, String mobileNo, String home, String date, String billAmount) {

		String output = "";

		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for updating.";
			}
			// create a prepared statement
			String query = "UPDATE electrogrid_db.bills SET invoiceNo=?, accountNo=?, userName=?, email=?, mobileNo=?, home=?, date=?, billAmount=? WHERE id =?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setString(1, invoiceNo);
			preparedStmt.setString(2, accountNo);
			preparedStmt.setString(3, userName);
			preparedStmt.setString(4, email);
			preparedStmt.setString(5, mobileNo);
			preparedStmt.setString(6, home);
			preparedStmt.setString(7, date);
			preparedStmt.setString(8, billAmount);
			preparedStmt.setInt(9, Integer.parseInt(id));
			// execute the statement
			preparedStmt.execute();
			con.close();
			String newBills = readBills();
			output = "{\"status\":\"success\", \"data\": \"" +
					newBills + "\"}";
		}
		catch (Exception e) {
			output = "status:error data Error while updating the bill.";
			System.err.println(e.getMessage());
		}
		return output;
	}





	/**
	 * 
	 * This method is used to delete bills
	 * 
	 * @param id
	 * @return
	 */
	public String deleteBill(String id) {

		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for deleting.";
			}
			// create a prepared statement
			String query = "DELETE FROM electrogrid_db.bills WHERE id =?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, Integer.parseInt(id));
			// execute the statement
			preparedStmt.execute();
			con.close();
			String newBills = readBills();
			output = "{\"status\":\"success\", \"data\": \"" +
					newBills + "\"}";
		}
		catch (Exception e) {
			output = "status:error data :Error while deleting bill.";
			System.err.println(e.getMessage());
		}
		return output;
	}
}
