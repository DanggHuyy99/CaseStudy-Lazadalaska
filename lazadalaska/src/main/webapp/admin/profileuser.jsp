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
        transition: background-color 0.3s, border-color 0.3s, color 0.3s;
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

    .user-table {
        width: 100%;
        border-collapse: collapse;
    }

    .user-table td {
        padding: 10px;
        border: 1px solid #d5d6d7;
    }

    .user-table .label {
        font-weight: bold;
    }

    .user-table .img-container {
        width: 100px;
        height: 100px;
        overflow: hidden;
        border-radius: 50%;
    }

    .user-table .img-container img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .user-table .edit-button {
        display: inline-block;
        padding: 8px 16px;
        font-size: 14px;
        font-weight: bold;
        text-align: center;
        text-decoration: none;
        background-color: #6c63ff;
        color: #fff;
        border-radius: 4px;
        transition: background-color 0.3s;
    }

    .user-table .edit-button:hover {
        background-color: #534edf;
    }
</style>

<div class="w-full overflow-hidden rounded-lg shadow-xs p-2">
    <div class="w-full overflow-x-auto">
        <table class="user-table">
            <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
            <tr class="text-gray-700 dark:text-gray-400">
                <td class="label">IMG:</td>
                <td>
                    <div class="img-container">
                        <img src="${user.img}" alt="User Image">
                    </div>
                </td>
            </tr>
            <tr>
                <td class="label">Email:</td>
                <td>${user.email}</td>
            </tr>
            <tr>
                <td class="label">Full Name:</td>
                <td>${user.fullname}</td>
            </tr>
            <tr>
                <td class="label">Phone:</td>
                <td>${user.phone}</td>
            </tr>
            <tr>
                <td class="label">Address:</td>
                <td>${user.address}</td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <a href="profile?action=edit&id=${user.id}" class="edit-button">Edit</a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="./layout/footer.jsp"></jsp:include>
