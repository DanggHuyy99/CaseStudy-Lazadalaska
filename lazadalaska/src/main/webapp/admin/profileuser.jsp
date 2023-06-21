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

  <div class="w-full overflow-hidden rounded-lg shadow-xs p-2">
    <div class="w-full overflow-x-auto">
      <table class="w-full">

          <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
          <tr class="text-gray-700 dark:text-gray-400" style="border: 1px solid #d5d6d7">
            <td><label>IMG :</label></td>
            <td class="px-4 py-3">
              <img src="${user.img}">
            </td>
          </tr>
          <tr>
            <td><label>Email :</label></td>
            <td class="px-4 py-3">
                ${user.email}
            </td>
          </tr>
          <tr>
            <td><label>FUll Nanme :</label></td>
            <td class="px-4 py-3">
                ${user.fullname}
            </td>
          </tr>
          <tr>
            <td><label>Phone :</label></td>
            <td class="px-4 py-3 text-sm">
                ${user.phone}
            </td>
          </tr>
          <tr>
            <td><label>AddRess :</label></td>
            <td class="px-4 py-3 text-xs">
                ${user.address}
            </td>
          </tr>
          <tr>
            <td><a href="profile?action=edit&id=${user.id}">Edit</a> </td>
<%--            <td class="pr-2"><a href="/admin/profile?action=delete&id=${user.id}" onclick="return confirm('Do you want to remove ${user.name}?')">Delete</a> </td>--%>
          </tr>
          </tbody>

      </table>
    </div>
  </div>
  </div>

<jsp:include page="./layout/footer.jsp"></jsp:include>