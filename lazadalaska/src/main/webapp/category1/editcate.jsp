<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${requestScope['message'] != null}">
    <span>${message}</span>
</c:if>
<a href="/categories">Back</a><br>
<form action="/categories?action=edit&id=1" method="post">
    <input type="hidden" name="id" value="${category.id}">
    <label for="name">Name</label>
    <input type="text" name="name" id="name" value="${category.name}" />
<%--    ${category.id}--%>
<%--    <select name="category" id="category">--%>
<%--        <option value="">--None--</option>--%>
<%--        <c:forEach items="${categorys}" var="category">--%>
<%--            <c:if test="${category.category.id == category.id}">--%>
<%--                <option selected value="${category.id}">${category.name}</option>--%>
<%--            </c:if>--%>
<%--            <c:if test="${category.category.id != category.id}">--%>
<%--                <option value="${category.id}">${category.name}</option>--%>
<%--            </c:if>--%>
<%--        </c:forEach>--%>
<%--    </select>--%>
    <button type="submit">Edit</button>
</form>
</body>
</html>