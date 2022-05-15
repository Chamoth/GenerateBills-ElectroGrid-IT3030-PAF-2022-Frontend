/**
 * @author IT19976518_Ketipearachchi C. D.
 * @email it19976518@my.sliit.lk
 */

$(document).ready(function() {
	if ($("#alertSuccess").text().trim() == "") {
	$("#alertSuccess").hide();
	}
	$("#alertError").hide();
});





// SAVE ============================================
$(document).on("click", "#btnSave", function() {
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	// Form validation-------------------
	var status = validateBillForm();
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
	return;
	}
	// If valid------------------------
	$("#formBill").submit();
});





// UPDATE==========================================
$(document).on("click", ".btnUpdate", function() {
	$("#hidBillIDSave").val($(this).closest("tr").find('#hidBillIDUpdate').val());
	$("#invoiceNo").val($(this).closest("tr").find('td:eq(0)').text());
	$("#accountNo").val($(this).closest("tr").find('td:eq(1)').text());
	$("#userName").val($(this).closest("tr").find('td:eq(2)').text());
	$("#email").val($(this).closest("tr").find('td:eq(3)').text());
	$("#mobileNo").val($(this).closest("tr").find('td:eq(4)').text());
	$("#home").val($(this).closest("tr").find('td:eq(5)').text());
	$("#date").val($(this).closest("tr").find('td:eq(6)').text());
	$("#billAmount").val($(this).closest("tr").find('td:eq(7)').text());
});




// Delete============================================
$(document).on("click", ".btnRemove", function(event) {
	$.ajax({
		url : "BillsAPI",
		type : "DELETE",
		data : "id=" + $(this).data("id"),
		dataType : "text",
		complete : function(response, status) {
			onBillDeleteComplete(response.responseText, status);
		}
	});
});





// CLIENT-MODEL==============================================================
function validateBillForm() {
	// CODE
	if ($("#invoiceNo").val().trim() == "") {
		return "Please Insert Invoice Id";
	}
	// NAME
	if ($("#accountNo").val().trim() == "") {
		return "Please Insert Account Number";
	}

	if ($("#userName").val().trim() == "") {
		return "Please Insert the User Name";
	}

	if ($("#email").val().trim() == "") {
		return "Please Insert the Email";
	}

	if ($("#mobileNo").val().trim() == "") {
		return "Please Insert the Mobile Number";
	}

	if ($("#home").val().trim() == "") {
		return "Please Insert the Home Address";
	}

	if ($("#date").val().trim() == "") {
		return "Please Insert the Date";
	}

	if ($("#billAmount").val().trim() == "") {
		return "Please Insert the Bill Amount";
	}

	return true;
}



$(document).on("click", "#btnSave", function(event) {
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	// Form validation-------------------
	var status = validateBillForm();
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	// If valid------------------------
	var type = ($("#hidBillIDSave").val() == "") ? "POST" : "PUT";
	$.ajax({
		url: "BillsAPI",
		type: type,
		data: $("#formBill").serialize(),
		dataType: "text",
		complete: function(response, status) {
			onBillSaveComplete(response.responseText, status);
		}
	});
});




function onBillSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divBillsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
		$("#hidBillIDSave").val("");
	$("#formBill")[0].reset();
}





function onBillDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully Deleted.");
			$("#alertSuccess").show();
			$("#divBillsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}