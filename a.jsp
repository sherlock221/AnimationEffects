<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎页面</title>
<link rel="stylesheet" href="<%=basePath %>back/css/common.css" type="text/css" />
<script src="<%=basePath %>back/js/jquery.js" type="text/javascript"></script>
<script src="<%=basePath %>back/js/chart_js/highcharts.js"></script>
<script src="<%=basePath %>back/js/chart_js/modules/exporting.js"></script>
<script src="<%=basePath %>back/js/excanvas.js"></script>
<script src="<%=basePath %>back/js/Chart.js"></script>
<script type="text/javascript" src="<%=basePath%>back/js/WdatePicker.js"></script>
<script src="<%=basePath %>back/js/json2.js"></script>

<script>
//显示当前时间日期
setInterval("jnkc.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
//tab选项卡切换
</script>
<style>
	    body{
            padding: 0;
            margin: 0;
        }
        #canvas-holder{
            width:30%;
        }

        .canvas-base{
            width: 120px;
            height: 120px;
            position: relative;
        }
        .canvas-01{
        }

        .canvas-02{

        }
        .canvas-03{

        }

        .ib{
            display: inline-block;
        }

        #all-canvas > .canvas-main{
            border: 1px solid #ededed;
            padding: 20px;
            border-radius: 4px;
        }

        #all-canvas > b{

        }
        .canvas-main{
            position: relative;
        }
        .canvas-txt{
            position: absolute;
            top: 50%;
            left: 50%;
            text-align: center;
            margin-top: -12px;
            margin-left: -16px;
            font-size: 115%;
            font-weight: bold;


        }
        .bar{
            width: 650px;
            height: 330px;
        }
        .fontList{

            vertical-align: top;list-style: none; font-size: 14px;color: #555;
            text-align: left;padding: 0;margin-left: 20px;line-height: 30px;
            
        }
        
     	.num_li{
            heigth:25px;
            float:right;
        }
        .barFont{
            width: 200px;
            vertical-align: top;

        }
        .barList{
            list-style: none; font-size: 14px;color: #555;
            text-align: left;padding: 0;margin-left: 20px;line-height: 40px;
            margin-top: 110px;
        }
        .dot {
            width: 8px;
            height: 8px;
            border-radius: 20px;

            margin-right: 5px;
            vertical-align: middle;
        }
        .block{
            width: 12px;
            height: 12px;
            margin-right: 15px;
            vertical-align: middle;

        }
        .margin-r{
            margin-right: 20px;
        }
        .dataSearch{
            font-size: 16px;
            color: #555;
            margin: 20px 0;
        }

        .input-text{
            width: 150px;
            padding: 5px 10px;
            font-size: 14px;
            border-radius: 4px;
            border: 1px solid #ededed;
        }
        .button{
            text-align: center;
            background-color: #3592e0;
            border: none;
            width: 120px;
            height: 28px;
            border-radius: 4px;
            color: #fff;
            font-size: 14px;
        }
        .button:hover{
            background-color: rgba(53,146,224,0.9);
        }
        
        
        .y_span{
        	font-size: 16px;
        	color:#c4c4c4;
        }
	
</style>
</head>
<body style="background:#FFF;">
<div class="breadNight">首页</div>
<div class="Content">
<!-- --------主本内容开始---------- -->
	<div class="data">
		<div class="data_left">
        	<div class="img_tx"><img src="<%=basePath %>back/images/tx.gif" /></div>
            <a href="modifyInfo.jsp">个人资料</a>
        </div>
            <div class="data_right"><span>${employee.employee_name}</span>今天是：<b id="jnkc"></b></div>
            <div class="data_right"><span></span>上次登录时间为：<b>${employee.lastlogin_time}</b><span></span>活动时间为：<b>${employee.duration}</b></div>
            <div class="data_right" id='eventdata'></div>
	</div>
	
	
    <div class="tjbb">	
    		<P style="font-size: 120%;color: #555;text-align: center;">当日数据统计</P>

