<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 6/2/2023
  Time: 4:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:include page="./layout/header.jsp"></jsp:include>
<head>
  <title>Title</title>
  <style>
    /* Thiết lập bảng */
    form {
      display: table;
      border-collapse: collapse;
      margin-top: 50px;
      margin-bottom: 50px;
      width: 100%;
    }
    label, input, select {
      display: table-cell;
      padding: 8px;
      border: 1px solid #ddd;
    }
    label {
      font-weight: bold;
      background-color: #eee;
    }
    input[type="submit"], button, a {
      display: table-cell;
      padding: 8px;
      border: 1px solid #ddd;
      background-color: #f2f2f2;
      cursor: pointer;
    }
    input[type="submit"]:hover, button:hover, a:hover {
      background-color: #ddd;
    }
  </style>
</head>
<body>
<c:if test="${requestScope['message'] != null}">
  <span>${message}</span>
</c:if>
<form action="/handleproduct?action=edit" method="post" enctype="multipart/form-data">
  <input type="hidden" name="id" value="${product.id}">
  <table>
    <tr>
      <th><label for="name">Name</label></th>
      <td><input type="text" name="name" id="name" value="${product.name}" /></td>
    </tr>
    <tr>
      <th><label for="price">Price</label></th>
      <td><input type="text" name="price" id="price" value="${product.price}" /></td>
    </tr>
    <tr>
      <th><label for="describe">Describe</label></th>
      <td><input type="text" name="describe" id="describe" value="${product.describe}" /></td>
    </tr>
    <tr>
      <th><label for="img">Image</label></th>
      <td><input accept=".png, .gif, .jpeg, .jpg" type="file" name="img" id="img" value="${product.img}" /></td>

    </tr>
    <tr>
      <th><label for="quantity">Quantity</label></th>
      <td><input type="text" name="quantity" id="quantity" value="${product.quantity}" /></td>
    </tr>
    <tr>
      <td>
        <select name="category" id="cate">
          <option value="">--None--</option>
          <c:forEach items="${category}" var="cate">
            <c:if test="${product.category.id == cate.id}">
              <option selected value="${cate.id}">${cate.name}</option>
            </c:if>
            <c:if test="${product.category.id != cate.id}">
              <option value="${cate.id}">${cate.name}</option>
            </c:if>
          </c:forEach>
        </select>
      </td>
    </tr>
    <tr>
      <td colspan="2" style="text-align: center;">
        <button type="submit">Edit</button>
        <a href="handleproduct">Back</a>
      </td>
    </tr>
  </table>
</form>
</body>
<jsp:include page="./layout/footer.jsp"></jsp:include>
