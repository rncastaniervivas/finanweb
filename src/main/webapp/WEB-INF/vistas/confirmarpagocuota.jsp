<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listar Cuotas</title>
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/xbootstrap.min.css" rel="stylesheet">
<link href="css/xheroic-features.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</head>
<body>
	
	<jsp:include page="header.jsp" /><br>

	<script>
		function PostForm() {
			if (IsValid()) {
				$("#lblErrorP").text("");
				document.forms["frmPrestamo"].submit();
			}
		}
		function IsValid() {
			HideDivMessageP();
			var field;
			field = $("#saldo").val();
			if (field.length == 0) {
				$("#lblErrorP")
						.text("Debe ingresar un valor para el prestamo.");
				ShowDivMessageP();
				return false;
			}
			return true;
		}
		function ShowDivMessageP() {
			scroll(0, 0);
			$("#divMessagesP").show("slow", function() {
			});
		}
		function HideDivMessageP() {
			$("#divMessagesP").hide();
		}
	</script>
		<script>
		function PostFormCheck() {
			if (IsValidCheck()) {
				$("#lblErrorPCheck").text("");
				document.forms["frmPrestamoCheck"].submit();
			}
		}
		function IsValidCheck() {
			HideDivMessagePCheck();
			if (!($(".check").is(":checked"))) {
				$("#lblErrorPCheck")
						.text("Debe seleccionar alguna cuota a pagar.");
				ShowDivMessagePCheck();
				return false;
			}
			return true;
		}
		function ShowDivMessagePCheck() {
			scroll(0, 0);
			$("#divMessagesPCheck").show("slow", function() {
			});
		}
		function HideDivMessagePCheck() {
			$("#divMessagesPCheck").hide();
		}
	</script>
	<div class="container">
		<ul class="list-group">
			<h3 class="list-group-item">Datos del Afiliado</h3>

			<div class="list-group-item">
				<span ><b>Nombre:</b> ${afiliado.nombre}</span>
			</div>

			<div class="list-group-item">
				<span ><b>Apellido:</b> ${afiliado.apellido}</span>
			</div>

			<div class="list-group-item">
				<span ><b>Dni:</b> ${afiliado.dni}</span>
			</div>
			<!-- div class="list-group-item">
				<span ><b>Valor Total del prestamo:</b> ${prestamo.valor}</span>
			</div-->
			<div class="list-group-item">
				<span ><b>Valor restante a pagar:</b> ${prestamo.saldo} $</span>
			</div>
		</ul>
	</div></br>
	
	<h1 class="text-center">LISTA DE CUOTAS</h1>
	
	<div class="container">
		<form:form role="form" action="pagarporvalor" method="Post"
			modelAttribute="prestamo" name="frmPrestamo">
			<div class="form-row">
			  
				<label class="form-group col-md-12">Ingrese el valor a pagar:</label>
				<div class="form-group col-md-2">
				<form:input path="idPrestamo" id="idPrestamo" type="text"
					class="form-control "
					style="display:none" />
				<form:input path="saldo" id="saldo" type="text" class="form-control" />
  			  </div>
  			  
  			  <div class="form-group col-md-4">
				<button onclick="PostForm(); return false;" type="submit"
					class="btn btn-success">Pagar amortizacion</button>
			  </div>
  			  
			</div>
			<div id="divMessagesP" style="display: none;">
				<p align="left">
				<div class="alert alert-danger" style="text-align: left;">
					<label id="lblErrorP"
						style="font-size: 12px; color: firebrick; font-weight: bold; margin-left: 5px;"></label>
				</div>
			</div>
			
		</form:form>
	</div>
	<form:form action="totalapagarcuota" modelAttribute="confirm"
		method="POST" role="form" name="frmPrestamoCheck">
		<div class="container">
			<table class="table">
				<thead class="thead-light">
					<tr>
						<th scope="col">Fecha de Vencimiento</th>
						<th scope="col">Valor</th>
						<th scope="col">Fecha De Pago</th>
						<th scope="col">Seleccionar Cuotas a Pagar</th>

					</tr>
				</thead>
				<!-- listar todos los afiados -->
				<tbody>
					<c:forEach items="${cuotaspagas}" var="cuotaspagas">
						<tr>

							<td scope="row">${cuotaspagas.fechaDeVencimiento}</td>
							<td>${cuotaspagas.monto}</td>
							<td>${cuotaspagas.fechaDePago}</td>
							<td>Pagada</td>

						</tr>
					</c:forEach>

					<c:forEach items="${cuotasnopagas}" var="cuotasnopagas">
						<tr>
							<td scope="row">${cuotasnopagas.fechaDeVencimiento}</td>
							<td>${cuotasnopagas.monto} $</td>
							<td>Sin Pagar</td>
							<td><input type="checkbox" id="check" class="check" name="check"
								value="${cuotasnopagas.idCuota}"></td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
			<div id="divMessagesPCheck" style="display: none;">
						<p align="left">
						<div class="alert alert-danger" style="text-align: left;">
							<label id="lblErrorPCheck"
								style="font-size: 12px; color: firebrick; font-weight: bold; margin-left: 5px;"></label>
						</div>
					</div>
		
			<input path="dni" type="text" id="dni" name="dni" class="form-control"
				value="${afiliado.dni}" style="display: none" />
			<input path="idPrestamo" type="text" id="idPrestamo" name="idPrestamo"
				class="form-control" value="${prestamo.idPrestamo}"
				style="display: none" />
	
			<button type="submit" class="btn btn-success mb-2" onclick="PostFormCheck(); return false;">Realizar
				Pago</button>
		</div>	
	</form:form>
	
	<div class="container">
		<br>
		<a href="javascript:window.history.go(-1);"><button
				class="btn btn-primary btn-lg" >Regresar</button></a>
		<br>
		<br>
		<!-- a href="/FinanWeb/home"><button class="btn btn-primary btn-lg"
				type="submit">Inicio</button></a>
		<br-->
	</div>
	
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="" type="text/javascript">
		$(document).ready(function(){
			$(".pagado").css("display","none");
		}
		</script>

</body>
</html>