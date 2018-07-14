<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="all.aspx.cs" Inherits="Tc.WebAdmin.root.config.all" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>网站配置</title>
    <link href="/assets/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/assets/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <link href="/assets/css/animate.min.css" rel="stylesheet">
    <link href="/assets/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="/assets/css/icons.css" rel="stylesheet" />
    <link href="/assets/css/base.css" rel="stylesheet" />
</head>

<body class="gray-bg">
    <form id="from1" runat="server" class="form-horizontal">
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-sm-12">
                <ol class="breadcrumb">
                    <li>
                        <a href="/root/index.aspx">首页</a>
                    </li>
                    <li>
                        <a href="all.aspx">网站配置</a>
                    </li>
                </ol>
            </div>
        </div>

        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>网站配置</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">网站名称*</label>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txt_webname" runat="server" required class="form-control" placeholder="网站名称"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">电话1*</label>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txt_dianhua" runat="server" required class="form-control" placeholder=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">传真*</label>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txt_chuanzhen" runat="server" required class="form-control" placeholder=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">QQ1*</label>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txt_qq1" runat="server" required class="form-control" placeholder=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">QQ2*</label>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txt_qq2" runat="server" required class="form-control" placeholder=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">邮箱*</label>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txt_email" runat="server" required class="form-control" placeholder=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">地址*</label>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txt_dizhi" runat="server" required class="form-control" placeholder=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">备案号*</label>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txt_beian" runat="server" required class="form-control" placeholder=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Seo关键词*</label>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txt_keyword" runat="server" required class="form-control" placeholder=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Seo描述*</label>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txt_description" runat="server" required class="form-control" placeholder=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">logo上传*</label>
                                <div class="col-sm-8">
                                    <asp:FileUpload ID="filefm" runat="server" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"></label>
                                <div class="col-sm-8">
                                    <a href="<%=weblogo %>" target="_blank"><%=weblogo %></a>
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