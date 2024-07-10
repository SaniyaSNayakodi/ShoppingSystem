<%@page import="com.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add or Change Address</title>
</head>
<body>
	<%
	String msg = request.getParameter("msg");
	if ("valid".equals(msg)) {
	%>
	<h3 class="alert">Address Successfully Updated !</h3>
	<%
	}
	%>
	<%
	if ("invalid".equals(msg)) {
	%>
	<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
	<%
	}
	%>
	<%
	try {
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select *from users where email='" + email + "'");
		while (rs.next()) {
	%>
	<form action="addChangeAddressAction.jsp" method="post">
		<h3>Enter Address</h3>
		<input class="input-style" type="text" name="address"
			placeholder="Enter Address" value="<%=rs.getString(7)%>">
		<hr>
		<h3>Enter city</h3>
		<input class="input-style" type="text" name="city"
			placeholder="Enter City" value="<%=rs.getString(8)%>">

		<hr>
		<h3>Enter State</h3>
		<input class="input-style" type="text" name="state"
			placeholder="Enter State" value="<%=rs.getString(9)%>">

		<hr>
		<h3>Enter country</h3>
		<input class="input-style" type="text" name="country"
			placeholder="Enter Country" value="<%=rs.getString(10)%>">

		<hr>
		<button class="button" type="submit">
			Save <i class='far fa-arrow-alt-circle-right'></i>
		</button>
	</form>
	<%
	}
	} catch (Exception e) {
	System.out.println(e);
	}
	%>

</body>
<br>
<br>
<br>
</html>