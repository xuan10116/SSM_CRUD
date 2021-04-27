<%--
  Created by IntelliJ IDEA.
  User: xuan
  Date: 2021/3/30
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页</title>
    <%--静态引入样式文件--%>
    <%@ include file="common/jscssjq.jsp"%>
</head>
<body>
<div class="container">
    <div class="text-center" style="margin-top:30px">
        <h1 >X-网络技术部<small>未来高质量网络的提供者</small></h1>
    </div>
    <div id="carouselExampleControls" style="margin-top:100px" class="carousel slide col-md-8" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="${pageContext.request.contextPath}/static/image/5.png" class="d-block w-100" alt="...">
            </div>
        </div>
    </div>
    <div class="col-md-4" style="background-color:#eee;margin-top:100px;">
        <h3 class="center-block">后台管理模块登录</h3>

        <form>
            <div class="form-group">
                <label>用户名:</label>
                <input type="text" class="form-control" id="loginName" style="color:red;">
            </div>
            <div class="form-group">
                <label>密  码:</label>
                <input type="password" class="form-control" id="password" style="color:red;">
            </div>
            <div class="form-group">
                <input type="button" value="登陆" id="login_button" class="btn btn-info">
            </div>
        </form>
    </div>
    <%----%>
    <%--静态包含页脚内容--%>
    <%@include file="/WEB-INF/views/common/foot.jsp"%>
</div>

<!--AJAX方法 ,不用加载整个界面，对界面进行局部的部刷新-->
<script type="text/javascript">
    $("#login_button").click(function isLogin(){
        //获取用户名，账号和验证码的值，放在url参数传递到Controller控制器
        var loginName = $("#loginName").val();
        var password = $("#password").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/login",
            data:{aUsername:loginName,aPassword:password},
            type:"post",
            success:function(data){
                if (data.code===200){
                    window.location.href="${pro_path}/list/empList";
                }else{
                    alert(data.msg);
                }
            },
            error:function(){
                alert("失败");
            }
        });
    });
</script>
</body>
</html>
