<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
<!--
	$(document).ready(function(){
		$("#form-tabs").tabs();
	});
//-->
</script>

<!-- aux variables -->
<c:set var="count" value="0" />

<c:choose>
	<c:when test="${dentistForm.new}"><c:set var="method" value="post"/></c:when>
	<c:otherwise><c:set var="method" value="put"/></c:otherwise>
</c:choose>

<h2><c:if test="${dentistForm.new}"><fmt:message key="dentist.form.new" /></c:if><fmt:message key="dentist.form.form" /></h2>

<b><fmt:message key="dentist.form.patient" /></b> ${dentistForm.patient.firstName} ${dentistForm.patient.lastName}
<br/>

<form:form modelAttribute="dentistForm" method="post">
	<div id="form-tabs">
		<ul>
			<li><a href="#tab-history"><fmt:message key="dentist.form.history" /></a></li>
			<li><a href="#tab-odontogram"><fmt:message key="dentist.form.odontogram" /></a></li>
			<li><a href="#tab-inspection"><fmt:message key="dentist.form.inspection" /></a></li>
		</ul>
		
	<div id="tab-history" class="dentistform">
		<table>
		
			<tr><th>
				<form:label for="receivedAttentionInTrain" path="receivedAttentionInTrain" cssErrorClass="error">
					<fmt:message key="dentist.form.receivedAttentionInTrain" />
				</form:label></th>
				<td><form:checkbox path="receivedAttentionInTrain" /> <form:errors path="receivedAttentionInTrain" />
			</td></tr>
			
			<tr><th>
				<form:label for="receivedAttentionOutsideTrain" path="receivedAttentionInTrain" cssErrorClass="error">
					<fmt:message key="dentist.form.receivedAttentionOutsideTrain" />
				</form:label></th>
				<td><form:checkbox path="receivedAttentionOutsideTrain" /> <form:errors path="receivedAttentionOutsideTrain" />
			</td></tr>
			
			<tr><th>
				<form:label for="receivedAnesthesia" path="receivedAnesthesia" cssErrorClass="error">
					<fmt:message key="dentist.form.receivedAnesthesia" />
				</form:label></th>
				<td><form:checkbox path="receivedAnesthesia" /> <form:errors path="receivedAnesthesia" />
			</td></tr>
			
			<tr><th>
				<form:label for="haemorrhage" path="haemorrhage" cssErrorClass="error">
					<fmt:message key="dentist.form.haemorrhage" />
				</form:label></th>
				<td><form:checkbox path="haemorrhage" /> <form:errors path="haemorrhage" />
			</td></tr>
			
			<tr><th>
				<form:label for="medicineAllergic" path="medicineAllergic" cssErrorClass="error">
					<fmt:message key="dentist.form.medicineAllergic" />
				</form:label></th>
				<td><form:checkbox path="medicineAllergic" /> <form:errors path="medicineAllergic" />
			</td></tr>
			
			<tr><th>
				<form:label for="yodoAllergic" path="yodoAllergic" cssErrorClass="error">
					<fmt:message key="dentist.form.yodoAllergic" />
				</form:label></th>
				<td><form:checkbox path="yodoAllergic" /> <form:errors path="yodoAllergic" />
			</td></tr>
			
			<tr>
				<th><form:label for="comment" path="comment" cssErrorClass="error"><fmt:message key="dentist.form.comment" /></form:label></th> 
				<td><form:textarea path="comment" /> <form:errors path="comment" /></td></tr>
		</table>
	</div>
	
	<div id="tab-odontogram" class="dentistform">
		<table>
			<tr>
				<th>
					<form:label for="cpod" path="cpod" cssErrorClass="error">
						<fmt:message key="dentist.form.cpod" />
					</form:label>
				</th>
				<td>
					<form:input path="cpod" />
				</td>
			</tr>
			<tr>
				<td>
					<form:errors path="cpod" />
				</td>
			</tr>
			
			<tr>
				<th>
					<form:label for="cpos" path="cpos" cssErrorClass="error">
						<fmt:message key="dentist.form.cpos" />
					</form:label>
				</th>
				<td>
					<form:input path="cpos" />
				</td>
			</tr>
			<tr>
				<td>
					<form:errors path="cpos" />
				</td>
			</tr>
			
			<tr>
				<th>
					<form:label for="ceod" path="ceod" cssErrorClass="error">
						<fmt:message key="dentist.form.ceod" />
					</form:label>
				</th>
				<td>
					<form:input path="ceod" />
				</td>
			</tr>
			<tr>
				<td>
					<form:errors path="ceod" />
				</td>
			</tr>
			
			<tr>
				<th>
					<form:label for="ceos" path="ceos" cssErrorClass="error">
						<fmt:message key="dentist.form.ceos" />
					</form:label>
				</th>
				<td>
					<form:input path="ceos" />
				</td>
			</tr>
			<tr>
				<td>
					<form:errors path="ceos" />
				</td>
			</tr>
		</table>
	</div>
	
	<div id="tab-inspection" class="dentistform">
		<table>
			<tr>
				<th>
					<form:label for="stains" path="stains" cssErrorClass="error">
						<fmt:message key="dentist.form.stains" />
					</form:label>
				</th>
				<td>
					<form:textarea path="stains" />
				</td>
			</tr>
			<tr>
				<td>
					<form:errors path="stains" />
				</td>
			</tr>
			
			<tr><th>
				<form:label for="cleftPalate" path="cleftPalate" cssErrorClass="error">
					<fmt:message key="dentist.form.cleftPalate" />
				</form:label></th>
				<td><form:checkbox path="cleftPalate" /> <form:errors path="cleftPalate" />
			</td></tr>
			
			<tr><th>
				<form:label for="cleftLip" path="cleftLip" cssErrorClass="error">
					<fmt:message key="dentist.form.cleftLip" />
				</form:label></th>
				<td><form:checkbox path="cleftLip" /> <form:errors path="cleftLip" />
			</td></tr>
			
			<tr>
				<th><form:label for="cleftComments" path="cleftComments" cssErrorClass="error"><fmt:message key="dentist.form.cleftComments" /></form:label></th> 
				<td><form:textarea path="cleftComments" /> <form:errors path="cleftComments" /></td></tr>
				
			<tr><th colspan="2">
					<form:label for="gumDisease" path="gumDisease" cssErrorClass="error">
						<fmt:message key="dentist.form.gumDisease" />
					</form:label></th></tr>
					
					<c:set var="count" value="0" />
					<c:forEach var="gumDisease" items="${gumDisease}">
						<c:if test="${count%2 == 0 }"><tr></c:if>
							<td><form:radiobutton path="gumDisease" value="${gumDisease}" /> ${gumDisease.description}</td>
						<c:if test="${count%2 == 1 }"></tr></c:if>
					    <c:set var="count" value="${count+1}" />
					</c:forEach>
					<c:if test="${count%2 == 1 }"></tr></c:if>
					<tr><td><form:errors path="gumDisease" /></td>
			</tr>
			
			<tr><th colspan="2">
					<form:label for="periodontalDisease" path="periodontalDisease" cssErrorClass="error">
						<fmt:message key="dentist.form.periodontalDisease" />
					</form:label></th></tr>
					
					<c:set var="count" value="0" />
					<c:forEach var="periodontalDisease" items="${periodontalDisease}">
						<c:if test="${count%2 == 0 }"><tr></c:if>
							<td><form:radiobutton path="periodontalDisease" value="${periodontalDisease}" /> ${periodontalDisease.description}</td>
						<c:if test="${count%2 == 1 }"></tr></c:if>
					    <c:set var="count" value="${count+1}" />
					</c:forEach>
					<c:if test="${count%2 == 1 }"></tr></c:if>
					<tr><td><form:errors path="periodontalDisease" /></td>
			</tr>
			
			<tr><th colspan="2">
					<form:label for="toothMobility" path="toothMobility" cssErrorClass="error">
						<fmt:message key="dentist.form.toothMobility" />
					</form:label></th></tr>
					
					<c:set var="count" value="0" />
					<c:forEach var="toothMobility" items="${toothMobility}">
						<c:if test="${count%2 == 0 }"><tr></c:if>
							<td><form:radiobutton path="toothMobility" value="${toothMobility}" /> ${toothMobility.description}</td>
						<c:if test="${count%2 == 1 }"></tr></c:if>
					    <c:set var="count" value="${count+1}" />
					</c:forEach>
					<c:if test="${count%2 == 1 }"></tr></c:if>
					<tr><td><form:errors path="toothMobility" /></td>
			</tr>
			
			<tr>
				<th><form:label for="severityLevelComments" path="severityLevelComments" cssErrorClass="error"><fmt:message key="dentist.form.severityLevelComments" /></form:label></th> 
				<td><form:textarea path="severityLevelComments" /> <form:errors path="severityLevelComments" /></td>
			</tr>
		</table>
	</div>
	
	<input type="submit" />
  </div>
</form:form>
<hr>