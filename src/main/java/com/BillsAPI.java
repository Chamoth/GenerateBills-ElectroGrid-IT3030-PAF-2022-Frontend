package com;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;


/**
* Servlet implementation class EmployersAPI
*/
@WebServlet("/BillsAPI")
public class BillsAPI extends HttpServlet {
private static final long serialVersionUID = 1L;
Bill billObj = new Bill();




public BillsAPI() {
super();
}



// Convert request parameters to a Map
private static Map getParasMap(HttpServletRequest request)
{
Map<String, String> map = new HashMap<String, String>();
try
{
Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
String queryString = scanner.hasNext() ?
scanner.useDelimiter("\\A").next() : "";
scanner.close();
String[] params = queryString.split("&");
for (String param : params)
{String[] p = param.split("=");
map.put(p[0], p[1]);
}
}
catch (Exception e)
{
}
return map;
}


protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// TODO Auto-generated method stub
response.getWriter().append("Served at: ").append(request.getContextPath());
}



/**
* @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
*/
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String output = billObj.insertBill(
request.getParameter("invoiceNo"),
request.getParameter("accountNo"),
request.getParameter("userName"),
request.getParameter("email"),
request.getParameter("mobileNo"),
request.getParameter("home"),
request.getParameter("date"),
request.getParameter("billAmount"));
response.getWriter().write(output);
}



/**
* @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
*/
protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
Map paras = getParasMap(request);
String output = billObj.updateBill(paras.get("hidBillIDSave").toString(),
paras.get("invoiceNo").toString(),
paras.get("accountNo").toString(),
paras.get("userName").toString(),
paras.get("email").toString(),
paras.get("mobileNo").toString(),
paras.get("home").toString(),
paras.get("date").toString(),
paras.get("billAmount").toString());
response.getWriter().write(output);
}



/**
* @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
*/
protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
Map paras = getParasMap(request);
String output = billObj.deleteBill(paras.get("id").toString());
response.getWriter().write(output);
}



}
