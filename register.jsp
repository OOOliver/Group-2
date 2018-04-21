<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div>
		<h1>Welcome to Register</h1>
		<form action="RegisterServlet" method="post">
			<table>
				<tr>
					<td width="66" align="right"><font size="3">UserName</font></td>
					<td colspan="2"><input type="text" name="username"
						 style="width: 200; height: 25;" /></td>
				</tr>
				<tr>
					<td align="right"><font size="3">PassWord</font></td>
					<td colspan="2"><input type="password" name="password"
						style="width: 200; height: 25;" /></td>
				</tr>
				<tr>
					<td align="right"><font size="3">Confirm</font></td>
					<td colspan="2"><input type="password" name="confirm"
						style="width: 200; height: 25;" /></td>				</tr>
				<tr>
					<td colspan="3" align="center"><input type="submit" value="Register"
						style="width: 130; height: 30;" /></td>
				</tr>
			</table>
		</form>
		<font color="red" size="2"> ${msg }</font>  
	</div>
</body>
</html>