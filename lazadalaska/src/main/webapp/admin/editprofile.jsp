<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
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

    .error {
        color: red;
    }
</style>
<c:if test="${requestScope['message'] != null}">
    <span>${message}</span>
</c:if>
<form name="myForm" action="/profile?action=edit" method="post" onsubmit="return validateForm()"
      enctype="multipart/form-data">
    <div class="w-full overflow-hidden rounded-lg shadow-xs p-2">
        <div class="w-full overflow-x-auto">
            <table class="w-full">

                <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                <input type="hidden" name="id"  class="form-control" value="${user.id}">
                <tr class="text-gray-700 dark:text-gray-400" style="border: 1px solid #d5d6d7">
                    <th><label for="img">Image</label></th>
                    <td class="px-4 py-3">
                    <td><input accept=".png, .gif, .jpeg, .jpg" type="file" name="img" id="img" value="${product.img}"/>
                    </td>
                </tr>
                <tr>
                    <td><label>Email :</label></td>
                    <td class="px-4 py-3">
                        <input type="email" name="email" id="email" class="form-control" value="${user.email}">
                        <span id="emailError" class="error"></span>
                    </td>
                </tr>
                <tr>
                    <td><label>Full Name :</label></td>
                    <td class="px-4 py-3">
                        <input type="text" name="fullname" id="fullname" class="form-control" value="${user.fullname}">
                        <span id="fullnameError" class="error"></span>
                    </td>
                </tr>
                <tr>
                    <td><label>Phone Number :</label></td>
                    <td class="px-4 py-3 text-sm">
                        <input type="tel" name="phone" id="phone" class="form-control" value="${user.phone}">
                        <span id="phoneError" class="error"></span>
                    </td>
                </tr>
                <tr>
                    <td><label>Address :</label></td>
                    <td class="px-4 py-3 text-xs">
                        <textarea name="address" id="address" class="form-control">${user.address}</textarea>
                        <span id="addressError" class="error"></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit" class="btn btn-primary">
                            UpLoad Profile
                        </button>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit" class="btn btn-primary">
                            <a href="/profile?action=myProfile&id=${sessionScope.id}">Back</a></button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</form>

<script type="text/javascript">
    function validateForm() {
        var fullname = document.forms["myForm"]["fullname"].value.trim();
        var email = document.forms["myForm"]["email"].value.trim();
        var phone = document.forms["myForm"]["phone"].value.trim();
        var address = document.forms["myForm"]["address"].value.trim();

        var fullnameError = document.getElementById("fullnameError");
        var emailError = document.getElementById("emailError");
        var phoneError = document.getElementById("phoneError");
        var addressError = document.getElementById("addressError");

        fullnameError.innerHTML = "";
        emailError.innerHTML = "";
        phoneError.innerHTML = "";
        addressError.innerHTML = "";

        varisValid = true;

        // Validate Full Name
        if (fullname == "") {
            fullnameError.innerHTML = "Full Name is required";
            isValid = false;
        }

        // Validate Email
        if (email == "") {
            emailError.innerHTML = "Email is required";
            isValid = false;
        } else {
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                emailError.innerHTML = "Invalid email format";
                isValid = false;
            }
        }

        // Validate Phone Number
        if (phone == "") {
            phoneError.innerHTML = "Phone Number is required";
            isValid = false;
        } else {
            var phoneRegex = /^\d{10}$/;
            if (!phoneRegex.test(phone)) {
                phoneError.innerHTML = "Invalid phone number format";
                isValid = false;
            }
        }

        // Validate Address
        if (address == "") {
            addressError.innerHTML = "Address is required";
            isValid = false;
        }

        return isValid;
    }
</script>

<jsp:include page="./layout/footer.jsp"></jsp:include>