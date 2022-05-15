<%-- @author IT19976518_Ketipearachchi C. D. 
	@email it19976518@my.sliit.lk --%>

<%@ page import="com.Bill"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
		rel="stylesheet" 
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
		crossorigin="anonymous">
	<script src="Components/jquery-3.6.0.js" type="text/javascript"></script>
	<script src="Components/bill.js" type="text/javascript"></script>

	<style type="text/css">
		
		/* #divEmployersGrid{   
			padding-top:20px; 
			padding-left: 50px; 
			background-color:#b2b9d1;
		}
		
		.frm{ 
			padding-top:20px; 
			padding-right: 50px; 
			background-color:#a1abc9; 
			border-right: 1px solid grey; 
		} */
		
		.page-component-body{ 
		    min-height: 700px;
		    font-family: "Titillium Web", sans-serif;
		    font-weight: 500;
		} 
		
		.input-main-form-bill { 
		    width: 700px;
		    margin-top: 70px;
		    margin-left: 100px; 
		    position: relative;
		    border-radius: 0.5rem;
		    box-shadow: 0px 0px 10px 2px rgba(0, 0, 0, 0.2),
		    0px 0px 10px 0px rgba(0, 0, 0, 0.19); 
		}
		
		.tab-content-bill {
		    background-color: rgba(255, 255, 255, 0.845);
		} 
		
		.form-group-input{
		    padding: 10px;
		    width: 300px;
		}
		
		.form-group-input-long{
		    padding: 10px;
		    width: 600px;
		}
		
		.center {
			padding-left: 225px;
		}
		
		.alert{
			width: 50%;
		}
		
		
	</style>
	
	
	<title>Generate Bills</title>
	
</head>
<body>
<div class="container" >
	<br>
	<h1 >Generate Bills</h1>
	<hr>
	<div class="row">
	<div class="page-component-body">
            <div class="container input-main-form-bill">
                <div class="tab-content-bill" id="myTabContent">
                    <div class="container1">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
                                <h3 class="text-left mt-4 mb-4">Generate a New Invoice</h3>
                            </div>
                        </div>
                      <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<!-- <div class="col-3 frm"> -->
					<form id="formBill" name="formBill" action="">
						Invoice Number: 
						<input id="invoiceNo" name="invoiceNo" type="text" class="form-control form-control-sm"> <br>
		
						Account Number: 
						<input id="accountNo" name="accountNo" type="text" class="form-control form-control-sm"> <br>
		
						User Name: 
						<input id="userName" name="userName" type="text" class="form-control form-control-sm"> <br>
		
						Email: 
						<input id="email" name="email" type="text" class="form-control form-control-sm"> <br>
		
						Mobile Number: 
						<input id="mobileNo" name="mobileNo" type="text" class="form-control form-control-sm"> <br>
		
						Home Address: 
						<input id="home" name="home" type="text" class="form-control form-control-sm"> <br>
		
						Date: 
						<input id="date" name="date" type="date" class="form-control form-control-sm"> <br>
		
						Bill Amount: 
						<input id="billAmount" name="billAmount" type="text" class="form-control form-control-sm"> <br><br>		
		
						<div class="center">
						<input style="width: 50%;" id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
						</div>
						
						<input type="hidden" id="hidBillIDSave" name="hidBillIDSave" value="">
					</form>
						<br><br>
					</div><br>
					</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<br>
		<div class="alert">
			<div id="alertSuccess" class="alert alert-success"></div>
			<div id="alertError" class="alert alert-danger"></div>
		</div>
		
		<div class="col-12" id="divBillsGrid">
			<%
				Bill billObj = new Bill();
				out.print(billObj.readBills());
			%>
		</div>
	</div><br><br>
</body>
</html>