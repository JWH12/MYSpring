<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>
</head>
<style>
</style>
<body>
	<div id="app">
		안녕하세요.
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	lisg : [], // 여러개의 값을 받을 때 사용된다
    	info : {} // 단일 값을 받을 때 사용된다
     
    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"/student/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.list = data.list;
                }
            }); 
        }
        ,fnGetInfo : function(){ 
            var self = this;
            var nparmap = {stuNo : "20153075 "};
            $.ajax({
                url:"/student/info.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {  
                	console.log(data);
	                self.info = data.info;
                }
            }); 
        } 

    }   
    , created: function () {
    	var self = this;
    	self.fnGetInfo();
	}
});
</script>
