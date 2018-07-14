<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="info.aspx.cs" ValidateRequest="false" Inherits="Tc.WebAdmin.root.anli.info" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>案例信息</title>
    <link href="/assets/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/assets/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <link href="/assets/css/animate.min.css" rel="stylesheet">
    <link href="/assets/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="/assets/css/icons.css" rel="stylesheet" />
    <link href="/assets/css/base.css" rel="stylesheet" />
    <link href="/assets/js/ueditor1_4_3/themes/default/css/ueditor.min.css" rel="stylesheet" />
</head>

<body class="gray-bg">
    <form id="from1" runat="server" class="form-horizontal" enctype="multipart/form-data">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-sm-10">
                <ol class="breadcrumb">
                    <li>
                        <a href="/root/index.aspx">首页</a>
                    </li>
                    <li>
                        <a href="list.aspx?types=<%=types %>">案例列表</a>
                    </li>
                    <li>
                        <strong>案例信息</strong>
                    </li>
                </ol>
            </div>
            <div class="col-sm-2 tr">
                <a href="list.aspx?types=<%=types %>" class="btn btn-xs btn-primary">返回列表</a>
            </div>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-sm-10">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>案例信息</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">标题*</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txt_title" runat="server" required class="form-control" Text=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group" style="display: none">
                                <label class="col-sm-2 control-label">英文名*</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txt_seotitle" runat="server" class="form-control" placeholder="英文名称"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group" style="display: none">
                                <label class="col-sm-2 control-label">参数*</label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txt_url" runat="server" required class="form-control" placeholder="参数"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">分类*</label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="ddl_fenleiid" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">封面图片*(840 x 560)</label>
                                <div class="col-sm-8">
                                    <asp:FileUpload ID="filefm" runat="server" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"></label>
                                <div class="col-sm-8">
                                    <a href="<%=tupian %>" target="_blank"><%=tupian %></a>
                                </div>
                            </div>
                            <div class="form-group" style="display: none">
                                <label class="col-sm-2 control-label">图片集*</label>
                                <div class="col-sm-8">
                                    <input type="file" name="uploadify2" id="uploadify2" />
                                    <div style="float: left; position: fixed; right: 20px; top: 100px; z-index: 50" id="fileQueue2"></div>
                                </div>
                            </div>
                            <div class="form-group" style="display: none">
                                <label class="col-sm-2 control-label"></label>
                                <div class="col-sm-8">

                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Repeater ID="rp_tupian" runat="server">
                                                <ItemTemplate>
                                                    <a href="<%#LibFile.get_img(Eval("url").GetString(),"","") %>" target="_blank"><%#Eval("url") %></a>
                                                    <asp:LinkButton ID="lbtnDel" runat="server" OnClientClick="return confirm('确认删除？')"
                                                        CommandArgument='<%#Eval("ID") %>' CssClass="ml10" OnClick="lbtnDel_Click">删除</asp:LinkButton><br />
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:Button ID="btn_re_bind" runat="server" Text="Button" Style="display: none" OnClick="btn_re_bind_Click" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">内容</label>
                                <div class="col-sm-8">
                                    <script type="text/plain" name="Editor1" id="Editor1">
                                <%=content %>
                                    </script>
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
    <script src="../assets/js/uploadfy/jquery.uploadify.min2.js"></script>
    <link href="../assets/js/uploadfy/uploadify.css" rel="stylesheet" />
    <script src="../handler/tupian.js"></script>
    <script type="text/javascript">
        window.UEDITOR_HOME_URL = '<%= ResolveUrl("~/assets/js/ueditor1_4_3/") %>';
    </script>
    <script type="text/javascript" src="/assets/js/ueditor1_4_3/ueditor.config.js"></script>
    <script type="text/javascript" src="/assets/js/ueditor1_4_3/ueditor.all.min.js"></script>
    <script>
        $(document).ready(function () {
            init_up_tupian("uploadify2", "fileQueue2", "dtp2", "<%=id%>", "<%=btn_re_bind.ClientID%>", "TcArticle");
            $("#from1").validate();
            var editor1 = UE.getEditor('Editor1', {
                initialFrameWidth: '100%',
                initialFrameHeight: 300,
                autoHeightEnabled: false,
                autoFloatEnabled: false,
                onready: function () {
                }
            });

        });
    </script>
</body>
</html>