<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="./layout/header.jsp"></jsp:include>

<style> .pagination {
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

table {
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
    border-bottom: 1px solid #d5d6d7;
}

th {
    background-color: #f2f2f2;
}

.bg-white {
    background-color: #fff;
}

.text-xs {
    font-size: 12px;
}

.text-sm {
    font-size: 14px;
}

.text-gray-500 {
    color: #6b7280;
}

.text-gray-700 {
    color: #4b5563;
}

.dark:text-gray-400 {
    color: #9ca3af;
}

.uppercase {
    text-transform: uppercase;
}

.border-b {
    border-bottom-width: 2px;
}

.dark:border-gray-700 {
    border-color: #374151;
}

.bg-gray-50 {
    background-color: #f9fafb;
}

.dark:bg-gray-800 {
    background-color: #1f2937;
}

.divide-y {
    border-top-width: 1px;
    border-color: #d5d6d7;
}

.dark:divide-gray-700 {
    border-color: #374151;
} </style>
<h1>${action}</h1>
<c:if test="${not empty bills}">

    <div class="w-full overflow-hidden rounded-lg shadow-xs p-2">
        <div class="w-full overflow-x-auto">
            <table>
                <thead>
                <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                    <th>ID</th>
                    <th>Tên người dùng</th>
                    <th>Ngày</th>
                    <th>Tổng</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody><c:forEach items="${bills}" var="bill">
                    <tr class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                        <td>${bill.id}</td>
                        <td>${bill.user_id.username}</td>
                        <td class="text-sm">${bill.date}</td>
                        <td class="text-xs"><fmt:formatNumber value="${bill.total}" type="currency" currencyCode="VND"/></td>
                        <td class="text-xs">${bill.status.name}</td>
                        <td>
                            <button type="button" onclick="submitBill(${bill.id})"
                                    class=" px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple ">
                                SubMit
                            </button>
                        </td>
                    </tr>
                </c:forEach></tbody>
            </table>
        </div>
        <div class="pagination my-8">
            <ul class="pages"><c:forEach begin="1" end="${pageable.totalPages}" var="page">
                <li>
                    <a href="/handleproduct?page=${page}&search=${pageable.search}&sortby=${pageable.sortBy}&nameField=${pageable.nameField}"
                       class="${page == pageable.page ? 'active' : ''}"> ${page} </a></li>
            </c:forEach></ul>
        </div>
    </div>
</c:if>
<jsp:include page="./layout/footer.jsp"></jsp:include>
<script>
    function submitBill(billId) {
        var form = document.createElement("form");
        form.setAttribute("method", "post");
        form.setAttribute("action", "confirmBillServlet");

        var input = document.createElement("input");
        input.setAttribute("type", "hidden");
        input.setAttribute("name", "billId");
        input.setAttribute("value", billId);

        form.appendChild(input);

        document.body.appendChild(form);
        form.submit();
    }
</script>
