<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/resources/responsivegridsystem/css/col.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/responsivegridsystem/css/5cols.css"
	rel="stylesheet">
<script>
  /**
   * @author fengking
   * 
   * @requires jQuery,EasyUI,jQuery cookie plugin
   * 
   * 更换EasyUI主题的方法
   * 
   * @param themeName
   *            主题名称
   */
  changeTheme = function(themeName) {
    var $easyuiTheme = $('#easyuiTheme');
    var url = $easyuiTheme.attr('href');
    var href = "${pageContext.request.contextPath}/resources/easyui/themes/" + themeName + '/easyui.css';
    $easyuiTheme.attr('href', href);

    var $iframe = $('iframe');
    if ($iframe.length > 0) {
      for (var i = 0; i < $iframe.length; i++) {
        var ifr = $iframe[i];
        $(ifr).contents().find('#easyuiTheme').attr('href', href);
      }
    }

    $.cookie('easyuiThemeName', themeName, {
      expires : 7
    });
  };

  function logout(flag) {
    $.ajax({
      url : '${pageContext.request.contextPath}/user/logout',
      method : 'post',
      success : function(result) {
        $.messager.show({
          title : '提示',
          msg : '您已退出成功!即将返回首页...'
        });
        setTimeout(function() {
          window.location.href = 'index.html';
        }, 1000);
      }
    });
  }
</script>
</head>
<div style="position: absolute; left: 0px; bottom: 7px;">
	<img src="${pageContext.request.contextPath}/resources/images/tj.jpg"
		alt="Smiley face" height="42" width="42">
	<h2 style="display: inline">同济大学软件学院毕业设计选题系统</h2>
</div>
<div style="position: absolute; right: 0px; bottom: 0px;">
	<a href="javascript:void(0);" class="easyui-menubutton"
		data-options="menu:'#layout_north_pfMenu',iconCls:'icon-ok'">更换皮肤</a>
	<a href="javascript:void(0);" class="easyui-menubutton"
		data-options="menu:'#layout_north_zxMenu',iconCls:'icon-back'">注销</a>
</div>
<div id="layout_north_zxMenu" style="width: 100px; display: none;">
	<div class="menu-sep"></div>
	<div onclick="logout(true);" data-options="">退出系统</div>
</div>
<div id="layout_north_pfMenu" style="width: 120px; display: none;">
	<div onclick="changeTheme('default');">default</div>
	<div onclick="changeTheme('gray');">gray</div>
	<div onclick="changeTheme('bootstrap');">bootstrap</div>
	<div onclick="changeTheme('black');">black</div>
	<div onclick="changeTheme('metro');">metro</div>
	<div onclick="changeTheme('ui-cupertino');">cupertino</div>
	<div onclick="changeTheme('ui-dark-hive');">dark-hive</div>
	<div onclick="changeTheme('ui-pepper-grinder');">pepper-grinder</div>
	<div onclick="changeTheme('ui-sunny');">sunny</div>
</div>
</body>
</html>