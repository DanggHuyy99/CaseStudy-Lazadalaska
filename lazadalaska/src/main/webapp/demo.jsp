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
    <a href="products?action=create">Create Product</a>
    <form action="products" method="get">
        <input type="search" name="search" id="search" value="${pageable.search}" onsearch="onClearSearch()"/>
        <button id="searchButton">Search</button>
    </form>
    <c:if test="${requestScope['product'].size() != 0}">
    <div class="w-full overflow-hidden rounded-lg shadow-xs">
        <div class="w-full overflow-x-auto">
            <table class="w-full whitespace-no-wrap">
                <thead>
                <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                    <th class="px-4 py-3">ID</th>
                    <th class="px-4 py-3">Name</th>
                    <th class="px-4 py-3">Price</th>
                    <th class="px-4 py-3">Describe</th>
                    <th class="px-4 py-3">Quantity</th>
                    <th class="px-4 py-3">IMG</th>
                    <th class="px-4 py-3">Action</th>
                </tr>
                </thead>
                <c:forEach items="${products}" var="product">
                <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                <tr class="text-gray-700 dark:text-gray-400">
                    <td class="px-4 py-3">
                            ${product.id}
                    </td>
                    <td class="px-4 py-3">
                            ${product.name}
                    </td>
                    <td class="px-4 py-3 text-sm">
                            ${product.price}
                    </td>
                    <td class="px-4 py-3 text-xs">
                                ${product.describe}
                    </td>
                    <td class="px-4 py-3 text-sm">
                            ${product.quantity}
                    </td>
                    <td class="px-4 py-3 text-sm">
                        <img src="${product.img}">
                    </td>
                    <td><a href="products?action=edit&id=${product.id}">Edit</a> </td>
                    <td><a href="products?action=delete&id=${product.id}" onclick="return confirm('Do you want to remove ${product.name}?')">Delete</a> </td>
<%--                    <td class="px-4 py-3">--%>
<%--                        <div class="flex items-center space-x-4 text-sm">--%>
<%--                            <button class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"--%>
<%--                                    aria-label="Edit">--%>
<%--                                <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">--%>
<%--                                    <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"></path>--%>
<%--                                </svg>--%>
<%--                            </button>--%>
<%--                            <button class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"--%>
<%--                                    aria-label="Delete">--%>
<%--                                <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">--%>
<%--                                    <path fill-rule="evenodd"--%>
<%--                                          d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"--%>
<%--                                          clip-rule="evenodd"></path>--%>
<%--                                </svg>--%>
<%--                            </button>--%>
<%--                        </div>--%>
<%--                    </td>--%>
                </tr>
                </tbody>
                </c:forEach>
            </table>
        </div>
            <!-- Pagination -->
            <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
                  <nav aria-label="Table navigation">
                    <ul class="inline-flex items-center">
                      <li>
                        <button class="px-3 py-1 rounded-md rounded-l-lg focus:outline-none focus:shadow-outline-purple"
                                aria-label="Previous">
                          <svg class="w-4 h-4 fill-current" aria-hidden="true" viewBox="0 0 20 20">
                            <path d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
                                  clip-rule="evenodd" fill-rule="evenodd"></path>
                          </svg>
                             <c:forEach begin="1" end="${pageable.totalPages}" var="page">
                                 <li><a href="products?page=${page}&search=${pageable.search}&sortby=${pageable.sortBy}&nameField=${pageable.nameField}">${page}</a> </li>
                             </c:forEach>
                        </button>
                      </li>
                    </ul>
                  </nav>
                </span>
        </div>
    </div>
          </c:if>
    <script>
        function onClearSearch() {
            searchButton.click();
        }
    </script>
    </body>
    </html>

