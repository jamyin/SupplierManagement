<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'autoOne.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="/js/jquery.autocomplete.js"></script>
	<script type="text/javascript">
        var emails = [
            { name: "Peter Pan", to: "peter@pan.de" },
            { name: "Molly", to: "molly@yahoo.com" },
            { name: "Forneria Marconi", to: "live@japan.jp" },
            { name: "Master <em>Sync</em>", to: "205bw@samsung.com" },
            { name: "Dr. <strong>Tech</strong> de Log", to: "g15@logitech.com" },
            { name: "Don Corleone", to: "don@vegas.com" },
            { name: "Mc Chick", to: "info@donalds.org" },
            { name: "Donnie Darko", to: "dd@timeshift.info" },
            { name: "Quake The Net", to: "webmaster@quakenet.org" },
            { name: "Dr. Write", to: "write@writable.com" },
            { name: "GG Bond", to: "Bond@qq.com" },
            { name: "Zhuzhu Xia", to: "zhuzhu@qq.com" }
        ];

            $(function() {
                $('#keyword').autocomplete(emails, {
                    max: 12,    //列表里的条目数
                    minChars: 0,    //自动完成激活之前填入的最小字符
                    width: 400,     //提示的宽度，溢出隐藏
                    scrollHeight: 300,   //提示的高度，溢出显示滚动条
                    matchContains: true,    //包含匹配，就是data参数里的数据，是否只要包含文本框里的数据就显示
                    autoFill: false,    //自动填充
                    formatItem: function(row, i, max) {
                        return i + '/' + max + ':"' + row.name + '"[' + row.to + ']';
                    },
                    formatMatch: function(row, i, max) {
                        return row.name + row.to;
                    },
                    formatResult: function(row) {
                        return row.to;
                    }
                }).result(function(event, row, formatted) {
                    alert(row.to);
                });
            });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <input id="keyword" />
        <input id="getValue" value="GetValue" type="button" />
    </div>
    </form>
</body>
</html>
