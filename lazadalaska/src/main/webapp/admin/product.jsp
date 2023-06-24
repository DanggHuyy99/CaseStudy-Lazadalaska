<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <a href="/admin/handleproduct?action=create">Create Product</a>
                <c:if test="${requestScope['products'].size() != 0}">
                <div class="w-full overflow-hidden rounded-lg shadow-xs p-2">
                    <div class="w-full overflow-x-auto">
                        <table class="w-full">
                            <thead>
                            <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                <th class="px-4 py-3">ID</th>
                                <th class="px-4 py-3">Name</th>
                                <th class="px-4 py-3">Price</th>
                                <th class="px-4 py-3">Describe</th>
                                <th class="px-4 py-3">Quantity</th>
                                <th class="px-4 py-3">IMG</th>
                                <th class="px-4 py-3">Category</th>
                                <th class="px-4 py-3">Action</th>
                            </tr>
                            </thead>
                            <c:forEach items="${products}" var="product">
                                <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                                <tr class="text-gray-700 dark:text-gray-400" style="border: 1px solid #d5d6d7">
                                    <td class="px-4 py-3">
                                            ${product.id}
                                    </td>
                                    <td class="px-4 py-3">
                                            ${product.name}
                                    </td>
                                    <td class="text-xs" style="white-space: nowrap"><fmt:formatNumber value="${product.price}" type="currency" currencyCode="VND"/></td>

                                    <td class="px-4 py-3 text-xs">
                                            ${product.describe}
                                    </td>
                                    <td class="px-4 py-3 text-sm">
                                            ${product.quantity}
                                    </td>
                                    <td class="px-4 py-3 text-sm">
                                        <img src="${product.img}">
                                    </td>
                                    <td class="px-4 py-3 text-sm">
                                            ${product.category.name}
                                    </td>
                                    <td><a href="/handleproduct?action=edit&id=${product.id}" class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">Edit</a> </td>
                                    <td class="pr-2"><a href="handleproduct?action=delete&id=${product.id}" onclick="return confirm('Do you want to remove ${product.name}?')" class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">Delete</a> </td>
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
