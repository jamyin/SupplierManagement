<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head runat="server">
      <title>AutoComplate</title>
      <script type="text/javascript" src="/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="/js/jquery.autocomplete.js"></script>
    <link rel="Stylesheet" href="/js/jquery.autocomplete.css" />
<script type="text/javascript">
        $(function() {
            var data = "Core Selectors Attributes Traversing Manipulation CSS Events Effects Ajax Utilities".split(" ");

            $('#keyword').autocomplete(data).result(function(event, data, formatted) {
                alert(data);
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
