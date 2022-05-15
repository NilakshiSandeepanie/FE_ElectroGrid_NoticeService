
<%@ page import="java.sql.*" %>  


<%
try {
Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electrogrid","root",""); //create connection 

if(request.getParameter("btn_add")!=null) //check button click event not null
{
	int noticeId;
	String nmessage,duration,aparty,heading;
	
	noticeId=Integer.parseInt(request.getParameter("txt_noticeId"));
	nmessage=request.getParameter("txt_message"); //txt_name 
	duration=request.getParameter("txt_duration"); //txt_owner
	aparty=request.getParameter("txt_aparty"); //txt_name 
	heading=request.getParameter("txt_heading"); //txt_owner
	
	
	PreparedStatement pstmt=null;
	
	pstmt=con.prepareStatement("insert into notices(noticeId,nmessage,duration,aparty,heading)values(?,?,?,?,?)"); //sql insert query 
	pstmt.setInt(1,noticeId); 
	pstmt.setString(2,nmessage); 
	pstmt.setString(3,duration);
	pstmt.setString(4,aparty); 
	pstmt.setString(5,heading);
	pstmt.executeUpdate(); //execute query
	
	con.close();  //close connection 
	
	out.println("Insert Successfully...! Click Back link.");// after insert record successfully message
	
}	
}
catch(Exception e)
{
	out.println(e);
}

%>

<html>

	<head>
	
		<title>ELECTROGRID - ADD NOTICE SERVICE </title>
		
		
		<style type="text/css">
		
		body {
  		background-image: url(index.jpg);
		}
		.main
		{
			width:1000px;;
			margin-top: 80px;
			margin-bottom: 80px;
			margin-right: 80px;
			margin-left: 80px;
			padding: 10px;
			border: 5px solid blue;
			background-image: url("add.jpg");
		}
		.view a{
			 background-color: purple;
            border: none;
            text-decoration: none;
            color: white;
            padding: 20px 50px;
            margin: 5px 5px;
            cursor: pointer;
            font-size: 15px;
		}
		
		table { 
			font-family: arial, sans-serif;
			width: 750px; 
			border-collapse: collapse; 
			margin:50px auto;
		}
	
	
		tr:nth-of-type(odd) { 
			background: #5CB3FF; 
		}
	
		th { 
			background: #3498db; 
			color: white; 
			font-weight: bold; 
		}
	
		td, th { 
			padding: 10px; 
			border: 1px solid #ccc; 
			text-align: left; 
			font-size: 18px;
		}
		td a{
		
	  		color: blue;
	  		text-decoration: none;
		}
		
		a{
			text-decoration: none;
		}
		
		input[type=text] {
		  width: 100%;
		  padding: 12px 20px;
		  margin: 8px 0;
		  box-sizing: border-box;
		}
		 input[type = submit] {
            background-color: blue;
            border: none;
            text-decoration: none;
            color: white;
            padding: 20px 50px;
            margin: 5px 5px;
            cursor: pointer;
            font-size: 15px;
         }
		</style>
		
		<!-- javascript for form validation-->
		<script>
		
			function validate()
			{
				
				var nmessage = document.myform.txt_message;
				var duration = document.myform.txt_duration;
				var aparty = document.myform.txt_aparty;
				var heading = document.myform.txt_heading;
				
				
				if (nmessage.value == "")
				{
					window.alert("please enter message ?");
					nmessage.focus();
					return false;
				}
				if (duration.value == "")
				{
					window.alert("please enter duration ?");
					duration.focus();
					return false;
				}
				if (aparty.value == "")
				{
					window.alert("please enter a party ?");
					aparty.focus();
					return false;
				}
				if (heading.value == "")
				{
					window.alert("please enter heading ?");
					heading.focus();
					return false;
				}
			}
			
		</script>
		
	</head>
	
	<body>

		<div class="main">
		<center>
				<h1> ELECTROGRID - ADD NOTICE SERVICE </h1>	
			</center>

		<form method="post" name="myform"  onsubmit="return validate();">
	
			<center>
				<h1>Add New Notice</h1>
			</center>
		
			
			<table>	
				
				<tr>
					<td><b>NOTICE ID</b></td>
					<td><input type="text" name="txt_noticeId"></td>
				</tr>
				
				<tr>
					<td><b>MESSAGE</b></td>
					<td><input type="text" name="txt_message"></td>
				</tr>
				
				<tr>
					<td><b>DURATION</b></td>
					<td><input type="text" name="txt_duration"></td>
				</tr>
				
				<tr>
					<td><b>AUTHORISED PARTY</b></td>
					<td><input type="text" name="txt_aparty"></td>
				</tr>	
				
				<tr>
					<td><b>HEADING</b></td>
					<td><input type="text" name="txt_heading"></td>
				</tr>	
					
				
				
					<td><input type="submit" name="btn_add" value="Insert">
					</td>	
				
				
			</table>
			
				<div class="view">
			<center>
					<h1><a href="index.jsp">MOVE TO VIEW NOTICE SERVICES</a></h1>	
			</center>
		
		</div>
				
		</form>
		
		</div>
		
		
</body>

</html>
