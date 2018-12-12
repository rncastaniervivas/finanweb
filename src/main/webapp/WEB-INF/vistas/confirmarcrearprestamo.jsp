<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Nuevo Prestamo</title>

	<!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" >
    <!-- Bootstrap theme -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
</head>
<body>
	
	<div class="container">
		<form:form action="confirmar-nuevo-prestamo" method="POST" modelAttribute="afiliado">
		  <form:input type="hidden" path="dni" value="${afiliado.dni}"/>
		  <div class="form-row">
		    <div class="form-group col-md-6">
		      <label >Nombre</label>
		      <input type="text" class="form-control" value="${afiliado.nombre}" id="inputNombre" disabled>
		    </div>
		    <div class="form-group col-md-6">
		      <label >Apellido</label>
		      <input type="text" class="form-control" value="${afiliado.apellido}" id="inputApellido" disabled>
		    </div>
		    <div class="form-group col-md-4"></div>
		    <div class="form-group col-md-4"></div>
		    <div class="form-group col-md-6">
		    	<label class="col-lg-2 control-label">Cuotas</label>
				<div class="col-lg-10">
					<select name="cuotas" id="cuotas" class="form-control">
						<option value="${cuotas}">${cuotas}</option>
					</select>
				</div>
		    </div>
		    <div class="form-group col-md-6">
		      <label >Nuevo Monto</label>
		      <input name="valor" type="text" class="form-control" id="inputMonto" value="${valor}">
		    </div>
		     <div class="form-group col-md-6"></div>
		     <div class="form-group col-md-6"></div>
		     <div class="form-group col-md-6">
		    	<label class="col-lg-2 control-label">Financieras</label>
				<div class="col-lg-10">
					<select name="nombreF" id="nombreF" class="form-control">
						<option value="${nombreF}">${nombreF}</option>						
					</select>
				</div>
			    </div>
		    
		    
		    <div class="form-group col-md-10">
			    <c:if test="${not empty error}">
			        <h4><span>${error}</span></h4>
			        <br>
		        </c:if>
		    </div>
			    
			   
		    <div class="form-group col-md-4">
		    	<button class="btn btn-info" type="submit">Dar Prestamo</button>
			</div>
		  </div>
		</form:form>
	</div>
	
	<div class="container">
		<h1 class="text-center">Lista de pr�stamos existentes</h1>
		<table class="table">
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">Valor</th>
		      <th scope="col">Cuotas</th>
		      <th scope="col">Intereses</th>
		      <th scope="col">Estado</th>
		      
		    </tr>
		  </thead>
		  <!-- listar todos los afiados -->
		  <c:forEach items="${prestamos}" var="prestamos">
			  <tbody>
			    <tr>
			      <th scope="row">${prestamos.valor}</th>
			      <td>${prestamos.cuotas}</td>
			      <td>${prestamos.interes}</td>
			      <td>${prestamos.estado}</td>
			    </tr>
			  </tbody>
		  </c:forEach>
		</table>
	</div>
	
		<br>
		<a href="javascript:window.history.go(-1);"><button class="btn btn-primary btn-lg">Regresar</button></a>
		<br>
		<br>
		<a href="/FinanWeb/home"><button class="btn btn-primary btn-lg" type ="submit">Inicio</button></a>
		<br>
	
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" ></script>
	<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>

</body>
</html>