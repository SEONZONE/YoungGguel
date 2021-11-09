<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta http-equiv="content-language" content="en" />
	<meta name="robots" content="noindex,nofollow" />
	 <!-- RESET -->
	<link rel="stylesheet" media="screen,projection" type="text/css" href="/movie/view/jsp/Admin/css/reset.css" />
	<!-- MAIN STYLE SHEET -->
	<link rel="stylesheet" media="screen,projection" type="text/css" href="/movie/view/jsp/Admin/css/main.css" /> 
	 <!-- DEFAULT: 2 COLUMNS -->
	<link rel="stylesheet" media="screen,projection" type="text/css" href="/movie/view/jsp/Admin/css/2col.css" title="2col" />
	<link rel="stylesheet" type="text/css" href="/movie/view/jsp/Admin/css/AdminUser.css" />
	<!-- ALTERNATE: 1 COLUMN -->
	<link rel="alternate stylesheet" media="screen,projection" type="text/css" href="/movie/view/jsp/Admin/css/1col.css" title="1col" /> 
	<!--[if lte IE 6]><link rel="stylesheet" media="screen,projection" type="text/css" href="css/main-ie6.css" /><![endif]--> <!-- MSIE6 -->
	<!-- GRAPHIC THEME -->
	<link rel="stylesheet" media="screen,projection" type="text/css" href="/movie/view/jsp/Admin/css/style.css" /> 
	<link rel="stylesheet" type="text/css" href="/movie/view/jsp/Admin/css/userAdminstyle.css" /> 
	
	<script type="text/javascript" src="/movie/view/jsp/Admin/js/jquery.js"></script>
	<script type="text/javascript" src="/movie/view/jsp/Admin/js/switcher.js"></script>


<title>영끌 관리자</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
var USERID="";
var USERPW="";
var USERTEL="";
var USERNAME="";
var USERBIRTH="";
var USEREMAIL="";
var USERGENDER="";
	  //버튼 클릭시 해당하는 아이디 받아오기
  $(function(){
	  
	  /* 
		      $('input#ckbtn').click(function(){
			  imsi=$("input#ckbtn").val();
			  alert(imsi);
			});   */
			
			
			
		// 수정 버튼
			 $(document).on('click', '#modifyUser', function(){
				 
				 $("input[name='ckbtn1']:checked").each(function(){
						imsi="";
						 var imsi = $(this).val();
						 alert(imsi);
					
				   UserList('/movie/admin/selectOneUser.do',{userId:imsi},'json','modify');
				 });

			  });
		
		
				//수정 완료 버튼 (폼 제출)
		 $(document).on('click', '#commitmodifyMovie', function(){
			 
			 //var user_list;
			 
			 userid=$("input[name=USERID_sub]").val();
			  userpw=$("input[name=USERPW_sub]").val();
			    usertel=$("input[name=USERTEL_sub]").val();
			    username=$("input[name=USERNAME_sub]").val();
			    userbirth=$("input[name=USERBIRTH_sub]").val();
			   useremail=$("input[name=USEREMAIL_sub]").val();
			    usergender=$("input[name=USERGENDER_sub]").val();
			    
			    /* user_list.push(userid);
			    user_list.push(userpw);
			     user_list.push(usertel);
			    user_list.push(username);
			    user_list.push(userbirth);
			    user_list.push(useremail);
			    user_list.push(usergender); */
			    
			    alert(userid);
			   
 			// UserList('/movie/admin/UpdateUser.do',{USERID:userid,USERPW:userpw,USERTEL:usertel,USERNAME:username,USERBIRTH:userbirth,USEREMAIL:useremail,USERGENDER:usergender},'json');
 			 UserList('/movie/admin/UpdateUser.do',
 					{
 					UID:userid,
 					UPW:userpw,
 					UTEL:usertel,
 					UNAME:username,
 					UBIRTH:userbirth,
 					UEMAIL:useremail,
 					UGENDER:usergender
					},
 					 'json','commitmodi');
			alert(UID);
			
		 });
		
		//삭제 버튼
			  $(document).on('click', '#deleteUser', function(){
				  var imsi2="";
				  
				  imsi=$("input#ckbtn:checked").val();
				   console.log(imsi2);		   
				   
				   UserList('/movie/admin/deleteUser.do',{},'json');
			  });
		
	   function UserList(url,data,dataType,methodName){
		      $.ajax({
					  url:url,
		    		  type:'POST',
		    		  data:data,
		   			  dataType:dataType,				  
		   			  success:function(v){
		   				  if(methodName=="modify"){
		   				showModifyData(v);
		   				  }else if(methodName=="commitmodi"){
		   					  alert('성공');
		   				  }
		   			  },
		   			  error:function(e){
		   				  console.log(e);
	    			  }	    		  
		   			  });	
		      }
	   
  	//버튼누르면 들어갈 AJAX 함수
	    function showModifyData(v){
		   var temp="";
    		var id;
    		$.each(v,function(index,dom){ //안녕하세요
    			var id = dom.userid;
    			temp+=" <td><img src=\"/movie/view/img/답변화살표.png\"></td>";
    			/* temp+=" <td><input type=\"checkbox\" id=\"ckbtn\" value="+dom.userid+"></td>";*/
    			temp+=" <td id=\"userForm_td\"><input type=\"text\" name=\"USERID_sub\" value="+dom.userid+" ></td>";
    			temp+=" <td id=\"userForm_td\"><input type=\"text\" name=\"USERPW_sub\" value="+dom.userpw+" ></td>";
    			temp+=" <td id=\"userForm_td\"><input type=\"text\" name=\"USERNAME_sub\" value="+dom.username+" ></td>";
    			temp+=" <td id=\"userForm_td\"><input type=\"text\" name=\"USERTEL_sub\" value="+dom.usertel+"></td>";
    			temp+=" <td id=\"userForm_td\"><input type=\"text\" name=\"USERBIRTH_sub\" value="+dom.userbirth+"></td>";
    			temp+=" <td id=\"userForm_td\"><input type=\"text\" name=\"USEREMAIL_sub\" value="+dom.useremail+"></td>";
    			temp+=" <td id=\"userForm_td\"><input type=\"text\" name=\"USERGENDER_sub\" value="+dom.usergender+"></td>";
    			temp+=" <td id=\"userForm_td\"><input type=\"submit\" id=\"commitmodifyMovie\" value=\"수정완료\"></td>";
    			temp+=" <td id=\"userForm_td\"><input type=\"button\" id=\"deleteMovie\"  value=\"취소\"></td>";
    		$('tr[id="'+id+'"]').html(temp);
    		});
  } 
    
		
		
  });
 	  
 
