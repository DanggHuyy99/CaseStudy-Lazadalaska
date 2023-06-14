<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

</head>
<body>
<h1>${errors}</h1>
<div class="container">
    <div class="card">
        <div class="card-body">
            <form action="/login" method="post" id="formLogin">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Username</label>
                    <input type="text" id="username" name="username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                    <span class="errors">${error.username}</span>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input type="password" id="password" name="password" class="form-control" id="exampleInputPassword1" required>

                        <span class="errors">${error}</span> </br>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>

</div>


</body>
<script>
    let form = document.getElementById("formLogin");

    form.addEventListener('submit',function(event){
        // block form submit event
        event.preventDefault()
        let username = document.getElementById("username").value;
        if(username.length < 5 || username.length > 20) {
            alert("Username lớn hơn 5 kí tự và dưới 20 ký tự")
        } else {
                event.currentTarget.submit();
        }

    });
    // function formLogin(e) {
    //     console.log(e)
    //     e.preventDefault();
    //     alert("Không submit được")
    // }
</script>
</html>