<div style="text-align: center;" id="all-canvas">

    <div class="canvas-main ib margin-r">
        <div class="canvas-base ib">
            <span   class="ib  canvas-01">
            <canvas id="chart-area1" width="120" height="120"/>
            </span>

            <span id="house_add" class="ib canvas-txt " style="color: #fbd474">+18</span>
        </div>


        <ul class="ib fontList" style="">
            <li class=""><span class="dot ib" style=" border: 3px solid #fbd474;"></span>今日录入户数
            <li class="num_li"><span id="t_house_span">50</span></li>
            </li>
            <li style="clear: both"><span class="dot ib" style=" border: 3px solid #c4c4c4;"></span>昨日录入户数</li>
             <li class="num_li"><span class="y_span" id="y_house_span">50</span></li>
        </ul>
        
    </div>
    <div class="canvas-main ib margin-r">
        <div class="canvas-base ib">
        <span   class="ib canvas-02">
        <canvas id="chart-area2" width="120" height="120"/>
        </span>

        <span id=people_add class="ib canvas-txt"  style="color: #3db1d7">+28</span>
        </div>

        <ul class="ib fontList" style="">
            <li ><span class="dot ib" style=" border: 3px solid #3db1d7;"></span>今日录入人数</li>
             <li class="num_li"><span style="color:#3db1d7;" id="t_people_span">50</span></li>
            <li style="clear: both"><span class="dot ib" style=" border: 3px solid #c4c4c4;"></span>昨日录入人数</li>
              <li class="num_li"><span class="y_span" id="y_people_span">50</span></li>
        </ul>
    </div>

    <div class="canvas-main ib">
        <div class="canvas-base ib">
        <span   class="ib  canvas-03">
             <canvas id="chart-area3" width="120" height="120"/>
        </span>
        <span id="dan_add" class="ib canvas-txt" style="color: #b18ccb">+38</span>
        </div>

        <ul class="ib fontList" style="">
            <li><span class="dot ib" style=" border: 3px solid #b18ccb;"></span>今日制单数量</li>
            <li class="num_li"><span style="color:#b18ccb;"  id="t_dan_span">50</span></li>
            <li style="clear: both"><span class="dot ib" style=" border: 3px solid #c4c4c4;"></span>昨日制单数量</li>
               <li class="num_li"><span class="y_span" id="y_dan_span">50</span></li>
        </ul>
   </div>
</div>

	<P style="font-size: 120%;color: #555;text-align: center;">历史数据统计</P>
		<div class="dataSearch" style="text-align: center">
		      请选择时间段： <input id="s_time" type="text" onclick="WdatePicker();" class="ib input-text" style="margin-right: 10px"/>-
		                   <input id="e_time" type="text" onclick="WdatePicker();" class="ib input-text" style="margin-left: 10px"/>
		                  <input id="select_button" type="button" class="ib button" style="margin-left: 10px" value="查询"/>
		</div>
		
		<div  style="text-align: center" id="div_canvas">
		
		      <div class="ib bar" id="s_bar">
		       <canvas id="chart-area4" />
		      </div>
		
		       <div class="ib barFont">
		           <ul class="ib barList" style="">
		               <li><span class="block ib" style=" background-color: #fbd474;"></span>录入户数</li>
		               <li><span class="block ib" style=" background-color: #3db1d7;"></span>录入人数</li>
		               <li><span class="block ib" style=" background-color: #b18ccb;"></span>制单数量</li>
		           </ul>
		       </div>
			       <div id="see_houseButton" style="text-align: center;display: none;">
 					   <input type="button" class="ib button" style="margin: 0px" value="查看户详情"/>
					</div>

		</div>
	
    </div> 
