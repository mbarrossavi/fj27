<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Cadastro de livros</title>
</head>

<body>

	<c:url value="/products" var="url" />
	
	
	
	<form:form action="${spring:mvcUrl('PC#save').build()}" method="post"
	 commandName="product" enctype="multipart/form-data">
	
		<div>
		 <label for="title">T�tulo</label>
		 <form:input path="title" id="title"/>
		 <form:errors path="title"/>
		</div>
		
		<div>		
			<label for="description">Descri��o</label>
			<form:textarea path="description" rows="10" cols="20" id="description"/>
			<form:errors path="description" />		
		</div>
		
		<div>
		
			<label for="numberOfPages">N�mero de p�ginas</label>
			<form:input path="numberOfPages" id="numberOfPages" />
			<form:errors path="numberOfPages" />
		
		</div>
		
		<div>
		
			<label for="releaseDate">Data de lan�amento</label>
			<form:input path="releaseDate" type="date" id="releaseDate"/>
			<form:errors path="releaseDate"/>
		
		</div>
		
		<div>
		
			<label for="summary">Sum�rio do livro</label>
			<input type="file" name="summary" id="summary"/>
			<form:errors path="summaryPath"/>
		
		</div>
		
		<div>
		
			<c:forEach items="${types}" var="bookType" varStatus="status" >			
				<div>
				
					<label for="price_${bookType}">${bookType}</label>
					<input type="text" name="prices[${status.index}].value" 
						id="price_${bookType}"/>
						
						<input type="hidden" name="prices[${status.index}].bookType" 
							value="${bookType}"/>
				
				</div>			
			</c:forEach>
		
		</div>
		
		
		
			<input type="submit" value="Enviar" />
		<div>
			
		</div>		
	
	</form:form>



</body>







</html>
