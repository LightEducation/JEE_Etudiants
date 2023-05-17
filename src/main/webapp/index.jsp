<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%
String login = "";
 if(session.getAttribute("login")!=null){
	 login = session.getAttribute("login").toString();
 }else{
	 response.sendRedirect("auth.jsp");
 }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<body>
<div align="right">
	Bonjour <%=login %><br>
	<a href="Logout">Logout</a>
</div>
<h1>Liste des Etudiants</h1>
<table border="1" width="100%">
	<tr>
		<th>ID</th>
		<th>Nom</th>
		<th>Date Inscription</th>
		<th>Sexe</th>
		<th>Action</th>
	</tr>
	<%
	String url  = "jdbc:mysql://localhost:3306/JEE_Etudiant";
	String user = "root";
	String pwd  = "untm";
	int number = 0;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, pwd);
		PreparedStatement pst=con.prepareStatement("SELECT * FROM etudiant");
		ResultSet rs = pst.executeQuery();
		while(rs.next()){
			%>
			
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><a href="Delete?id=<%=rs.getString(1) %>">Supprimer</a></td>
			</tr>
			
			
			<%
		}
		pst=con.prepareStatement("SELECT COUNT(*) FROM etudiant");
		rs = pst.executeQuery();
		rs.next();
		number = rs.getInt(1);
		rs.close();
		pst.close();
		con.close();
	}catch(Exception e) {
		System.out.print(e);
	}
	%>
</table>
Nomber des etudiants : <%=number %><br>
<a href="ajouter.jsp">Ajouter un etudiant</a>
</body>
</html>