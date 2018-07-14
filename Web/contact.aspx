<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Tc.Web.contact" %>

<%@ Register Src="/control/top.ascx" TagPrefix="uc1" TagName="top" %>
<%@ Register Src="/control/bot.ascx" TagPrefix="uc1" TagName="bot" %>
<!DOCTYPE html>

<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0" />
    <title><%=PB.Get("webname") %></title>
    <meta name="description" content="<%=PB.Get("description") %>" />
    <meta name="keywords" content="<%=PB.Get("keyword") %>" />
    <meta name="author" content="" />
    <link rel="shortcut icon" href="favicon.ico">
    <link href="/assets/demo/css/style-light.css" rel="stylesheet" />
    <script src="/assets/demo/js/jquery-3.1.1.min.js"></script>

    <style type="text/css">
        /*---------背景色---------*/

        .header {
            background-color: #fff;
        }
        /*---------高两色---------*/
        .nav-bg, .slider .btn-prev:hover, .slider .btn-next:hover, .banner-text span a, .pic-box:hover p, .btn-back:hover, .btn-prev2:hover, .btn-next2:hover, .sub-nav .sub-on a, .sub-nav li a:hover, .formBtn button:hover, .nav li a:after, .nav .on a:after {
            background-color: #a6cc00;
        }

        .news-list-info:hover h4, .news-more a:hover {
            color: #a6cc00;
        }

        .news-more a:hover, .form input:focus, .form textarea:focus {
            border-color: #a6cc00;
        }

        body {
            background-image: url(../../templets/demo/css/bg.jpg);
        }

        .btnbutton {
            display: block;
            padding: 10px;
            width: 100%;
            background: #212121;
            color: #fff;
            margin: 30px auto;
            line-height: 18px;
            cursor: pointer;
            border: none;
            transition: 0.4s;
            text-align: center;
        }
    </style>
</head>
<body>

    <uc1:top runat="server" ID="top" />

    <div class="content">
        <!--  RIGHT CONTENT  -->
        <div class="img-and-text">
            <div class="sub-nav">
                <h3>联系</h3>
                <ul>
                </ul>
            </div>
            <div class="banner-img">
                <div>
                    <h4 style="margin: 0px 0px 10px; padding: 0px; font-size: 24px; line-height: 30px; color: rgb(0, 0, 0); font-family: tt_1, Arial, 微软雅黑;">
                        <img alt="" src="<%=LibFile.get_img_y(mdy.Tupian) %>" style="width: 1140px; height: 182px;" /><br />
                        欢迎随时与我们联系</h4>
                </div>
                <div>
                    <%=mdy.Content %>
                </div>
            </div>
            <div style="clear: both"></div>
            <div class="form">
                <form runat="server" id="from1">
                    <dl>
                        <dt>您的称呼<small>(必填)</small></dt>
                        <dd>
                            <asp:TextBox ID="txt_Xingming" runat="server" class="formText" placeholder=""></asp:TextBox>
                        </dd>
                    </dl>
                    <dl>
                        <dt>您的邮箱<small>(必填)</small></dt>
                        <dd>
                            <asp:TextBox ID="txt_Email" runat="server" class="intxt" placeholder=""></asp:TextBox>
                        </dd>
                    </dl>
                    <dl>
                        <dt>联系电话</dt>
                        <dd>
                            <asp:TextBox ID="txt_Dianhua" runat="server" class="formText" placeholder=""></asp:TextBox>
                        </dd>
                    </dl>
                    <dl>
                        <dt>您的想法/意见<small>(必填)</small></dt>
                        <dd>
                            <textarea id='txt_neirong' runat="server" class="formText"></textarea>
                        </dd>
                    </dl>
                    <div style="display: none">
                        <asp:Button Text="发送留言" runat="server" ID="btn_save" OnClick="btn_save_Click" />
                    </div>
                    <div class="formBtn">
                        <button id="sendbtn" type="button" onclick="ToSubmit()" name="submit">发送留言</button>
                    </div>
                </form>
            </div>
        </div>
        <uc1:bot runat="server" ID="bot" />
    </div>
    <script src="/assets/demo/js/smoothscroll.js"></script>
    <script src="/assets/demo/js/main.js"></script>
    <script>
        function ToSubmit() {
            document.getElementById("btn_save").click();
        }
    </script>
</body>
</html>