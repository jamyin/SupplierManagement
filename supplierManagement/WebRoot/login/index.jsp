<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>弹出窗体Demo演示</title>
<link rel="Stylesheet" type="text/css" href="DialogBySHF.min.css" />
</head>

<body>
    <input type="button" value="弹出提示框" id="btnAlert" />
    <input type="button" value="弹出确认框" id="btnConfirm" />
    <input type="button" value="引用其他页面" id="btnDialog" />
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="DialogBySHF.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#btnAlert").click(function () {
            $.DialogBySHF.Alert({ Width: 400, Height: 300, Title: "提示信息", Content: '你好，这是弹出提示，即JS中的alert', ConfirmFun: test });
        })
        $("#btnConfirm").click(function () {
            $.DialogBySHF.Confirm({ Width: 400, Height: 300, Title: "提示信息", Content: '你好，这是确认信息，类似于JS中的confirm', ConfirmFun: test, CancelFun: testCancel });
        })
        $("#btnDialog").click(function () {
            $.DialogBySHF.Dialog({ Width: 1024, Height: 768, Title: "搜狐网站", URL: 'http://www.sohu.com' });
        })
    })
    function test() {
        $.DialogBySHF.Alert({ Width: 400, Height: 300, Title: "确认后执行方法", Content: '确认后执行的方法' });
    }
    function testCancel() {
        $.DialogBySHF.Alert({ Width: 400, Height: 300, Title: "取消后执行方法", Content: '取消后执行的方法' });
    }
</script>
</body>
</html>
