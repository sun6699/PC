<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="Tc.Web.root.main" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title><%=PB.Get("webname") %></title>
    <!-- Bootstrap core CSS -->
    <link href="/assets/main/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/main/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link rel="stylesheet" href="/assets/main/css/owl.carousel.css" type="text/css">
    <!-- Custom styles for this template -->
    <link href="/assets/main/css/style.css" rel="stylesheet">
    <link href="/assets/css/icons.css" rel="stylesheet" />
    <link href="/assets/css/base.css" rel="stylesheet" />
    <style>
        .cff {
            color: #fff;
        }
    </style>
</head>

<body>

    <section id="container" class="">
        <!--header start-->

        <header class="header blue-bg" style="min-width: 600px">
            <div class="sidebar-toggle-box">
                <div data-original-title="Toggle Navigation" data-placement="right" class="f20 cff fa fa-bars">
                </div>
            </div>
            <!--logo start-->
            <a href="#" class="logo"><%=PB.Get("webname") %><span>V1.0</span></a>
            <!--logo end-->
            <div class="nav notify-row" id="top_menu">
                <!--  notification start -->

                <!--  notification end -->
            </div>
            <div class="top-nav">
                <!--search & user info start-->
                <ul class="nav pull-right top-menu">
                    <!-- user login dropdown start-->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#" style="margin-top: 6px; height: 35px;">
                            <img alt="" src="/assets/main/img/avatar1_small.jpg" style="border: none; margin-top: -5px;">
                            <span class="username">管理员</span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <li><a href="logout.aspx"><i class="icon-key"></i>退出登录</a></li>
                        </ul>
                    </li>
                    <!-- user login dropdown end -->
                </ul>
                <!--search & user info end-->
            </div>
        </header>
        <!--header end-->
        <!--左侧菜单栏目-->
        <style>
            .sidebar-menu i {
                width: 20px;
            }
        </style>
        <aside>
            <div id="sidebar" class="nav-collapse ">
                <!-- sidebar menu start-->
                <ul class="sidebar-menu">
                    <li class="">
                        <a class="" href="index.aspx" target="rightpage">
                            <i class="fa fa-home"></i>
                            <span>后台首页</span>
                        </a>
                    </li>
                    <li class="sub-menu active">
                        <a href="javascript:;" class="">
                            <i class="fa fa-desktop"></i>
                            <span>常用功能</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub">
                            <li><a class="" href="article/list.aspx?types=a" target="rightpage">新闻动态</a></li>
                            <li><a class="" href="chanpin/list.aspx?types=c" target="rightpage">产品管理</a></li>
                            <li><a class="" href="anli/list.aspx?types=al" target="rightpage">案例管理</a></li>
                            <li><a class="" href="danye/list.aspx?types=danye" target="rightpage">单页管理</a></li>
                            <li><a class="" href="links/list.aspx?types=links" target="rightpage">友情链接</a></li>
                            <%--<li><a class="" href="zidian/list.aspx?types=danye" target="rightpage">单页分类</a></li>--%>
                            <li><a class="" href="banner/list.aspx?types=banner" target="rightpage">Banner管理</a></li>
                            <li><a class="" href="liuyan/list.aspx" target="rightpage">留言管理</a></li>
                            <li><a class="" href="shipin/list.aspx?types=sp" target="rightpage">视频展示</a></li>
                            <li><a class="" href="daohang/list.aspx?types=dh" target="rightpage">导航管理</a></li>
                        </ul>
                    </li>
                    <li class="sub-menu">
                        <a href="javascript:;" class="">
                            <i class="fa fa-cogs"></i>
                            <span>系统设置</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub">
                            <li><a class="" href="fenlei/list.aspx?types=a" target="rightpage">新闻动态分类</a></li>
                            <li><a class="" href="fenlei/list.aspx?types=c" target="rightpage">产品分类</a></li>
                            <li><a class="" href="fenlei/list.aspx?types=al" target="rightpage">案例分类</a></li>
                            <li><a class="" href="config/all.aspx" target="rightpage">系统配置</a></li>
                            <li><a class="" href="geren/pwd.aspx" target="rightpage">修改密码</a></li>
                        </ul>
                    </li>
                </ul>
                <!-- sidebar menu end-->
            </div>
        </aside>
        <!--左侧菜单栏目-->
        <!--右侧内容页面-->
        <section id="main-content" style="padding-top: 60px;">
            <iframe id="rightpage" name="rightpage" class="rightiframe" src="danye/list.aspx?types=danye"></iframe>
        </section>
        <!--右侧内容页面-->
    </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="/assets/main/js/jquery.js"></script>
    <script src="/assets/main/js/bootstrap.min.js"></script>
    <script src="/assets/main/js/jquery.scrollTo.min.js"></script>
    <script src="/assets/main/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="/assets/main/js/owl.carousel.js"></script>
    <script src="/assets/main/js/jquery.customSelect.min.js"></script>

    <!--common script for all pages-->
    <script src="/assets/main/js/common-scripts.js"></script>

    <script>

        //owl carousel

        $(document).ready(function () {
            $("#owl-demo").owlCarousel({
                navigation: true,
                slideSpeed: 300,
                paginationSpeed: 400,
                singleItem: true

            });
        });

        //custom select box

        $(function () {
            $('select.styled').customSelect();
        });
    </script>

    <script type="text/javascript">
        function initIframeWH() {
            //alert($(window).width() + "======" + $(window).height())
            $("#rightpage").width($(window).width() - 180);
            $("#rightpage").height($(window).height() - 60);
        }

        $(document).ready(function () {
            initIframeWH();

            $(".sub li a").click(function () {
                $(".sub li a").css('color', '');
                $(this).css('color', '#FF6C60');
            })
        });

        window.onresize = function () {
            initIframeWH();
        }
    </script>
</body>
</html>