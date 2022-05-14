<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
//String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "electrogrid";
String userId = "root";
String password = "";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null; 
Statement statement = null;
ResultSet resultSet = null;
%>
<h1 align="center"><font><strong>ELECTROGRID - NOTICE SERVICE</strong></font></h1>
<h2 align="center"><font><strong> NOTICE DETAILS</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

  //table layout
</tr>
<tr bgcolor="#A52A2A">
<td><b>Notice Id</b></td>
<td><b>Reason</b></td>
<td><b>Duration</b></td>
<td><b>Authorized Party</b></td>
<td><b>Heading</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM notices";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("noticeId") %></td>
<td><%=resultSet.getString("nmessage") %></td>
<td><%=resultSet.getString("duration") %></td>
<td><%=resultSet.getString("aparty") %></td>
<td><%=resultSet.getString("heading") %></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
