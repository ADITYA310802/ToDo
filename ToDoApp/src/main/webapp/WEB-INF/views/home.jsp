<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title><c:out value="${page }"></c:out></title>
</head>
<body>
	<!-- <h2>Hello, world!</h2> -->

	<div class="container mt-3">
		<h2 class="text-center">Welcome to ToDo Manager</h2>

		<c:if test="${not empty Msg }">
			<div class="alert alert-success">
				<b><c:out value="${Msg }"></c:out></b>
			</div>
		</c:if>


		<div class="row mt-5">
			<div class="col-md-3">
				<h3 class="text-center">Options</h3>
				<br>
				<div class="list-group">
					<h5>
						<button type="button"
							class="list-group-item list-group-item-action active">
							Menu</button>
					</h5>
					<h5>
						<a href='<c:url value='/add'></c:url>'
							class="list-group-item list-group-item-action">Add TODO</a>
					</h5>
					<h5>
						<a href='<c:url value='/home'></c:url>'
							class="list-group-item list-group-item-action">View TODO</a>
					</h5>

				</div>
			</div>
			<div class="col-md-9">
				<h3 class="text-center">Content</h3>
				<br>
				<%-- <h4> <c:out value="${page }"></c:out></h4> --%>

				<c:if test="${page=='home' }">
					<h4 class="text-center">All To-Do's</h4>

					<c:forEach items="${todos }" var="t">

						<div class="card">
							<h3 style="padding: 10px">
								<c:out value="${t.title }"></c:out>
							</h3>
							<p style="padding: 10px">
								<c:out value="${t.content }"></c:out>
							</p>

						</div>
						<br>

					</c:forEach>
				</c:if>

				<c:if test="${page=='add' }">
					<h4 class="text-center">This is a add TODO page</h4>
					<form:form action="saveTodo" method="post" modelAttribute="todo">
						<div class="form-group">
							<form:input path="title" cssClass="form-control"
								placeholder="Enter your ToDo Title" />
						</div>
						<br>
						<div class="form-group">
							<form:textarea path="content" cssClass="form-control"
								placeholder="Enter your ToDo Content" cssStyle="height:200px" />

						</div>

						<div class="container text-center">
							<button class="btn btn-success btn-lg">Add ToDo Task</button>
						</div>

					</form:form>

				</c:if>
			</div>
		</div>

	</div>

	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh5U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>