<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib tagdir="/WEB-INF/tags" prefix="cdc" %>

<cdc:page title="Listagem de produtos">

	<sec:authorize access="isAuthenticated()">
	
		<sec:authentication property="principal" var="user"/>
		<div>
	
			Olá ${user.name}
	
		</div>
	
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	
		<c:url value="/products/form" var="formLink" />
		
		<a href="${formLink}">
			Cadastrar novo produto
		</a>
			
	</sec:authorize>
	
	
		<label>${success}</label>
	

	<table>

		<tr>

			<th>Título</th>
			<th>Valores</th>
			<th>Detalhes</th>

		</tr>

		<c:forEach items="${products}" var="product" varStatus="status">
			<tr>
				<td>${product.title}</td>

				<td><c:forEach items="${product.prices}" var="price"
						varStatus="status">
						${price.bookType} - ${price.value}
						
						</c:forEach></td>
						
				<td>
				
					<c:url value="/products/${product.id}" var="linkDetalhar"/>
					<a href="${linkDetalhar}">Detalhar</a>
				
				</td>

			</tr>
		</c:forEach>

	</table>

</cdc:page>



	