</div>
</body>
<script language="javascript" type="text/javascript">
var dept_id =${session.employee.employee_department_id};
$(document).ready(function(e) {	
	$.post("<%=basePath%>/datasyn/findWorkbenchData.action",function(data){
		if(data!=null){
			  var workDataStr = data.workDataStr;
			  $("#eventdata").html(workDataStr);	  
		}
	});
	
	loadDoughnut();
	loadBar('','');
	if(dept_id=='55'){
		$('#see_houseButton').show();
	}
});


	$('#see_houseButton').on('click',function(){
		window.location.href='<%=path%>/householdinfo/findHouseholdAll.action';
	});
	
	$('#select_button').on('click',function(){
		var s_time = $('#s_time').val();
		var e_time = $('#e_time').val();
		loadBar(s_time,e_time);
	});


	//初始饼图
	function loadDoughnut(){
		var url = '<%=path%>/employee/statistic.action';
		$.post(url,function(data){
			if(data.houseCountList!=null){
						//今天
					var value = data.houseCountList[1];
					var t_house= value.huCount;
					var t_people= value.renCount;
					var t_dan= value.eventCount;
					
					//昨天
					value = data.houseCountList[0];
					var y_house = value.huCount;
					var y_people= value.renCount;
					var y_dan= value.eventCount;
					$('#house_add').html(todayAdd(t_house,y_house));
					$('#t_house_span').html(t_house);
					$('#y_house_span').html(y_house);
					
					n1 = new Number(t_people);
					n2 = new Number(y_people);
					$('#people_add').html(todayAdd(t_people,y_people));
					$('#t_people_span').html(t_people);
					$('#y_people_span').html(y_people);
					
					
					n1 = new Number(t_dan);
					n2 = new Number(y_dan);
					$('#dan_add').html(todayAdd(t_dan,y_dan));
					$('#t_dan_span').html(t_dan);
					$('#y_dan_span').html(y_dan);
					
							//饼图 01 house
				   var canvas01_Data = [
				       {
				           value: t_house,
				           color: "#fbd474",
				           highlight: "#fcdd90",
				           label: "今天"
				       },
				       {
				           value: y_house,
				           color:"#c4c4c4",
				           highlight: "#d0d0d0",
				           label: "昨天"
				       }
				   ];
			
			       //饼图 02people
			       var canvas02_Data = [
			           {
			               value: t_people,
			               color:"#3db1d7",
			               highlight: "#64c1df",
			               label: "今天"
			           },
			           {
			               value: y_people,
			               color: "#c4c4c4",
			               highlight: "#d0d0d0",
			               label: "昨天"
			           }
			       ];
			       
			       //饼图 03 dan
			       var canvas03_Data = [
			           {
			               value: t_dan,
			               color:"#b18ccb",
			               highlight: "#c1a3d5",
			               label: "今天"
			           },
			           {
			               value: y_dan,
			               color: "#c4c4c4",
			               highlight: "#d0d0d0",
			               label: "昨天"
			           }
			       ];
				
				
					   var ctx1 = document.getElementById("chart-area1").getContext("2d");
				       window.myDoughnut = new Chart(ctx1).Doughnut(canvas01_Data, {responsive : true});
				
				      //饼图02 初始化
				       var ctx2 = document.getElementById("chart-area2").getContext("2d");
				       new Chart(ctx2).Doughnut(canvas02_Data, {responsive : true});
				
				       //饼图03 初始化
				       var ctx3 = document.getElementById("chart-area3").getContext("2d");
				       new Chart(ctx3).Doughnut(canvas03_Data, {responsive : true});
			}
		},'json');
	}
	
	var s_time;
	var e_time
	//初始树状图
	function loadBar(s_time,e_time){
		this.s_time = s_time;
		this.e_time = e_time;
		bar();
	}
	
	
	
	function bar(){
			 //树状图
		       var ctx4 = document.getElementById("chart-area4").getContext("2d");
		       	 
			var url = '<%=path%>/employee/classStatistic.action';
		var param={'startTime':s_time,'endTime':e_time};
		$.post(url,param,function(data){
			var peopleArys = new Array();
				var houseArys = new Array();
				var danArys = new Array();
				var labels = new Array();
			if(data.houseCountList!=null){
				var list = data.houseCountList;
				$(list).each(function(index,value){
					peopleArys.push(value.renCount);
					houseArys.push(value.huCount);
					danArys.push(value.eventCount);
					if(dept_id=='55'){
						labels.push(value.shequName);
					}else{
						labels.push(value.employeeName);
					}
				});
				
			}else{
					peopleArys.push(0);
					houseArys.push(0);
					danArys.push(0);
			}
			  //树状图
		       var bar_data = {
		           labels : ["冯家屯社区","齐家湾社区","后桥社区","米粮山社区","林虎山社区","迎宾路社区"],
		           datasets : [
		               {
		                   fillColor : "rgba(251,212,116,0.7)",
		                   strokeColor : "#ffffff",
		                   data : houseArys
		               },
		               {
		                   fillColor : "rgba(61,177,215,0.7)",
		                   strokeColor : "#ffffff",
		                   data : peopleArys
		               },
		               {
		                   fillColor : "rgba(177,144,203,0.7)",
		                   strokeColor : "#ffffff",
		                   data : danArys
		               }
		           ]
		       };
		       new Chart(ctx4).Bar(bar_data, {
		           responsive : true,
		           scaleShowLabels : true,
		           scaleShowGridLines : true,
		           barShowStroke : false,
		           scaleFontSize : 16
		       });	
		},'json');
ctx4.fillStyle="ffffff";//白色为例子；
ctx4.fillRect(400,100,400,100);
		ctx4.clearRect(400,100,imageObj.width,100);
			
			
	}
	
	
	var imageObj = new Image();
imageObj.src = "PublicFiles/2.jpg";
imageObj.onload = function(){
context.drawImage(imageObj,400,100);
};

	

	function todayAdd(v1,v2){
		var n1 = new Number(v1);
		var n2 = new Number(v2);
		var value = n1-n2;
		if(value>0)
			return '+'+value;
		else
			return value;	
	}


</script>
