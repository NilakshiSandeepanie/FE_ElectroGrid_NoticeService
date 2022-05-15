<%@page import="java.sql.*" %>

<%
try
{	
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electrogrid","root","");  //create connection 

	if(request.getParameter("delete")!=null)
	{
		int noticeId=Integer.parseInt(request.getParameter("delete"));
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("delete from notices where noticeId=? "); //sql delete query
		pstmt.setInt(1,noticeId);
		
		pstmt.executeUpdate(); //execute query
		
		con.close(); //close connection
	}
}
catch(Exception e)
{
	out.println(e);
}
%>	
<html>

	<head>
	
		<title>ELECTROGRID - NOTICE SERVICE</title>
		
		
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
			border: 5px solid #1F456E;
			background-image: url("notice.png");
		}
		.add a{
			 background-color: #1F456E;
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
			background: #00CED1; 
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

		</style>
		
		
	</head>	
	
<body>
		<div class="main">
			<center>
				<h1> ELECTROGRID - NOTICE SERVICE <br/>
				View Notice Details</h1>	
			</center>
		
		<div class="add">
			<center>
				<h1><a href="noticeadd.jsp">+ Add New Notice</a></h1>	
			</center>
		
		</div>
		
		<table>
		
			<tr>
				<th>NOTICE ID</th>
				<th>MESSAGE</th>
				<th>DURATION</th>
				<th>AUTHORISED PARTY</th>
				<th>HEADING</th>
				<th>ACTION</th>
			</tr>
		<%
		
		try
		{	
			Class.forName("com.mysql.jdbc.Driver");  //load driver 
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/electrogrid","root","");  //creat connection 

			PreparedStatement pstmt=null; //create statement
		
			pstmt=con.prepareStatement("select * from notices"); //sql select query  
			
			ResultSet rs=pstmt.executeQuery(); //execute query and set in resultset object rs.  
		
			while(rs.next())
			{	
		%>
				<tr>
					<td><%=rs.getInt(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					
					<td><a href="noticeupdate.jsp?edit=<%=rs.getInt(1)%> ">Edit</a>
					<br/>
					<a href="?delete=<%=rs.getInt(1)%> ">Delete</a></td>
					
				</tr>
		<%
			}
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		%>
		
		</table>
		
		</div>
		
		
		
</body>

</html>
