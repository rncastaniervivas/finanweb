<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Ustede debe estas cuotas</h1>
<c:forEach items="${impagas}" var="impagas">

<h1>${impagas.monto}</h1>
</c:forEach>
<h1>se va a refinanciar en un monto de ${montoTotal} en ${cantidadCuotas} cuotas de ${nuevaCuota}</h1>

</body>
</html>