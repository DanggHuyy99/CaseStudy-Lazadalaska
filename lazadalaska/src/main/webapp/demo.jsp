<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

  <html>
  <head>
    <title>Title</title>
  </head>
  <body>
  <h1>${action}</h1>
  <a href="product?action=create">Create Employee</a>
  <form action="employees" method="get">
    <input type="product" name="search" id="search" value="${pageable.search}" onsearch="onClearSearch()" />
    <button id="searchButton">Search</button>
  </form>
  <c:if test="${requestScope['product'].size() != 0}">
    <table border="1">
      <tr>
      <tr>
        <td>
          <c:if test="${pageable.sortBy== 'desc'}">
            <a href="product?page=${pageable.page}&search=${pageable.search}&sortby=asc&nameField=product.id">
              Id
            </a>
          </c:if>
          <c:if test="${pageable.sortBy== 'asc'}">
            <a href="product?page=${pageable.page}&search=${pageable.search}&sortby=desc&nameField=product.id">
              Id
            </a>
          </c:if>
        </td>
        <td> <c:if test="${pageable.sortBy== 'desc'}">
          <a href="product?page=${pageable.page}&search=${pageable.search}&sortby=asc&nameField=product.name">
            Name
          </a>
        </c:if>
          <c:if test="${pageable.sortBy== 'asc'}">
            <a href="product?page=${pageable.page}&search=${pageable.search}&sortby=desc&nameField=product.name">
              Name
            </a>
          </c:if></td>
        <td>
          <c:if test="${pageable.sortBy== 'desc'}">
            <a href="product?page=${pageable.page}&search=${pageable.search}&sortby=asc&nameField=product.price">
             Price
            </a>
          </c:if>
          <c:if test="${pageable.sortBy== 'asc'}">
            <a href="product?page=${pageable.page}&search=${pageable.search}&sortby=desc&nameField=product.price">
              Price
            </a>
          </c:if></td>
        <td>
          <c:if test="${pageable.sortBy== 'desc'}">
            <a href="product?page=${pageable.page}&search=${pageable.search}&sortby=asc&nameField=product.describe">
              Describe
            </a>
          </c:if>
          <c:if test="${pageable.sortBy== 'asc'}">
            <a href="product?page=${pageable.page}&search=${pageable.search}&sortby=desc&nameField=product.describe">
              Describe
            </a>
          </c:if>
        </td>
        <td>
          <c:if test="${pageable.sortBy== 'desc'}">
            <a href="product?page=${pageable.page}&search=${pageable.search}&sortby=asc&nameField=product.quantity">
              Quantity
            </a>
          </c:if>
          <c:if test="${pageable.sortBy== 'asc'}">
            <a href="product?page=${pageable.page}&search=${pageable.search}&sortby=desc&nameField=product.quantity">
              Quantity
            </a>
          </c:if>
        </td>
        <td>
          <c:if test="${pageable.sortBy== 'desc'}">
            <a href="product?page=${pageable.page}&search=${pageable.search}&sortby=asc&nameField=product.img">
              Img
            </a>
          </c:if>
          <c:if test="${pageable.sortBy== 'asc'}">
            <a href="product?page=${pageable.page}&search=${pageable.search}&sortby=desc&nameField=product.img">
              Img
            </a>
          </c:if>
        </td>
        <td>
          <c:if test="${pageable.sortBy== 'desc'}">
            <a href="product?page=${pageable.page}&search=${pageable.search}&sortby=asc&nameField=product.category_id">
              Category
            </a>
          </c:if>
          <c:if test="${pageable.sortBy== 'asc'}">
            <a href="product?page=${pageable.page}&search=${pageable.search}&sortby=desc&nameField=product.category_id">
              Category
            </a>
          </c:if>
        </td>
        <td>Action</td>
      </tr>
      <c:forEach items="${product}" var="products">
        <tr>
          <td>${products.id}</td>
          <td>${products.name}</td>
          <td>${products.price}</td>
          <td>${products.describe}</td>
          <td>${products.quantity}</td>
          <td>${products.img}</td>
          <td>${products.category.name}</td>
          <td><a href="product?action=edit&id=${products.id}">Edit</a> </td>
          <td><a href="product?action=delete&id=${products.id}" onclick="return confirm('Do you want to remove ${products.name}?')">Delete</a> </td>
        </tr>
      </c:forEach>
    </table>
    <ul>
      <c:forEach begin="1" end="${pageable.totalPage}" var="page">
        <li><a href="employees?page=${page}&search=${pageable.search}&sortby=${pageable.sortBy}&nameField=${pageable.nameField}">${page}</a> </li>
      </c:forEach>

    </ul>
  </c:if>
  <script>
    function onClearSearch(){
      searchButton.click();
    }
  </script>
  </body>
  </html>

