<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="outinfo.aspx.cs" Inherits="Tc.Web.m.account.outinfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="format-detection" content="telephone=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title></title>
    <link href="../assets/css/aui.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <header class="aui-bar aui-bar-nav">
            <a class="aui-pull-left aui-btn" href="outs.aspx">
                <span class="aui-iconfont aui-icon-left"></span>
            </a>
            <div class="aui-title">记账</div>
        </header>
        <div class="aui-content aui-margin-b-15">
            <ul class="aui-list aui-form-list">
                <li class="aui-list-item">
                    <div class="aui-list-item-inner">
                        <div class="aui-list-item-label">
                            金额
                        </div>
                        <div class="aui-list-item-input">
                            <asp:TextBox runat="server" ID="txtMoney" placeholder="这里输入金额"></asp:TextBox>
                        </div>
                    </div>
                </li>
                <li class="aui-list-item">
                    <div class="aui-list-item-inner">
                        <div class="aui-list-item-label">
                            日期
                        </div>
                        <div class="aui-list-item-input">
                            <asp:TextBox runat="server" ID="txtDate" placeholder="这里选择日期"></asp:TextBox>
                        </div>
                    </div>
                </li>
                <li class="aui-list-item">
                    <div class="aui-list-item-inner">
                        <div class="aui-list-item-label">
                            账户
                        </div>
                        <div class="aui-list-item-input">
                            <asp:DropDownList runat="server" ID="ddlZhanghuid">
                                <asp:ListItem>选择账户</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </li>

                <li class="aui-list-item">
                    <div class="aui-list-item-inner">
                        <div class="aui-list-item-label">
                            备注
                        </div>
                        <div class="aui-list-item-input">
                            <asp:TextBox runat="server" ID="TextBox2" placeholder="备注"></asp:TextBox>
                        </div>
                    </div>
                </li>
            </ul>

        </div>
        <div class="aui-list-item-inner" style="margin-left:7%">
            <div class="aui-btn aui-btn-primary aui-btn-block aui-btn-outlined aui-btn-sm" style="width:95%">保存</div>
        </div>
    </form>
</body>
</html>
