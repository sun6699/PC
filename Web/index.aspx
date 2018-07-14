<%@ Page Language="C#" AutoEventWireup="true" Inherits="Tc.UI.Index" %>

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
    </style>
</head>
<body>
    <uc1:top runat="server" ID="top" />
    <div class="content">
        <div class="slider" style="height: 500px; opacity: 1;">
            <ul style="top: -500px;">
                <% List<Tc.Model.TcArticle> bannlist = PB.get_article(20, "types='banner'", "click");%>
                <%
                    foreach (var item in bannlist)
                    {
                %>
                <li style="width: 1200px; height: 500px;">
                    <a>
                        <img alt="<%=item.Title %>" src="<%= LibFile.get_img(item.Tupian,"","") %>" style="width: 1200px;">
                    </a>
                </li>
                <%
                    }
                %>
            </ul>
            <div class="slider-ctrl">
                <div class="btn-prev"></div>
                <div class="btn-next"></div>
            </div>
        </div>
        <div class="banner-text">
            <h3>公司简介</h3>
            <p>
                <%=PB.get_danye("shouye") %>
                <span><a href="/about.aspx?n=shouye">了解详细</a></span>
            </p>
        </div>
        <div class="gallery">
            <% var cplist = PB.get_article(8, "types='c'", "id desc"); %>
            <%
                foreach (var item in cplist)
                {
            %>
            <a href="/product/info.aspx?id=<%=item.ID %>">
                <div class="pic-box">
                    <img src="<%=LibFile.get_img(item.Tupian,"","") %>" width="286" height="190">
                    <div class="box-over"></div>
                    <p><%=item.Title %></p>
                </div>
            </a>
            <%
                }
            %>
        </div>
        <div class="big-title">
            <h3>案例</h3>
        </div>
        <div class="news-list">
            <% var allist = PB.get_article(2, "types='al'", "id desc"); %>
            <%
                foreach (var item in allist)
                {
            %>
            <div class="news-box">
                <a href="/anli/info.aspx?id=<%=item.ID %>">
                    <div class="news-list-img">
                        <img src="<%=LibFile.get_img(item.Tupian,"","") %>">
                    </div>
                </a>
                <div class="news-list-info">
                    <div class="news-list-title">
                        <a href="/anli/info.aspx?id=<%=item.ID %>">
                            <h4><%=item.Title.Subs(23) %></h4>
                        </a>
                        <p><%=item.Content.DeleteHMTL().Subs(70) %></p>
                        <div class="news-more"><a href="/anli/info.aspx?id=<%=item.ID %>">继续阅读</a></div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <uc1:bot runat="server" ID="bot" />
    </div>
    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/demo/js/smoothscroll.js"></script>
    <script src="/assets/demo/js/main.js"></script>
</body>
</html>