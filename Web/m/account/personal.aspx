<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="personal.aspx.cs" Inherits="Tc.Web.m.account.personal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="format-detection" content="telephone=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title></title>
    <link href="../assets/css/aui.css" rel="stylesheet" />
    <script src="../../pc/assets/js/jquery.1.8.2.min.js"></script>
    <script src="../assets/script/echarts.js"></script>
    <style type="text/css">
        .text-white {
            color: #ffffff !important;
        }

        .text-light {
            color: #999 !important;
        }

        .bg-white {
            background-color: #ffffff;
        }

        .aui-grid [class*=aui-col-] {
            padding: 0;
        }

        .user-info {
            width: 150%;
            position: relative;
            left: -25%;
            padding-left: 25%;
            border-bottom-left-radius: 50%;
            border-bottom-right-radius: 50%;
            padding-bottom: 1.5rem;
        }

        .aui-grid .aui-dot {
            top: 0rem;
        }

        .label-cont {
            display: block;
            height: 1.8rem;
            line-height: 1.8rem;
        }

        .label-icon {
            display: block;
            width: 1.8rem;
            height: 1.8rem;
            border-radius: 50%;
            margin: 0 auto;
            line-height: 1.8rem;
            text-align: center;
        }

        .label-cont .aui-iconfont {
            font-size: 1rem;
        }

        .label-icon .aui-iconfont {
            color: #ffffff;
            font-size: 0.8rem;
        }

        .font-size-26 {
            font-size: 1.3rem !important;
        }

        .aui-grid-label {
            color: #666 !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="aui-bar aui-bar-nav" id="aui-header">
            <div class="aui-title">我的</div>
        </header>
        <section class="aui-content bg-white aui-margin-b-15">
            <div class="aui-list aui-media-list aui-list-noborder aui-bg-info user-info">
                <div class="aui-list-item aui-list-item-middle">
                    <div class="aui-media-list-item-inner ">
                        <div class="aui-list-item-media" style="width: 3rem;">
                            <img src="../assets/image/poster.jpg" class="aui-img-round" />
                        </div>
                        <div class="aui-list-item-inner">
                            <div class="aui-list-item-text text-white aui-font-size-18">昵称</div>
                            <div class="aui-list-item-text text-white">
                                <div><i class="aui-iconfont aui-icon-mobile aui-font-size-14"></i>1595878969</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="aui-grid aui-margin-t-15 aui-margin-b-15">
                <div class="aui-row">
                    <div class="aui-col-5">
                        <i class="aui-iconfont aui-icon-star font-size-26"></i>
                        <div class="aui-grid-label aui-font-size-12">出账</div>
                    </div>
                    <div class="aui-col-5">
                        <i class="aui-iconfont aui-icon-menu font-size-26"></i>
                        <div class="aui-grid-label aui-font-size-12">入账</div>
                    </div>
                    <div class="aui-col-5">
                        <i class="aui-iconfont aui-icon-refresh font-size-26"></i>
                        <div class="aui-grid-label aui-font-size-12">汇总</div>
                    </div>
                    <div class="aui-col-5">
                        <i class="aui-iconfont aui-icon-my font-size-26"></i>
                        <div class="aui-grid-label aui-font-size-12">账户</div>
                    </div>
                    <div class="aui-col-5 aui-border-l">
                        <i class="aui-iconfont aui-icon-calendar font-size-26"></i>
                        <div class="aui-grid-label aui-font-size-12">账单</div>
                    </div>
                </div>
            </div>
        </section>

        <section style="margin-bottom:15%">
            <div id="main" style="width: 100%;height:300px;"></div>
        </section>
        <section style="margin-bottom:15%">
            <div id="main1" style="width: 100%;height:300px;"></div>
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
            <div class="aui-bar-tab-item" onclick="javascript:location.href='account.aspx'">
                <i class="aui-iconfont aui-icon-menu"></i>
                <div class="aui-bar-tab-label">账户</div>
            </div>
            <div class="aui-bar-tab-item aui-active" onclick="javascript:location.href='personal.aspx'">
                <i class="aui-iconfont aui-icon-my"></i>
                <div class="aui-bar-tab-label">我的</div>
            </div>
        </footer>
    </form>
</body>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var outs = echarts.init(document.getElementById('main'));
        option1 = {
            title: {
                text: '年度汇总',
                subtext: '出账',
                x: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: ['支出', '借出', '还债']
            },
            series: [
                {
                    name: '来源',
                    type: 'pie',
                    radius: '55%',
                    center: ['50%', '60%'],
                    data: [
                        { value: 10000, name: '支出' },
                        { value: 2000, name: '借出' },
                        { value: 1000, name: '还债' }
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        
        // 使用刚指定的配置项和数据显示图表。
        outs.setOption(option1);
        var puts = echarts.init(document.getElementById('main1'));
        option2 = {
            title: {
                text: '年度汇总',
                subtext: '进账',
                x: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: ['收入', '借入', '收债']
            },
            series: [
                {
                    name: '来源',
                    type: 'pie',
                    radius: '55%',
                    center: ['50%', '60%'],
                    data: [
                        { value: 10000, name: '收入' },
                        { value: 200, name: '借入' },
                        { value: 1000, name: '收债' }
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        puts.setOption(option2);

    </script>
</html>
