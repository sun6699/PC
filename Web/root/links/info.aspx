<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="info.aspx.cs" Inherits="Tc.Web.root.links.info" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>友情链接</title>
    <link href="/assets/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/assets/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <link href="/assets/css/animate.min.css" rel="stylesheet">
    <link href="/assets/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="/assets/css/icons.css" rel="stylesheet" />
    <link href="/assets/css/base.css" rel="stylesheet" />
    <link href="/assets/js/ueditor1_4_3/themes/default/css/ueditor.min.css" rel="stylesheet" />
</head>

<body class="gray-bg">
    <form id="from1" runat="server" class="form-horizontal">

        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-sm-10">
                <ol class="breadcrumb">
                    <li>
                        <a href="/root/index.aspx">首页</a>
                    </li>
                    <li>
                        <a href="list.aspx?types=<%=types %>">友情链接</a>
                    </li>
                    <li>
                        <strong>友情链接信息</strong>
                    </li>
                </ol>
            </div>
            <div class="col-sm-2 tr">
                <a href="list.aspx?types=<%=types %>" class="btn btn-xs btn-primary">返回列表</a>
            </div>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-sm-6">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>单页信息</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">标题*</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txt_title" runat="server" required class="form-control" placeholder="标题"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">链接地址*</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txt_url" runat="server" required class="form-control" placeholder="例如：http://www.baidu.com"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-8">
                                    <asp:Button ID="btn_save" runat="server" Text="保 存" CssClass="btn btn-sm btn-primary w-md" OnClick="btn_save_Click" />
                                    <button type="reset" class="btn btn-sm btn-default m-l-10 w-md">
                                        重 置
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="/assets/js/jquery.min.js?v=2.1.4"></script>
    <script src="/assets/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="/assets/js/content.min.js?v=1.0.0"></script>

    <script src="/assets/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="/assets/js/plugins/validate/messages_zh.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#from1").validate();

        });
    </script>
</body>
</html>