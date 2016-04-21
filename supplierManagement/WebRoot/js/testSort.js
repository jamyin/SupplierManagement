<script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
$(function(){
				$(".pclass").bind('click',function(){
					var proVal = $(this).children(":selected").text();
					var cityVal = $(this).next().children(":selected").text();
				});
				$(".cclass").bind('click',function(){
					var proVal = $(this).prev().children(":selected").text();
					var cityVal = $(this).children(":selected").text();
				});
			});
		var province={
			'请选择':['请选择'],
			'服务':['请选择','筹划','外烩','场地','摄影'],
			'礼品':['请选择','大礼品','小礼品'],
			'食品':['请选择','熟食','冷冻'],
			'公共关系':['请选择','公共关系','政府机构','民间组织','赞助商'],
			};
		
		$(function(){
			//all provinces
			for(var p in province){
				$("<option />",{value:p, text:p}).appendTo("#provinces");
			};
			$(province['请选择']).each(function(i){
				$("<option />",{value:this, text:this}).appendTo("#cities");
			});
			$("#provinces").change(function(){
				$("#cities").html('');//clear city's select
				$(province[this.value]).each(function(j){
					$("<option />",{value:this, text:this}).appendTo("#cities");
				});
			});
		});