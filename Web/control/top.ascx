<%@ Control Language="C#" AutoEventWireup="true" %>
<div class="header">
    <div class="logo">
        <a href="/index.aspx">
            <img src="<%=LibFile.get_img(PB.Get("weblogo"),"","") %>" alt="<%=PB.Get("webname") %>" />
        </a>
    </div>
    <div class="nav">
        <div class="nav-icon"></div>
        <div class="nav-bg"></div>
        <ul id="menu">
            <% var dhlist = LibFenlei.GetFenlei("types='dh'"); %>
            <%
                foreach (var item in dhlist)
                {
            %>
            <li><a href="<%=item.Url %>" target="_self"><%=item.Name %></a></li>
            <%
                }
            %>
        </ul>
        <div class="home-info"></div>
    </div>
</div>

<script>
    $(function () {

        var strUrl, strHref;
        var Navs = document.getElementById("menu").getElementsByTagName("a");

        strUrl = location.href.toLowerCase();
        for (var i = 0; i < Navs.length; i++) {
            if (strUrl.indexOf(Navs[i].getAttribute("href")) != -1) {
                Navs[i].parentElement.className = "on";
            } else {
                Navs[i].parentElement.className = "";
            }
        }
        if ($("#menu li.on").length == 0) {
            Navs[0].className = "on";
        }
    })
</script>
