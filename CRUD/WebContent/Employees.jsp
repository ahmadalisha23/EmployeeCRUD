<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="emp.Employee" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Management System</title>
     <style>
     	
     	.header {
    		display: flex;
    		align-items: center;
    		justify-content: space-between;
   			padding: 20px;
    		background-color: #e5ffda; 
		}

		.logo {
    		width: 100px; 
    		height: auto; 
		}

		.title {
    		text-align: center;
    		flex-grow: 1; 
    		margin-right:170px;
    		margin-bottom:30px;
		}

		.title h2 {
    		margin: 0;
    		font-size: 24px; 
    		padding-bottom: 10px;
		}

		.title h3 {
    		margin: 0;
    		font-size: 18px; 
		}
     	
        body {
            background-image: url('crud1.jpg');
            background-size: cover; 
            background-repeat: no-repeat; 
            font-family: Arial, sans-serif;
        }
        label {
            font-weight: bold;
            font-size:large;
            display: inline-block;
            width: 120px; 
            text-align: right;
            margin-right: 30px;
            white-space: nowrap;
        }
        
        form {
            margin-bottom: 20px;
            text-align: center;
        }
        form input[type="text"] {
            width: 200px;
            margin-bottom: 10px;
        }
         button {
            padding: 10px 20px;
            cursor: pointer;
            background-color: #2986cc;
            color: white;
            border: none;
            border-radius: 5px;
            margin-right: 10px;
            text-align: center;
            font-weight: bold;
        }
        button:hover {
            background-color: #45a049;
        }
        
        table {
            border-collapse: collapse;
            width: 100%;
            table-layout: fixed;
            text-align: center;
            border: 3px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
            font-weight: bold;
            text-align: center;
            border: 2px solid black;
        }
        th{
        	font-size: large;
        	text-decoration: underline;
        	text-decoration-style: double;
        	text-underline-offset: 3px;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
           background-color: #45a049;
        }
    </style>
</head>
<body>
	<div class="header">
    <img src="ptcrud1.png" alt="Pennant Logo" class="logo" style="width:180px; height:150px">
    <div class="title">
        <h1>Pennant Technologies</h1>
        <h2>Employee Management System</h2>
    </div>
</div>
	<br><br>
	<form action="crudserve" method="post">
        <label for="Empid">Employee ID : </label> <input type="text" name="Empid"><br><br>
        <label for="Empname">Employee Name : </label> <input type="text" name="Empname"><br><br>
        <label for="job">Employee Job : </label> <input type="text" name="job"><br><br>
        <label for="Department">Department : </label> <input type="text" name="Department"><br><br>
        <label for="Sal">Employee Salary : </label> <input type="text" name="Sal"><br><br>
        <button type ="submit" name="action" value="add">Add</button>
        <button type ="submit" name="action" value="delete">Delete</button>
        <button type ="submit" name="action" value="update">Update</button>
        <br><br>
        <button id="nextButton" type="button">Next</button>
        <button type="button" id="prevbutton">Previous</button>
        <br><br>
    </form>

    <!-- Table to display employee records -->
    <table id="employeeTable" border="1">
        <tr>
            <th>Employee ID</th>
            <th>Employee Name</th>
            <th>Employee Job</th>
            <th>Department ID</th>
            <th>Employee Salary</th>
        </tr>
        <% 
            List<Employee> emp1 = (List<Employee>) request.getAttribute("ed");
            if (emp1 != null) {
                for (Employee emp2 : emp1) {
        %>
        <tr id="data">
            <td><%= emp2.getEmpid() %></td>
            <td><%= emp2.getEmp_name() %></td>
            <td><%= emp2.getJob() %></td>
            <td><%= emp2.getDept()%></td>
            <td><%= emp2.getSalary() %></td>
            
            
        </tr>
        <%
                }
            }
        %>
    </table>

<script>
var rowIndex=1;
var index = 1; 
var rows; 

document.addEventListener("DOMContentLoaded", function() {
    var table = document.getElementById("employeeTable");
    rows = table.getElementsByTagName("tr");

   
    function updateFormFields(row, rowIndex) {
        var cells = row.getElementsByTagName("td");
        document.getElementsByName("Empname")[0].value = cells[1].innerHTML;
        document.getElementsByName("Empid")[0].value = cells[0].innerHTML;
        document.getElementsByName("job")[0].value = cells[2].innerHTML;
        document.getElementsByName("Department")[0].value = cells[3].innerHTML;
        document.getElementsByName("Sal")[0].value = cells[4].innerHTML;
        index = rowIndex; 
    }

   
    for (var i = 1; i < rows.length; i++) {
        rows[i].addEventListener("click", function() {
            rowIndex = Array.prototype.indexOf.call(rows, this);
            updateFormFields(this, rowIndex); 
        });
    }

    
    function moveToNext() {
        if (rowIndex < rows.length - 1) {
        	rowIndex++;
            updateFormFields(rows[rowIndex], rowIndex);
        }
    }

    
    function moveToPrev() {
        if (rowIndex > 1) {
        	rowIndex--;
            updateFormFields(rows[rowIndex], rowIndex);
        }
    }

   
    document.getElementById("prevbutton").addEventListener("click", function() {
        moveToPrev();
        console.log('Moving back');
    });


    document.getElementById("nextButton").addEventListener("click", function() {
        moveToNext();
        console.log('Moving forward');
    });
});
   
    
</script>
    
</body>
</html>