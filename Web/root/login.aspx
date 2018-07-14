<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Tc.WebAdmin.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><%=PB.Get("webname") %></title>
    <link href="/assets/images/admin/style.css" rel="stylesheet" type="text/css" />
    <script src="/assets/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            //检测IE
            if ('undefined' == typeof (document.body.style.maxHeight)) {
                alert("推荐使用360极速浏览器！");
                window.location.href = 'http://chrome.360.cn/';
            }
        });
    </script>
</head>

<body class="loginbody">
    <form id="form1" runat="server">
        <div class="login-screen">
            <div class="login-form">
                <div style="width: 320px; float: left">
                    <h1><%=PB.Get("webname") %></h1>
                    <div class="control-group">
                        <asp:TextBox ID="txt_name" MaxLength="20" runat="server" CssClass="login-field" placeholder="用户名" title="用户名"></asp:TextBox>
                        <label class="login-field-icon user" for="txtUserName"></label>
                    </div>
                    <div class="control-group">
                        <asp:TextBox ID="txt_pwd" MaxLength="20" TextMode="Password" runat="server" CssClass="login-field" placeholder="密码" title="密码"
                            Style="ime-mode: disabled;"></asp:TextBox>
                        <label class="login-field-icon pwd" for="txtPassword"></label>
                    </div>
                    <div>
                        <asp:Button ID="Button1" runat="server" Text="登录" OnClick="Button1_Click" CssClass="btn-login" />
                    </div>
                    <span class="login-tips"><i></i><b id="msgtip">请输入用户名密码!</b></span>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        window.onload = function () {
            if (window.location != window.parent.location) {
                window.parent.location = window.location;
            }
        }
    </script>
</body>
</html>