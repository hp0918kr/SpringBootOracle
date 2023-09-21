<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원가입 화면</title>
    <link rel="stylesheet" href="/css/table.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcod/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">

        let userIdCheck = "Y";

        let emailAuthNumber = "";

        $(document).ready(function () {

            let f = document.getElementById("f");

            $("#btnUserId").on("click", function () {
                userIdExists(f)
            })

            $("#btnEmail").on("click", function () {
                emailExists(f)
            })

            $("#btnAddr").on("click", function () {
                kakaoPost(f);
            })

            $("#btnSend").on("click", function () {
                doSubmit(f);
            })
        })

        function userIdExists(f) {

            if (f.userId.value === "") {
                arlert("아이디를 입력하세요.");
                f.userId.focus();
                return;
            }
            $.ajax({
                url: "/user/getUserIdExists",
                type: "post",
                dataType: "JSON",
                data: $("#f").serialize(),
                success: function (json) {

                    if (json.existYn === "Y") {
                        alert("이미 가입된 아이디가 존재합니다.");
                        userIdCheck = "N";
                    }
                }
            })
        }

        function emailExists(f) {
            if (f.email.value === "") {
                alert("이메일을 입력하세요.");
                f.email.focus();
                return;
            }
            $.ajax({
                url: "/user/qetEmailExists",
                type: "post",
                dataTyoe: "JSON",
                data: $("#f").serialize(),
                success: function (json) {

                    if (json.existsYn === "Y") {
                        alert("이미 가입된 이메일 주소가 존재합니다.");
                        f.email.focus();

                    } else {
                        alert("이메일로 인증번호가 발송되었습니다. \n받은 메일의 인증번호를 입력하기 바랍니다.");
                        emailAuthNumber = json.authNumber;
                    }
                }
            })
        }

        function kakaoPost(f) {
            new daum.Postcode({
                oncomplete: function (data) {

                    let addres = data.address;
                    let zonecode = data.zonecode;
                    f.addr1.value = "(" + zonecode + ")" + address
                }
            }).open();
        }

        function doSubmit(f) {

            if (f.userId.value === "") {
                alert("아이디를 입력하세요.");
                f.userId.focus();
                return;
            }

            if (userIdCheck !== "N") {
                alert("아이디 중복 체크 및 중복되지 않은 아이디로 가입 바랍니다.");
                f.userId.focus();
                return;
            }

            if (f.userName.value === "") {
                alert("이름을 입력하세요.");
                f.user.Name.focus();
                return;
            }

            if (f.password.value === "") {
                alert("비밀번호를 입력하세요.");
                f.password.focus();
                return;
            }

            if (f.password2.value === "") {
                alert("비밀번호확인을 입력하세요.");
                f.password2.focus();
                return;
            }

            if (f.password.value !== f.password2.value) {
                alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                f.password.focus();
                return;
            }

            if (f.email.value === "") {
                alert("이메일을 입력하세요.");
                f.email.focus();
                return;
            }

            if (f.authNumber.value === "") {
                alert("인증번호가 일치하지 않습니다.");
                f, authNumber.focus();
                return;
            }

            if (f.addr1.value === "") {
                alert("주소를 입력하세요.");
                f.addr1.focus();
                return;
            }

            if (f.addr2.value === "") {
                alert("상세주소를 입력하세요.");
                f.addr2.focus();
                return;
            }

            $.ajax({
                url: "/user/insertUserInfo",
                type: "post",
                dataType: "JSON",
                data: $("#f").serialize(),
                success: function (json) {

                    if (json.result === 1) {
                        alert(json.msg);
                        locatuin.href = "/user/login";

                    } else {
                        alert(json.msg);
                    }

                }
            })
        }
    </script>
</head>
<body>
<h2>회원 가입하기</h2>
<hr/>
<br/>
<form id = "f">
    <div class="divTable minimalistBlack">
        <div class="divTableBody">
            <div class="divTableRow">
                <div class="divTableCell">* 아이디
                </div>
                <div class="divTableCell">
                    <input type="text" name="userId" style="width: 80%" placeholder="아이디"/>
                    <button id="btnUserId" type="button">아이디 중복체크</button>
                </div>
            </div>
            <div class="divTableRow">
                <div class="divTableCell">* 이름
                </div>
                <div class="divTableCell">
                    <input type="text" name="userName" style="width: 95%" placeholder="이름"/>
                </div>
            </div>
            <div class="divTableRow">

            </div>
        </div>
    </div>

</form>
</body>
</html>