<%@ page import="java.sql.*" %>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electrogrid","root",""); // create connection 
	
	if(request.getParameter("btn_update")!=null) //check button click event not null
	{
		int noticeId; 
		
		String nmessage,duration,aparty,heading;
		
		noticeId=Integer.parseInt(request.getParameter("txt_noticeId"));
		nmessage=request.getParameter("txt_message"); //txt_name 
		duration=request.getParameter("txt_duration"); //txt_owner
		aparty=request.getParameter("txt_aparty"); //txt_name 
		heading=request.getParameter("txt_heading"); //txt_owner
		
		PreparedStatement pstmt=null; //create statement  
		
		pstmt=con.prepareStatement("update notices set nmessage=?,duration=?,aparty=?,heading=? where noticeId=?"); //sql update query 
		pstmt.setString(1,nmessage); 
		pstmt.setString(2,duration);
		pstmt.setString(3,aparty); 
		pstmt.setString(4,heading);
		pstmt.setInt(5,noticeId);
		pstmt.executeUpdate(); //execute query
		
		con.close(); //connection close

		out.println("Update Successfully...! Click Back link."); //after update record successfully message
	}	
	
}
catch(Exception e)
{
	out.println(e);
}

%>

<html>

	<head>
	
		<title>ELECTROGRID - UPDATE NOTICE SERVICE  </title>
		
	
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
			background-image: url("update.jpeg");
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
			background: #98FF98; 
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
            background-color: green;
            border: none;
            text-decoration: none;
            color: white;
            padding: 20px 50px;
            margin: 5px 5px;
            cursor: pointer;
            font-size: 15px;
         }

		</style>	
		
		
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
				<h1> ELECTROGRID - UPDATE NOTICE SERVICE </h1>	
			</center>
			
	<form method="post" name="myform"  onsubmit="return validate();">
	
		<center>
			<h1>Update Notice</h1>
		</center>
		
		<table>	
		   <%
		try
		{
			Class.forName("com.mysql.jdbc.Driver"); //load driver  
		
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electrogrid","root",""); // create connection  
	
			if(request.getParameter("edit")!=null) 
			{
				int noticeId=Integer.parseInt(request.getParameter("edit"));
		
				String nmessage,duration,aparty,heading;
		
				PreparedStatement pstmt=null; // create statement
				
				pstmt=con.prepareStatement("select * from notices where noticeId=?"); // sql select query
				pstmt.setInt(1,noticeId);
				ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
				
				while(rs.next()) 
				{
					noticeId=rs.getInt(1);
					nmessage=rs.getString(2);
					duration=rs.getString(3);
					aparty=rs.getString(4);
					heading=rs.getString(5);
			%>
			
			<tr>
				<td><b>NOTICE ID</b></td>
				<td><input type="text" name="txt_noticeId" value="<%=noticeId%>"></td>
			</tr>
			
			<tr>
				<td><b>MESSAGE</b></td>
				<td><input type="text" name="txt_message" value="<%=nmessage%>"></td>
			</tr>
			
			<tr>
				<td><b>DURATION</b></td>
				<td><input type="text" name="txt_duration" value="<%=duration%>"></td>
			</tr>
			
			<tr>
				<td><b>AUTHORISED PARTY</b></td>
				<td><input type="text" name="txt_aparty" value="<%=aparty%>"></td>
			</tr>	
			
			<tr>
				<td><b>HEADING</b></td>
				<td><input type="text" name="txt_heading" value="<%=heading%>"></td>
			</tr>	
			
		
				<td><input type="submit" name="btn_update" value="Update"></td>	
			
				
				
		<%
				}
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		%>	
		</table>
		
		<div class="view">
			<center>
					<h1><a href="index.jsp"> MOVE TO VIEW NOTICE SERVICES </a></h1>	
			</center>
		
		</div>
		
	</form>

	</div>
	
	

</body>

</html>