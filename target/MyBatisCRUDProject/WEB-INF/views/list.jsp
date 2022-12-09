<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>free board</title>
<script>
	function delete_ok(id){
		const a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='deleteok/' + id;
	}
	function logout(){
		const check = confirm("정말 로그아웃하시겠습니까?");
		if(check) location.href="../login/logout";
	}
</script>
</head>
<body>
<h1>자유게시판</h1>
<c:set var="id" value="#{login.userid}" />
<p><b>${id}</b>님, 환영합니다🎉</p>
<a href="javascript:logout()">로그아웃</a>
<table id="list" width="90%">
<tr>
	<th>Seq</th>
	<th>Category</th>
	<th>Title</th>
	<th>Writer</th>
	<th>Content</th>
	<th>Regdate</th>
	<th>Edit</th>
	<th>Delete</th>
</tr>

<c:forEach items="${list}" var="u">
	<tr>
		<td>${u.seq}</td>
		<td>${u.category}</td>
		<td>${u.title}</td>
		<td>${u.writer}</td>
		<td>${u.content}</td>
		<td>${u.regdate}</td>
		<td><a href="editform/${u.seq}">수정</a></td>
		<td><a href="javascript:delete_ok('${u.seq}')">삭제</a></td>
	</tr>
</c:forEach>
</table>
<br/><button type="button" onclick="location.href='add'">새 글 추가하기</button></a>
</body>
</html>