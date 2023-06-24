<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="./layout/header.jsp"></jsp:include>
<head>
    <title>Edit Product</title>
    <style>
        /* Thiết lập bảng */
        form {
            display: flex;
            flex-direction: column;
            max-width: 500px;
            margin: 50px auto;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group select {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 100%;
            box-sizing: border-box;
        }

        .form-group .error-message {
            color: red;
            font-size: 0.8em;
            margin-top: 5px;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .message-container {
            background-color: #e6f7ff;
            color: #1890ff;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 4px;
            display: none;
        }
    </style>
    <script>
        function validateForm() {
            var name = document.getElementById("name").value;
            var price = document.getElementById("price").value;
            var describe = document.getElementById("describe").value;
            var img = document.getElementById("img").value;
            var quantity = document.getElementById("quantity").value;
            var category = document.getElementById("category").value;

            var errors = [];

            if (name.trim() === "") {
                errors.push({ field: "name", message: "Product name is required." });
            }

            if (price.trim() === "" || isNaN(price) || price <= 0) {
                errors.push({ field: "price", message: "Product price is required and should be a number greater than 0." });
            }

            if (describe.trim() === "") {
                errors.push({ field: "describe", message: "Product description is required." });
            }

            if (img.trim() === "") {
                errors.push({ field: "img", message: "Product image is required." });
            }

            if (quantity.trim() === "" || isNaN(quantity) || quantity <= 0) {
                errors.push({ field: "quantity", message: "Product quantity is required and should be a number greater than 0." });
            }

            if (category.trim() === "") {
                errors.push({ field: "category", message: "Product category is required." });
            }

            var errorMessageContainer = document.getElementById("error-message-container");
            errorMessageContainer.innerHTML = "";

            if (errors.length > 0) {
                for (var i = 0; i < errors.length; i++) {
                    var error = errors[i];
                    var field = document.getElementById(error.field);
                    field.classList.add("error-field");

                    var errorMessage = document.createElement("div");
                    errorMessage.classList.add("error-message");
                    errorMessage.innerText = error.message;

                    errorMessageContainer.appendChild(errorMessage);
                    field.parentNode.insertBefore(errorMessageContainer, field.nextSibling);
                }

                return false;
            }

            return true;
        }

        function showEditedMessage() {
            var messageContainer = document.getElementById("message-container");
            messageContainer.style.display = "block";
            setTimeout(function () {
                messageContainer.style.display = "none";
            }, 3000);
        }
    </script>
</head>
<body>
<c:if test="${requestScope['message'] != null}">
    <div id="message-container" class="message-container">
        Product edited successfully!
    </div>
</c:if>
<form action="/handleproduct?action=edit" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
    <input type="hidden" name="id" value="${product.id}">
    <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" value="${product.name}" />
    </div>
    <div class="form-group">
        <label for="price">Price:</label>
        <input type="text" name="price" id="price" value="${product.price}" />
    </div>
    <div class="form-group">
        <label for="describe">Description:</label>
        <input type="text" name="describe" id="describe" value="${product.describe}" />
    </div>
    <div class="form-group">
        <label for="img">Image:</label>
        <input accept=".png, .gif, .jpeg, .jpg" type="file" name="img" id="img" />
    </div>
    <div class="form-group">
        <label for="quantity">Quantity:</label>
        <input type="text" name="quantity" id="quantity" value="${product.quantity}" />
    </div>
    <div class="form-group">
        <label for="category">Category:</label>
        <select name="category" id="category">
            <option value="">--None--</option>
            <c:forEach items="${category}" var="cate">
                <c:if test="${product.category.id == cate.id}">
                    <option selected="selected" value="${cate.id}">${cate.name}</option>
                </c:if>
                <c:if test="${product.category.id != cate.id}">
                    <option value="${cate.id}">${cate.name}</option>
                </c:if>
            </c:forEach>
        </select>
    </div>
    <div class="button-container">
        <button type="submit" onclick="showEditedMessage()" class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">Edit</button>
        <a href="handleproduct" class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">Back</a>
    </div>
    <div id="error-message-container"></div>
</form>
</body>
<jsp:include page="./layout/footer.jsp"></jsp:include>
<script>
    var priceElement = document.getElementById("price");
    var formattedPrice = parseFloat(priceElement.value).toFixed(2);
    priceElement.value = formattedPrice;
</script>
