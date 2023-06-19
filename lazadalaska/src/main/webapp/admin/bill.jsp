<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:include page="./layout/header.jsp"></jsp:include>
<style>
  .pagination {
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .pages {
    display: flex;
    justify-content: center;
    align-items: center;
    list-style: none;
    padding: 0;
    margin: 0;
  }

  .pages li {
    margin-right: 5px;
  }

  .pages a {
    display: inline-block;
    background-color: #fff;
    border: 1px solid #ddd;
    color: #333;
    padding: 5px 10px;
    text-decoration: none;
    font-size: 16px;
  }

  .pages a:hover {
    background-color: #007bff;
    border-color: #007bff;
    color: #fff;
  }

  .pages a.active {
    background-color: #007bff;
    border-color: #007bff;
    color: #fff;
  }
</style>
<h1>${action}</h1>
<form action="bills" method="get">
  <input type="search" name="search" id="search" value="${pageable.search}" onsearch="onClearSearch()"/>
  <button id="searchButton">Search</button>
</form>
<c:if test="${requestScope['products'].size() != 0}">
  <div class="w-full overflow-hidden rounded-lg shadow-xs p-2">
    <div class="w-full overflow-x-auto">
      <table class="w-full">
        <thead>
        <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
          <th class="px-4 py-3">ID</th>
          <th class="px-4 py-3">Name User</th>
          <th class="px-4 py-3">Date</th>
          <th class="px-4 py-3">Total</th>
          <th class="px-4 py-3">Action</th>
        </tr>
        </thead>
        <c:forEach items="${bills}" var="bill">
          <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
          <tr class="text-gray-700 dark:text-gray-400" style="border: 1px solid #d5d6d7">
            <td class="px-4 py-3">
                ${bill.id}
            </td>
            <td class="px-4 py-3">
                ${bill.user_id.username}
            </td>
            <td class="px-4 py-3 text-sm">
                ${bill.date}
            </td>
            <td class="px-4 py-3 text-xs">
                ${bill.total}
            </td>
            <td><a href="/admin/products?action=edit&id=${product.id}">Edit</a> </td>
            <td class="pr-2"><a href="/admin/products?action=delete&id=${product.id}" onclick="return confirm('Do you want to remove ${product.name}?')">Delete</a> </td>
              <%--                                                            <td class="px-4 py-3">--%>
              <%--                                                                <div class="flex items-center space-x-4 text-sm">--%>
              <%--                                                                    <button class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"--%>
              <%--                                                                            aria-label="Edit">--%>
              <%--                                                                        <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">--%>
              <%--                                                                            <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"> <a href="products?action=edit&id=${product.id}"></a></path>--%>
              <%--                                                                        </svg>--%>

              <%--                                                                    </button>--%>
              <%--                                                                    <button class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"--%>
              <%--                                                                            aria-label="Delete">--%>
              <%--                                                                        <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">--%>
              <%--                                                                            <path fill-rule="evenodd"--%>
              <%--                                                                                  d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"--%>
              <%--                                                                                  clip-rule="evenodd"> <a href="products?action=delete&id=${product.id}" onclick="return confirm('Do you want to remove ${product.name}?')"></a></path>--%>

              <%--                                                                        </svg>--%>
              <%--                                                                    </button>--%>
              <%--                                                                </div>--%>
              <%--                                                            </td>--%>
          </tr>
          </tbody>
        </c:forEach>
      </table>
    </div>
    <div class="pagination my-8">
      <ul class="pages">
        <c:forEach begin="1" end="${pageable.totalPages}" var="page">
          <li><a href="/handleproduct?page=${page}&search=${pageable.search}&sortby=${pageable.sortBy}&nameField=${pageable.nameField}">${page}</a></li>
        </c:forEach>
      </ul>
    </div>
  </div>
  </div>
</c:if>
<jsp:include page="./layout/footer.jsp"></jsp:include>
