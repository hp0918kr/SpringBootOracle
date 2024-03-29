<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="/css/table.css"/>
    <script type="text/javascript" src="/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {

            $("#btnLogin").on("click", function (){
                location.href = "/user/login";
            })

            $("#btnSearchUserId").on("click", function (){
                let f = document.getElementById("f");

                if (f.userName.value === "") {
                    alert("이름을 입력하세요.");
                    f.userName.focus();
                    return;
                }

                if (f.email.value === "") {
                    alert("이메일을 입력하세요.");
                    f.email.focus();
                    return;
                }

                f.method = "post";
                f.action = "/user/searchUserIdProc"

                f.submit();
            })
        })
    </script>
</head>
<body>
<h2>아이디 찾기</h2>
<hr/>
<br/>
<form id="f">
    <div class="divTable minimalistBlack">
        <div class="divTableBody">
            <div class="divTableRow">
                <div class="divTableCell">이름
                </div>
                <div class="divTableCell">
                    <input type="text" name="userName" id="userId" style=""/>
                </div>
            </div>
            <div class="divTableRow">
                <div class="divTableCell">이메일
                </div>
                <div class="divTableCell">
                    <input type="email" name="email" id="email" style=""/>
                </div>
            </div>
        </div>
    </div>
<div>
    <button id="btnSearchUserId" type="button">아이디 찾기</button>
    <button id="btnLogin" type="button">로그인 </button>
</div>
</form>
</body>
</html>