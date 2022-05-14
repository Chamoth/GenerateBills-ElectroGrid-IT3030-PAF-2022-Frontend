<%@ page import="com.Bill"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
crossorigin="anonymous">
<script src="Components/jquery-3.6.0.js" type="text/javascript"></script>
<script src="Components/bill.js" type="text/javascript"></script>
<title>Generate Bills</title>
</head>
<body>
<div class="container" >
<h1 >Generate Bills</h1>
<hr>
<div class="row">
<div class="col-3 frm">
<form id="formBill" name="formBill" action="">
Invoice Number: <input id="invoiceNo" name="invoiceNo" type="text"
class="form-control form-control-sm"> <br>

Account Number: <input id="accountNo" name="accountNo" type="text"
class="form-control form-control-sm"> <br>

User Name: <input id="userName" name="userName" type="text"
class="form-control form-control-sm"> <br>

Email: <input id="email" name="email" type="text"
class="form-control form-control-sm"> <br>

Mobile Number: <input id="mobileNo" name="mobileNo" type="text"
class="form-control form-control-sm"> <br>

Home Address: <input id="home" name="home" type="text"
class="form-control form-control-sm"> <br>

Date: <input id="date" name="date" type="date"
class="form-control form-control-sm"> <br>

Bill Amount: <input id="billAmount" name="billAmount" type="text"
class="form-control form-control-sm"> <br>

<input style="width: 50%;" id="btnSave" name="btnSave" type="button" value="Save"
class="btn btn-primary">

<input type="hidden" id="hidBillIDSave" name="hidBillIDSave" value="">
</form>
<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>
<br>
</div>
<div class="col-9" id="divBillsGrid">
<%
	Bill billObj = new Bill();
	out.print(billObj.readBills());
%>
</div>
</div>
</div>
</body>
</html>