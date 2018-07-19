<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="enter.aspx.cs" Inherits="Tc.Web.m.account.enter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="format-detection" content="telephone=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title></title>
    <link href="../assets/css/aui.css" rel="stylesheet" />
    <script src="../assets/layer/layer.js"></script>
</head>

<body>
    <form id="form1" runat="server">
        <header class="aui-bar aui-bar-nav">
            <div class="aui-title">入账</div>
            <a class="aui-pull-right aui-btn">
                <span class="aui-iconfont aui-icon-menu"></span>
            </a>
        </header>
        <section class="aui-content">
            <div class="aui-card-list">
                <div class="aui-card-list-content-padded">
                    <div class=" aui-margin-15">
                        <h1 style="text-align: center; color: Orangered">100</h1>
                        <h5 style="text-align: center;">年度收入</h5>
                    </div>
                </div>
            </div>
        </section>
        <div class="aui-margin-l-15" style="margin-top: -2%;">
            <span style="color: black; margin-right: 3%">2018年7月</span>
            <span style="color: #757575">支出 3000.00￥</span>
        </div>
        <div class="aui-card-list">
            <div class="aui-card-list-header aui-margin-5" style="border-bottom: 0.1px solid #dddddd">
                <div class="aui-col-xs-4 tr">
                    吃饭
                </div>
                <div class="aui-col-xs-8 tr" style="text-align: right;">
                    50
                </div>
            </div>
            <div class="aui-card-list-content-padded" style="color: #757575">
                <div class="aui-row aui-row aui-margin-b-5">
                    <div class="aui-col-xs-4">
                        付款日期
                    </div>
                    <div class="aui-col-xs-8 tr" style="text-align: right;">
                        2018-7-19
                    </div>
                </div>
                <div class="aui-row aui-row aui-margin-b-5">
                    <div class="aui-col-xs-4">
                        付款方式
                    </div>
                    <div class="aui-col-xs-8 tr" style="text-align: right;">
                        微信
                    </div>
                </div>
            </div>

        </div>
        <div class="aui-card-list">
            <div class="aui-card-list-header aui-margin-5" style="border-bottom: 0.1px solid #dddddd">
                <div class="aui-col-xs-4 tr">
                    吃饭
                </div>
                <div class="aui-col-xs-8 tr" style="text-align: right;">
                    50
                </div>
            </div>
            <div class="aui-card-list-content-padded" style="color: #757575">
                <div class="aui-row aui-row aui-margin-b-5">
                    <div class="aui-col-xs-4">
                        付款日期
                    </div>
                    <div class="aui-col-xs-8 tr" style="text-align: right;">
                        2018-7-19
                    </div>
                </div>
                <div class="aui-row aui-row aui-margin-b-5">
                    <div class="aui-col-xs-4">
                        付款方式
                    </div>
                    <div class="aui-col-xs-8 tr" style="text-align: right;">
                        微信
                    </div>
                </div>
            </div>
        </div>

        <footer class="aui-bar aui-bar-tab" id="footer">
            <div class="aui-bar-tab-item" onclick="javascript:location.href='outs.aspx'">
                <i class="aui-iconfont aui-icon-star"></i>
                <div class="aui-bar-tab-label">出账</div>
            </div>
            <div class="aui-bar-tab-item aui-active" onclick="javascript:location.href='enter.aspx'">
                <i class="aui-iconfont aui-icon-calendar"></i>
                <div class="aui-bar-tab-label">入账</div>
            </div>
            <div class="aui-bar-tab-item" onclick="javascript:location.href='account.aspx'">
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
