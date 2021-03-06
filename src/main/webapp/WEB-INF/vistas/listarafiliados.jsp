<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<link href="css/bootstrap-theme.min.css" rel="stylesheet">
	    <link href="css/xbootstrap.min.css" rel="stylesheet">
    	<link href="css/xheroic-features.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Todos los afiliados</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="container"></br>
			<h1 class="text-center">Listado de todos los afiliados</h1></br>

			<div class="row">
				<div class="col-md-8">
					<form:form class="form-inline d-iniline" action="agregarafiliado">
						</br>
						<button class="btn btn-primary" type="submit">Nuevo afiliado</button>
					</form:form>
					
				</div>
				<div class="col-md-4">
					<form:form class="form" action="buscarafiliado" mothod="Post" modelAttribute="afiliado">
						<form:input type="text"  path="dni" id="dni" placeholder="DNI de afiliado" />
						<button type="submit" class="btn-success"><span class="glyphicon glyphicon-search"></span> Buscar afiliado</button>
					</form:form>
				</div>
			</div>
			
			</br>
			
			<table class="table">
			  <thead class="thead-light">
			    <tr>
			      <th scope="col">Id</th>
			      <th scope="col">Nombre</th>
			      <th scope="col">Apellido</th>
			      <th scope="col">Dni</th>
			      <th scope="col">Antiguedad</th>
			      <th scope="col">Sueldo</th>
			      <th schope="col">Opciones</th>
			      
			    </tr>
			  </thead>
			  <!-- listar todos los afiliados -->
			  <c:forEach items="${afiliados}" var="lista">
				  <tbody>
				    <tr>
				      <td scope="col">${lista.idAfiliado}</td>
				      <td scope="col">${lista.nombre}</td>
				      <td scope="col">${lista.apellido}</td>
				      <td scope="col">${lista.dni}</td>
				      <td scope="col">${lista.antiguedad}</td>
				      <td scope="col">${lista.sueldo}</td>
				      <td scope="row">
				      	<form:form action="eliminarafiliado" method="POST" modelAttribute="afiliado">
					      	<form:input path="idAfiliado" id="idAfiliado" type="hidden" value="${lista.idAfiliado}"/>
							<form:input path="nombre" id="nombre" readonly="readonly" type="hidden" value="${lista.nombre}" />
							<form:input path="apellido" id="apellido" readonly="readonly" type="hidden" value="${lista.apellido}" />
							<form:input path="dni" id="dni" readonly="readonly" type="hidden" value="${lista.dni}" />
							<form:input path="puesto" id="puesto" readonly="readonly" type="hidden" value="${lista.puesto}" />
							<form:input path="antiguedad" id="antiguedad" readonly="readonly" type="hidden" value="${lista.antiguedad}" />
							<form:input path="sueldo" id="sueldo" readonly="readonly" type="hidden" value="${lista.sueldo}" />
							
							<button class="btn btn-danger" type="submit"><span class="glyphicon glyphicon-remove"></span>Eliminar</button>
							<button class="btn btn-info" type="submit" formaction="modificarafiliado"><span class="glyphicon glyphicon-align-justify"></span>Modificar</button>
							<button class="btn btn-success" type="submit" formaction="nuevoprestamo">Nuevo Prestamo</button>
							<button class="btn btn-info" name="dni" formaction="misprestamos" value="${lista.dni}">Mis Prestamos</button>
						</form:form>
					  </td>
				    </tr>
				  </tbody>
			  </c:forEach>
			</table>
		</div>
		<br>
		
		<c:if test="${not empty error}">
	        <h4><span>${error}</span></h4>
	        <br>
        </c:if>
        	
		<div class="container"></br>
			<a href="javascript:window.history.go(-1);"><button class="btn btn-primary btn-lg">Regresar</button></a>
		</div>
		
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" ></script>
		<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>