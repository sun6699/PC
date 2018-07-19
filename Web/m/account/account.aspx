<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="Tc.Web.m.account.account" %>

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
            <div class="aui-title">账户管理</div>
        </header>
        <section class="aui-content-padded">
            <div class="aui-card-list">
                <div class="aui-card-list-header">
                    中国工商银行
                </div>
                <div class="aui-card-list-content-padded">
                    卡号：6868512368912333
                    <span style="float: right">银行卡</span>
                </div>
                <div class="aui-card-list-footer" style="text-align: right; display: block">
                    余额:1000
                </div>
            </div>
        </section>
        <section class="aui-content-padded">
            <div class="aui-card-list">
                <div class="aui-card-list-header">
                    中国建设银行
                </div>
                <div class="aui-card-list-content-padded">
                    卡号：6868512368912333
                    <span style="float: right">信用卡</span>
                </div>
                <div class="aui-card-list-footer" style="text-align: right; display: block">
                    余额:1000.00
                </div>
            </div>
        </section>
        <section class="aui-content-padded">
            <div class="aui-card-list">
                <div class="aui-card-list-header">
                    微信
                </div>
                <div class="aui-card-list-content-padded">
                    卡号：8888888888888888
                    <span style="float: right">虚拟账户</span>
                </div>
                <div class="aui-card-list-footer" style="text-align: right; display: block">
                    余额:1000.00
                </div>
            </div>
        </section>
        <section class="aui-content-padded">
            <div class="aui-card-list">
                <div class="aui-card-list-header">
                    支付宝
                </div>
                <div class="aui-card-list-content-padded">
                    卡号：8888888888888888
                    <span style="float: right">虚拟账户</span>
                </div>
                <div class="aui-card-list-footer" style="text-align: right; display: block">
                    余额:1000.00
                </div>
            </div>
        </section>
        <footer class="aui-bar aui-bar-tab" id="footer">
            <div class="aui-bar-tab-item" onclick="javascript:location.href='outs.aspx'">
                <i class="aui-iconfont aui-icon-star"></i>
                <div class="aui-bar-tab-label">出账</div>
            </div>
            <div class="aui-bar-tab-item" onclick="javascript:location.href='enter.aspx'">
                <i class="aui-iconfont aui-icon-calendar"></i>
                <div class="aui-bar-tab-label">入账</div>
            </div>
            <div class="aui-bar-tab-item aui-active" onclick="javascript:location.href='account.aspx'">
                <i class="aui-iconfont aui-icon-menu"></i>
                <div class="aui-bar-tab-label">账户</div>
            </div>
            <div class="aui-bar-tab-item" onclick="javascript:location.href='personal.aspx'">
                <i class="aui-iconfont aui-icon-my"></i>
                <div class="aui-bar-tab-label">我的</div>
            </div>
        </footer>
    </form>
</body>
</html>
