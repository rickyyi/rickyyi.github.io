<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>交易分析</title>
	<style>
		body {
			margin: 0 auto;
			height: 100%;
			
		}
		a {
			text-decoration: none;
			color:black;
		}
		ul {
			list-style-type: none;
		}
		.header {
    		height: 50px;
    		background: #6D88D2;
		}
		.logo {
		    float: left;
		    line-height: 2;
		    font-size: 24px;
		    margin-left: 40px;
		    color: white;
		}
		.tools {
		    float: right;
		    font-size: 18px;
		    line-height: 3;
		    margin-right: 75px;
		}

		.left {
		    background: #E4E4E4;
		    float: left;
		    height: 600px;
		    width: 14%;
		}
		.menu{
			padding: 0px;
		}
		.menu li {
			    line-height: 2;
			    text-align: center;
			    border: 1px gray solid;
			    background: #B4DCDA;	
		}
		.menu>li {
			    font-size: 17pt;
			    font-weight: 100;
			    font-family: arial;	
		}
		.menu li:hover {
			background: #B4DCDA;
		}
		.menu li ul	{
		    transition: 3s;
		    margin-left: -45px;
		     display:none; 
		}
		.menu li ul	li{
		    background: #CDCDE0;
		    font-size: 13pt;
		}
		.menu li:hover ul {
		    display:block;
		}
		.menu li ul li:hover{
		    background:#6D88D2;
		}
		.right {
		    float: left;
		    width: 86%;
		    height: 596px;
		}
		.tit {
			width: 80%;
		    margin-left: 10%;
		    margin-top: 18px;
		    background: thistle;
		    text-align: center;
		}
		.val {
			height:540px;
		}
		#Chart{
			width: 90%;
		    background: rgba(154, 154, 150, 0.27);
		    height: 500px;
		    margin: 0 auto;
		}
		tr.con>td {
		    background: tan;
		    height: 30px;
    		cursor: pointer;
		}
		tr.con>td:hover {
		    background: rgba(109, 136, 210, 0.25);
		}
	</style>
