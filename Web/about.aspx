<%@ Page Language="C#" AutoEventWireup="true" Inherits="Tc.UI.Danye" %>

<%@ Register Src="/control/top.ascx" TagPrefix="uc1" TagName="top" %>
<%@ Register Src="/control/bot.ascx" TagPrefix="uc1" TagName="bot" %>
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
    </style>
	<script></script>
</head>
<body>
    <uc1:top runat="server" ID="top" />

    <div class="content">
        <div class="img-and-text">
            <div class="sub-nav">
                <h3>关于 </h3>
                <!-- 当只有一个li的时候 就隐藏li 但不要隐藏ul -->
                <ul>
                    <%  var dclist = PB.get_danye_list("types='danye' and url<>'company' and url<>'shouye' and url<>'contact'");
                        foreach (var item in dclist)
                        {
                    %>
                    <li class="sub-on"><a href="/about.aspx?n=<%=item.Url %>"><%=item.Title%></a></li>
                    <%
                        } %>
                </ul>
            </div>
            <div class="banner-img-nobtn"></div>
            <p><%=mdy.Content %></p>
        </div>
        <uc1:bot runat="server" ID="bot" />
    </div>
    b
    <script src="/assets/demo/js/smoothscroll.js"></script>
    <script src="/assets/demo/js/main.js"></script>
</body>
</html>