//수정하기 누르면 해당 ajax문 수행되는 것
  /*  $('#modifyUser').click(function(){
	    alert('s');
	  //document.location.href="/movie/admin/selectOneUser.do?userId=imsi";
		}); */ 
/*  $('input#DeleteUser').click(function(){
		document.location.href="/movie/admin/deleteUser.do?userId=imsi";
		});  */
  /* $(document).on('click', '#commitmodifyMovie', function(){
	   document.location.href="/movie/admin/UpdateUser.do?userId=imsi";
  }); */
	//삭제 버튼
/*   $(document).on('click', '#deleteUser', function(){
	 movieList('/movie/admin/DeleteUser.do',$("form#movieForm").serialize(),'json');	  
  });   */
	
</script>  
</head>
<body>
	<div id="main">
	<!-- Tray -->
	<div id="tray" class="box">
		<p class="f-left box">
			<!-- Switcher -->
			<span class="f-left" id="switcher">
				<a href="#" rel="1col" class="styleswitch ico-col1" title="Display one column"><img src="/movie/view/jsp/Admin/design/switcher-1col.gif" alt="1 Column" /></a>
				<a href="#" rel="2col" class="styleswitch ico-col2" title="Display two columns"><img src="/movie/view/jsp/Admin/design/switcher-2col.gif" alt="2 Columns" /></a>
			</span>
			Project: <strong>영끌</strong>
		</p>
		<p class="f-right">관리자: <strong>관리자이름</strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><a href="#" id="logout">Log out</a></strong></p>
	</div>
	 <!--  /tray -->
	<!-- Columns -->
	<div id="cols" class="box">
		<!-- Aside (Left Column) -->
		<div id="aside" class="box">
			<div class="padding box">
				<!-- Logo (Max. width = 200px) -->
				<p id="logo"><a href="#"><img src="/movie/view/jsp/Admin/tmp/logo.jpg" alt="Our logo" title="Visit Site" /></a></p>
			</div> <!-- /padding -->
			<ul class="box">
				<li><a href="/movie/admin/selectAllUser.do">유저관리</a></li>
				<li><a href="#">영화관리</a></li>
				<li><a href="#">시간표관리</a></li>
				<li><a href="#">예매관리</a></li>
				<li><a href="#">문의하기</a></li>
				<li id="submenu-active"><a href="#">예비 html</a> <!-- Active -->
					<ul>
						<li><a href="#">예비</a></li>
						<li><a href="#">예비</a></li>
					</ul>
				</li>
			</ul>
		</div> <!-- /aside -->
		<hr class="noscreen" />
		<!-- Content (Right Column) -->
		<div id="content" class="box">
			<!-- Table (TABLE) -->
			<h3 class="tit">유저 리스트<a href="/movie/admin/selectAllUser.do">유저조회</a></h3>
			
			<table id="FormWrapper">
				<tr>
				   <th id="userForm_td">번호</th>
					<th id="userForm_td">체크</th>
					<th id="userForm_td">유저 ID</th>
				    <th id="userForm_td">유저 비밀번호</th>
				    <th id="userForm_td">이름</th>
				    <th id="userForm_td">핸드폰 번호</th>
				    <th id="userForm_td">유저 생일</th>
					<th id="userForm_td">유저 이메일</th>
				    <th id="userForm_td">성별</th>
				    <th id="userForm_td">수정</th>
				    <th id="userForm_td">삭제<th>
				</tr>
				<c:forEach var="i" items="${AllUserList}" varStatus="cnt">
				<tr>
					<td><c:out value="${cnt.count }"/></td>
					<td id="userForm_td"><input type="checkbox" VALUE="${i.USERID }" name="ckbtn1"></td>
				    <td id="userForm_td" name="USERID">${i. USERID}</td>
				    <td id="userForm_td">${i. USERPW}</td>
				    <td id="userForm_td">${i. USERNAME}</td>
				    <td id="userForm_td">${i. USERTEL}</td>
				    <td id="userForm_td">${i. USERBIRTH}</td>
				    <td id="userForm_td">${i. USEREMAIL}</td>
				    <td id="userForm_td">${i. USERGENDER}</td>
				    <td id="userForm_td"><input type="button" value="수정" id="modifyUser"></td>
				    <td id="userForm_td"><input type="button" value="삭제" id="deleteUser"></td>
				</tr>
			
					<tr id="${i.USERID}">
					
					</tr>
				<%-- <form>
					<input type="text" name="USERID" value="${i. USERID}" >
				   <input type="text" name="USERPW" value="${i. USERPW}" >
				    <input type="text" name="USERNAME" value="${i. USERNAME}" >
				    <input type="text" name="USERTEL" value="${i. USERTEL}">
				    <input type="text" name="USERBIRTH" value="${i. USERBIRTH}">
				    <input type="text" name="USEREMAIL" value="${i. USEREMAIL}">
				    <input type="text" name="USERGENDER" value="${i. USERGENDER}">
				    <input type="button" id="commitmodifyMovie" value="수정완료">
				    <input type="button"id="deleteMovie"  value="삭제">
				    
				</form> --%>
		
			
				</c:forEach>
				</table>
				
				<%-- 	 <td><c:out value="${cnt.count }"/></td>
					 <td><input type="checkbox" id="ckbtn" VALUE="${i.USERID}"></td>
				    <td id="userForm_td"><input type="text" name="USERID" value="${i. USERID}" ></td>
				    <td id="userForm_td"><input type="text" name="USERPW" value="${i. USERPW}" ></td>
				    <td id="userForm_td"><input type="text" name="USERNAME" value="${i. USERNAME}" ></td>
				    <td id="userForm_td"><input type="text" name="USERTEL" value="${i. USERTEL}"></td>
				    <td id="userForm_td"><input type="text" name="USERBIRTH" value="${i. USERBIRTH}"></td>
				    <td id="userForm_td"><input type="text" name="USEREMAIL" value="${i. USEREMAIL}"></td>
				    <td id="userForm_td"><input type="text" name="USERGENDER" value="${i. USERGENDER}"></td>
				    <td id="userForm_td"><input type="button" id="commitmodifyMovie" value="수정완료"></td>
				    <td id="userForm_td"><input type="button"id="deleteMovie"  value="삭제"></td> --%>
				    
				
			
			
			<!-- Form -->
			<h3 class="tit">Form</h3>
			<fieldset>
				<legend>Legend</legend>
				<table class="nostyle">
					<tr>
						<td style="width:70px;">Input:</td>
						<td><input type="text" size="40" name="" class="input-text" /></td>
					</tr>
					<tr>
						<td>Input:</td>
						<td><input type="text" size="40" name="" class="input-text" disabled="disabled" /></td>
					</tr>
					<tr>
						<td class="va-top">Input:</td>
						<td><textarea cols="75" rows="7" class="input-text"></textarea></td>
					</tr>
					<tr>
						<td>Input:</td>
						<td>
							<label><input type="checkbox" /> Lorem ipsum</label> &nbsp;
							<label><input type="checkbox" /> Lorem ipsum</label> &nbsp;
							<label><input type="checkbox" /> Lorem ipsum</label>
						</td>
					</tr>
					<tr>
						<td>Input:</td>
						<td>
							<label><input type="radio" /> Lorem ipsum</label> &nbsp;
							<label><input type="radio" /> Lorem ipsum</label> &nbsp;
							<label><input type="radio" /> Lorem ipsum</label>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="t-right"><input type="submit" class="input-submit" value="Submit" /></td>
					</tr>
				</table>
			</fieldset>
		</div> <!-- /content -->
	</div> <!-- /cols -->
</div> <!-- /main -->
</body>
</html>



