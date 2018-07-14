<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="list.aspx.cs" Inherits="Tc.WebAdmin.root.zidian.list" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>字典管理</title>
    <link href="/assets/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/assets/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <link href="/assets/css/animate.min.css" rel="stylesheet">
    <link href="/assets/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="/assets/css/icons.css" rel="stylesheet" />
    <link href="/assets/css/base.css" rel="stylesheet" />
</head>

<body class="gray-bg">
    <form runat="server">
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-sm-12">
                <ol class="breadcrumb">
                    <li>
                        <a href="/root/index.aspx">首页</a>
                    </li>
                    <li>
                        <a href="list.aspx?types=<%=types %>">字典列表</a>
                    </li>
                </ol>
            </div>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>字典管理</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div>
                                        <a id="addToTable" class="btn btn-sm btn-primary" href="info.aspx?types=<%=types %>">新增 <i class="fa fa-plus"></i></a>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>主键ID</th>
                                        <th>名称</th>
                                        <th>排序(小->大)</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rp_list" runat="server">
                                        <ItemTemplate>
                                            <tr class="gradeA">
                                                <td><%#Eval("ID") %></td>
                                                <td><%#Eval("Name") %></td>
                                                <td><%#Eval("Paixu") %></td>
                                                <td class="actions">
                                                    <a href="info.aspx?id=<%#Eval("id") %>&types=<%=types %>">编辑</a>
                                                    <asp:LinkButton ID="lbtnDel" runat="server" OnClientClick="return confirm('确认删除？')"
                                                        CommandArgument='<%#Eval("ID") %>' CssClass="ml10" OnClick="lbtnDel_Click">删除</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="/assets/js/jquery.min.js?v=2.1.4"></script>
    <script src="/assets/js/bootstrap.min.js?v=3.3.6"></script>
    

    <script>
    </script>
</body>
</html>