<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="list.aspx.cs" Inherits="Tc.Web.root.shipin.list" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>视频管理</title>
    <link href="/assets/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/assets/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <link href="/assets/css/animate.min.css" rel="stylesheet">
    <link href="/assets/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="/assets/css/icons.css" rel="stylesheet" />
    <link href="/assets/css/base.css" rel="stylesheet" />
</head>
<body class="gray-bg">
    <form id="Form1" runat="server" class="form-horizontal">
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-sm-12">
                <ol class="breadcrumb">
                    <li>
                        <a href="/root/index.aspx">首页</a>
                    </li>
                    <li>
                        <a href="list.aspx?types=<%=types %>">视频列表</a>
                    </li>
                </ol>
            </div>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="col-sm-12">
                <div class="ibox float-e-margins qsearch">
                    <div class="ibox-title">
                        <h5>搜索</h5>
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label class="col-sm-1 control-label tr">标题</label>
                                    <div class="col-sm-2">
                                        <asp:TextBox ID="txt_title" runat="server" class="form-control input-sm" placeholder="请输入关键词"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1">
                                        <span class="input-group-btn">
                                            <asp:LinkButton ID="btn_search" runat="server" OnClick="btn_search_Click" class="btn btn-success btn-sm"><i class="fa fa-search m-r-5"></i>搜索</asp:LinkButton>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>视频管理</h5>
                            </div>
                            <div class="ibox-content">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="m-b-30 fl">
                                            <a class=" btn btn-primary btn-sm" href="info.aspx?types=<%=types %>">新增 <i class="fa fa-plus"></i></a>
                                        </div>
                                        <div class="ml20 fl">
                                            <asp:LinkButton ID="lbtnDel" runat="server" OnClientClick="return confirm('确认删除？')"
                                                CssClass="btn btn-sm btn-danger" OnClick="btnDelete_Click">批量删除 <i class="fa fa-trash-o"></i></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>
                                                <input type="checkbox" class="qx">
                                            </th>
                                            <th>视频标题</th>
                                            <th>视频链接</th>
                                            <th>发布时间</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rp_list" runat="server">
                                            <ItemTemplate>
                                                <tr class="gradeA">
                                                    <td>
                                                        <input type="checkbox" class="np" name="aids" value="<%#Eval("id") %>">
                                                    </td>
                                                    <td><%#Eval("Title") %></td>
                                                    <%--<td><%#Eval("SeoTitle") %></td>--%>
                                                    <td><%#Eval("Url") %></td>
                                                    <td><%#Eval("addtime","{0:yyyy-MM-dd}") %></td>
                                                    <td class="actions">
                                                        <a href="info.aspx?types=<%=types %>&id=<%#Eval("id") %>">编辑</a>
                                                        <asp:LinkButton ID="lbtnDel" runat="server" OnClientClick="return confirm('确认删除？')"
                                                            CommandArgument='<%#Eval("ID") %>' CssClass="ml10" OnClick="lbtnDel_Click">删除</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                                <div class="row">
                                    <div class="jogger">
                                        <webdiyer:AspNetPager ID="aspnetpage" runat="server" FirstPageText="首页" LastPageText="尾页"
                                            NextPageText="下一页" PrevPageText="上一页" OnPageChanged="aspnetpage_PageChanged"
                                            HorizontalAlign="Center" PageIndexBoxType="DropDownList" ShowPageIndexBox="Always"
                                            SubmitButtonText="Go" TextAfterPageIndexBox="页" TextBeforePageIndexBox="转到" PageSize="10" LayoutType="Div">
                                        </webdiyer:AspNetPager>
                                    </div>
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
    <script src="/assets/js/base.js"></script>
    <script>
        $(document).ready(function () {
            load_xuanze();
        });
    </script>
</body>
</html>