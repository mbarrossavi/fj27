<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	
		<label>${success}</label>
	

	<table>

		<tr>

			<th>Título</th>
			<th>Valores</th>

		</tr>

		<c:forEach items="${products}" var="product" varStatus="status">
			<tr>
				<td>${product.title}</td>

				<td><c:forEach items="${product.prices}" var="price"
						varStatus="status">
						${price.bookType} - ${price.value}
						
						</c:forEach></td>

			</tr>
		</c:forEach>

	</table>

</body>
</html>