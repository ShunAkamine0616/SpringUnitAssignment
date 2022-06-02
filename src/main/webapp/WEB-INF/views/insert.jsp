<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品登録</title>
<link href="css/commons.css" rel="stylesheet">

</head>
<body>

	<div class="header">
		<h1 class="site_logo">
			<a href="menu.jsp">商品管理システム</a>
		</h1>
		<div class="user">
			<p class="user_name">佐藤さん、こんにちは</p>
			<form class="logout_form" action="Logout" method="get">
				<button class="logout_btn" type="submit">
					<img src="images/ドアアイコン.png">ログアウト
				</button>
			</form>
		</div>
	</div>

	<hr>

	<div class="insert">
		<div class="discription">
			<p>
				登録情報を入力してください（<span class="required"></span>は必須です）
			</p>
		</div>

		<div class="form_body">
			<p class="error">
				<c:if test="${not empty insertErrMsg}">
					<span>${fn:escapeXml(insertErrMsg)}</span>
				</c:if>
			</p>

			<form:form action="insert" method="get" modelAttribute="insert">
				<fieldset class="label-130">
					<div>
						<label class="required"><fmt:message
								key="form.lbl.productId" /></label>
						<form:input type="text" path="productId" class="base-text"
							value="${productId}" />
						<span class="error"> <c:if test="${not empty idErrMsg}">
								<span>${fn:escapeXml(idErrMsg)}</span>
							</c:if>
						</span>
					</div>
					<div>
						<label class="required"><fmt:message
								key="form.lbl.productName" /></label>
						<form:input type="text" path="productName" class="base-text"
							value="${productName}" />
						<span class="error"><c:if test="${not empty nameErrMsg}">
								<span>${fn:escapeXml(nameErrMsg)}</span>
							</c:if></span>
					</div>
					<div>
						<label class="required"><fmt:message key="form.lbl.price" /></label>
						<form:input type="text" path="price" class="base-text"
							value="${price}" />
						<span class="error"><c:if test="${not empty priceErrMsg}">
								<span>${fn:escapeXml(priceErrMsg)}</span>
							</c:if></span>
					</div>
					<div class="select_block">
						<label class="required"><fmt:message
								key="form.lbl.category" /></label>
						<form:select path="categoryId" class="base-text">
							<form:options items="${categoryList}" itemLabel="categoryName"
								itemValue="categoryId" />
						</form:select>
					</div>
					<div>
						<label><fmt:message key="form.lbl.description" /></label>
						<form:textarea path="description" class="base-text"></form:textarea>
					</div>
					<!-- 					<div> -->
					<!-- 						<label>画像</label> <input type="file" name="file"> <span -->
					<%-- 							class="error"><c:if test="${not empty imageErrMsg}"> --%>
					<%-- 								<span>${fn:escapeXml(imageErrMsg)}</span> --%>
					<%-- 							</c:if></span> --%>
					<!-- 					</div> -->
				</fieldset>
				<div class="btns">
					<button type="button" onclick="openModal()"  name="insert" class="basic_btn">登録</button>
					<input type="button" onclick="location.href='back'"
						value="戻る" class="cancel_btn">
				</div>
				<div id="modal">
					<p class="modal_message">登録しますか？</p>
					<div class="btns">
						<form:button type="submit" name="insert" class="basic_btn">登録</form:button>
						<button type="button" name="cancel" onclick="closeModal()"
							class="cancel_btn">キャンセル</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	<div id="fadeLayer"></div>
</body>
</html>
<script src="./js/commons.js"></script>