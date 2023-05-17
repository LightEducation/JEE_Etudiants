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
<title>Insert title here</title>
</head>
<body>
<div align="right">
	Bonjour <%=login %><br>
	<a href="Logout">Logout</a>
</div>
<h1>Ajouter un Etudiant</h1>
<form method="POST" action="Ajouter">
<table border="1">
	<tr>
		<td>Nom</td>
		<td><input type="text" name="nom" required></td>
	</tr>
	<tr>
		<td>Date inscription</td>
		<td><input type="date" name="date" required></td>
	</tr>
	<tr>
		<td>Sexe</td>
		<td>
			<input type="radio" name="sexe" value="Femme" checked> Femme
			<input type="radio" name="sexe" value="Homme"> Homme
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="Ajouter">
			<input type="reset" value="Retablir">
		</td>
	</tr>
</table>
</form>
</body>
</html>