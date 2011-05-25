<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
function reloadDatepickers(){
	$( "[name*='Date']" ).datepicker(
			{ dateFormat: 'dd/mm/yy',
			  monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
			  monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
			  dayNamesMin: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'],
			  changeYear: true,
			  changeMonth: true,
			  yearRange: 'c-100,c+00'
		    }
		);
}

$(document).ready(function() {
	var placePosition = ${placeSize - 1};
	$("#addPlaceButton").click(function() {
		placePosition++;
 
		$.get("<%=request.getContextPath()%>/itinerary/appendPlace", { fieldId: placePosition},
			function(data){
				$("#submitRow").before(data);
				reloadDatepickers();
		});
	});

	reloadDatepickers();
});
</script>

<div class="itinerary-form">
<form:form action="${pageContext.request.contextPath }/itinerary/add" method="post" modelAttribute="itineraryForm">
	<fieldset>
	<legend>Itinerario</legend>
	<form:hidden path="id" />
	
	<div class="itinerary-journey">
		<fieldset>
			<legend>Datos Principales del Viaje</legend>
		<ol>
			<!-- FECHA DE INICIO -->
			<li>
				<form:label for="beginningDate" path="beginningDate" cssErrorClass="error">Fecha en que salimos</form:label>
				<form:input path="beginningDate"/>
				<form:errors path="beginningDate" />
			</li>
		
			<!-- FECHA DE FIN -->
			<li>
				<form:label for="endDate" path="endDate" cssErrorClass="error">Fecha en que volvemos</form:label>
				<form:input path="endDate"/>
				<form:errors path="endDate" />
			</li>	
			
			<!-- DESCRIPCION -->
			<li>
				<form:label for="description" path="description" cssErrorClass="error">Descripción</form:label>
				<form:input path="description"/>
				<form:errors path="description" />
			</li>
			
			<!-- LUGARES -->
		
			<li><input type="button" id="addPlaceButton" value="Agregar otro destino"  /></li>
		
		</ol>
		</fieldset>
	</div>
	<br />
	
	<c:forEach var="i" begin="1" end="${placeSize }">
	
	<div class="itinerary-place">
	<fieldset>
		<legend> Destino #<c:out value="${i}" /></legend>
	
		<ol>
		<li>
			<form:label for="places" path="places[${i - 1}].province" cssErrorClass="error">Provincia</form:label>
			<spring:bind path="places[${i - 1}].province">
				<form:input path="${status.expression}" size="30"/>
	        <form:errors path="${status.expression }" />
			</spring:bind>
		</li>
		
		<li>
			<form:label for="places" path="places[${i - 1}].city" cssErrorClass="error">Ciudad</form:label>
			<spring:bind path="places[${i - 1}].city">
				<form:input path="${status.expression}" size="30"/>
			</spring:bind>
			<form:errors path="places[${i - 1}].city" />
		</li>
		
		<li>
			<form:label for="places" path="places[${i - 1}].neighbourhood" cssErrorClass="error">Localidad</form:label>
			<spring:bind path="places[${i - 1}].neighbourhood">
				<form:input path="${status.expression}" size="30"/>
			</spring:bind>
			<form:errors path="places[${i - 1}].neighbourhood" />
		</li>
		
		<li>
			<form:label for="places" path="places[${i - 1}].arrivalDate" cssErrorClass="error">Fecha de llegada</form:label>
			<spring:bind path="places[${i - 1}].arrivalDate">
				<form:input id="itinerary-arrival-date" path="${status.expression}" size="30"/>
			</spring:bind>
			<form:errors path="places[${i - 1}].arrivalDate" />
		</li>
	</fieldset>
	</div>
	</c:forEach>
	
	<div id="submitRow"><input type="submit" value="Guardar"/></div>
	
	
	</fieldset>
</form:form>
</div>