</head>
<body>
	<div class="header">
		<div class="nav">
			<div class="logo">
				水果小镇-后台管理系统
			</div>
			<div class="tools">
				<span class="welcome">
					欢迎您，<%-- <%=user.getUsername()%> --%>
				</span>
				<span class="logout">
					退出
				</span>
			</div>
		</div>
	</div>
	<div class="main">
		<div class="left">
			<ul class="menu">
				<li>用户管理
					<ul>
						<li>管理员</li>
						<li>用户</li>
					</ul>
				</li>
				<li><a href="<%=request.getContextPath()%>/admin/goodsManager/list">商品管理</a>
					<ul>
						<li><a href="<%=request.getContextPath()%>/admin/goodsManager/getGoods/0">添加商品</a></li>
						<li><a href="<%=request.getContextPath()%>/admin/goodsManager/list">商品列表</a></li>
					</ul>
				
				</li>
				<li><a href="<%=request.getContextPath()%>/admin/orderManager/list">订单管理</a></li>
				<li>评论管理</li>
				<li><a href="#">交易分析</a></li>
			</ul>
		</div>
		<div class="right">
			<table class="tit">
				<tr class="con">
					<td id="month">月销量分析</td>
					<td id="week">周销量分析</td>
					<td id="region">区域分析</td>
					<td>数据分析</td>
					<td>数据分析</td>
				</tr>
				<tr class="val">
					<td colspan="5">
						<div id="Chart">
						
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/static/js/echarts.min.js"></script>
	<script type="text/javascript">
        var myChart = echarts.init(document.getElementById('Chart'));
        // 指定图表的配置项和数据
		var option = {
		    title : {
		        text: '水果小镇最近一月销售额',
		        subtext: '2012-09',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        data: ['鲜果','生鲜','礼品','其他']
		    },
		    series : [
		        {
		            name: '商品分类',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[
		                {value:335, name:'鲜果'},
		                {value:310, name:'生鲜'},
		                {value:234, name:'礼品'},
		                {value:135, name:'其他'}
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
        myChart.setOption(option);
    </script>
    <script>
    	$("document").ready(function(){
    		$(".con>td").click(function(){
    			var currentObj = $(this).attr("id");
    			/* $(this).css("background","red"); */
    			/* $(this).siblings().css("background","tan"); */
    			switch (currentObj) {
    			case "month":
    				var myChart = echarts.init(document.getElementById('Chart'));
    		        // 指定图表的配置项和数据
    				var option = {
    				    title : {
    				        text: '水果小镇最近一月销售额',
    				        subtext: '2012-09',
    				        x:'center'
    				    },
    				    tooltip : {
    				        trigger: 'item',
    				        formatter: "{a} <br/>{b} : {c} ({d}%)"
    				    },
    				    legend: {
    				        orient: 'vertical',
    				        left: 'left',
    				        data: ['鲜果','生鲜','礼品','其他']
    				    },
    				    series : [
    				        {
    				            name: '商品分类',
    				            type: 'pie',
    				            radius : '55%',
    				            center: ['50%', '60%'],
    				            data:[
    				                {value:335, name:'鲜果'},
    				                {value:310, name:'生鲜'},
    				                {value:234, name:'礼品'},
    				                {value:135, name:'其他'}
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
    		        myChart.setOption(option);
    				break;
				case "week":
					var myChart = echarts.init(document.getElementById('Chart'));
					var option = {
						    tooltip : {
						        trigger: 'axis',
						        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
						            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
						        }
						    },
						    legend: {
						        data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎','百度','谷歌','必应','其他']
						    },
						    grid: {
						        left: '3%',
						        right: '4%',
						        bottom: '3%',
						        containLabel: true
						    },
						    xAxis : [
						        {
						            type : 'category',
						            data : ['周一','周二','周三','周四','周五','周六','周日']
						        }
						    ],
						    yAxis : [
						        {
						            type : 'value'
						        }
						    ],
						    series : [
						        {
						            name:'直接访问',
						            type:'bar',
						            data:[320, 332, 301, 334, 390, 330, 320]
						        },
						        {
						            name:'邮件营销',
						            type:'bar',
						            stack: '广告',
						            data:[120, 132, 101, 134, 90, 230, 210]
						        },
						        {
						            name:'联盟广告',
						            type:'bar',
						            stack: '广告',
						            data:[220, 182, 191, 234, 290, 330, 310]
						        },
						        {
						            name:'视频广告',
						            type:'bar',
						            stack: '广告',
						            data:[150, 232, 201, 154, 190, 330, 410]
						        },
						        {
						            name:'搜索引擎',
						            type:'bar',
						            data:[862, 1018, 964, 1026, 1679, 1600, 1570],
						            markLine : {
						                itemStyle:{
						                    normal:{
						                        lineStyle:{
						                            type: 'dashed'
						                        }
						                    }
						                },
						                data : [
						                    [{type : 'min'}, {type : 'max'}]
						                ]
						            }
						        },
						        {
						            name:'百度',
						            type:'bar',
						            barWidth : 5,
						            stack: '搜索引擎',
						            data:[620, 732, 701, 734, 1090, 1130, 1120]
						        },
						        {
						            name:'谷歌',
						            type:'bar',
						            stack: '搜索引擎',
						            data:[120, 132, 101, 134, 290, 230, 220]
						        },
						        {
						            name:'必应',
						            type:'bar',
						            stack: '搜索引擎',
						            data:[60, 72, 71, 74, 190, 130, 110]
						        },
						        {
						            name:'其他',
						            type:'bar',
						            stack: '搜索引擎',
						            data:[62, 82, 91, 84, 109, 110, 120]
						        }
						    ]
						};
					myChart.setOption(option);
					break;
				case "region":
				    var myChart = echarts.init(document.getElementById('Chart'));
				    var option = {
				        title: {
				            text : '上海地图',
				            subtext : '-。-'
				        },
				        tooltip : {
				            trigger: 'item',
				            formatter: function(a){
				                return a[2];
				            }
				        },
				        legend: {
				            orient: 'vertical',
				            x:'right',
				            data:['数据名称']
				        },
				        dataRange: {
				            min: 0,
				            max: 1000,
				            color:['orange','yellow'],
				            text:['高','低'],           // 文本，默认为数值文本
				            calculable : true
				        },
				        series: [
				            {
				                name: '数据名称',
				                type: 'map',
				                mapType: '上海',
				                selectedMode : 'single',
				                itemStyle:{
				                    normal:{label:{show:true}},
				                    emphasis:{label:{show:true}}
				                },
				                data:[
				                    {name: '崇明县',value: Math.round(Math.random()*1000)},
				                    {name: '宝山区',value: Math.round(Math.random()*1000)},
				                    {name: '嘉定区',value: Math.round(Math.random()*1000)},
				                    {name: '青浦区',value: Math.round(Math.random()*1000)},
				                    {name: '杨浦区',value: Math.round(Math.random()*1000)},
				                    {name: '虹口区',value: Math.round(Math.random()*1000)},
				                    {name: '闸北区',value: Math.round(Math.random()*1000)},
				                    {name: '普陀区',value: Math.round(Math.random()*1000)},
				                    {name: '静安区',value: Math.round(Math.random()*1000)},
				                    {name: '黄浦区',value: Math.round(Math.random()*1000)},
				                    {name: '卢湾区',value: Math.round(Math.random()*1000)},
				                    {name: '长宁区',value: Math.round(Math.random()*1000)},
				                    {name: '徐汇区',value: Math.round(Math.random()*1000)},
				                    {name: '浦东新区',value: Math.round(Math.random()*1000)},
				                    {name: '松江区',value: Math.round(Math.random()*1000)},
				                    {name: '闵行区',value: Math.round(Math.random()*1000)},
				                    {name: '金山区',value: Math.round(Math.random()*1000)},
				                    {name: '奉贤区',value: Math.round(Math.random()*1000)},
				                    {name: '南汇区',value: Math.round(Math.random()*1000)}
				                ]
				            }
				        ]
				    };
				    myChart.setOption(option);
					break;
				default:
					break;
				}
    		})
    	})
    </script>
</body>
</html>