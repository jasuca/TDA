<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="itinerary-place">
<fieldset>
	<legend>Destino #${placeNumber + 1 }</legend>
	
	<ol>
		<li><form:input path="itineraryPlace.places[${placeNumber }].province" size="30" />
			<form:label for="places" path="itineraryPlace.places[${placeNumber }].province" cssErrorClass="error">
			Provincia
			</form:label>
			<form:errors path="itineraryPlace.places[${placeNumber }].province" />
		</li>
		
		<li>
			<form:label for="places" path="itineraryPlace.places[${placeNumber }].city" cssErrorClass="error">
				Ciudad
			</form:label>
			<form:input path="itineraryPlace.places[${placeNumber }].city" size="30" />
			<form:errors path="itineraryPlace.places[${placeNumber }].city" />
		</li>
		
		<li>
			<form:label for="places" path="itineraryPlace.places[${placeNumber }].neighbourhood" cssErrorClass="error">
				Localidad
			</form:label>
			<form:input path="itineraryPlace.places[${placeNumber }].neighbourhood" size="30" />
			<form:errors path="itineraryPlace.places[${placeNumber }].neighbourhood" />
		</li>
		
		<li>
			<form:label for="places" path="itineraryPlace.places[${placeNumber }].arrivalDate" cssErrorClass="error">
				Fecha de llegada
			</form:label>
			<form:input path="itineraryPlace.places[${placeNumber }].arrivalDate" size="30" />
			<form:errors path="itineraryPlace.places[${placeNumber }].arrivalDate" />
		</li>
	</ol>
</fieldset>
</div>