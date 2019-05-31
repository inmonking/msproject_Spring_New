<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style type="text/css">
	.reply_body_viewer{
		width:700px; 
		border:1px solid #747474; 
		border-top:10px solid #747474; 
		padding: 10px; 
		border-radius: 5px; 
		margin-bottom: 20px; 
		box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19);
	}
	
	.reply_body_master{
		width:700px; 
		border:1px solid orange; 
		border-top:10px solid orange; 
		padding: 10px; 
		border-radius: 5px; 
		margin-bottom: 20px; 
		box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19);
	}
	
	.reply_body_user{
		width:700px; 
		border:1px solid mediumseagreen; 
		border-top:10px solid mediumseagreen; 
		padding: 10px; 
		border-radius: 5px; 
		margin-bottom: 20px; 
		box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19); 
		margin-left: 125px;
	}
	
	.reply_content{
		width: 690px; 
		border:1px solid #747474; 
		margin-top: 10px; 
		padding: 15px 5px; 
		border-radius: 5px;
	}
</style>
<%@ include file="../include/common.jsp" %>
	<div style="width: 850px;margin: 30px auto 100px; background-color: white; border: 1.5px solid black; border-radius: 10px; padding: 20px;">
		<div style="height: 30px; background-color: black; margin: -20px; margin-bottom: 20px;border-radius: 5px 5px 0px 0px;"><span style="line-height: 30px;margin-left: 20px; color: white;font-weight: 20px; font-size: 1.2em">댓글<span style="margin-left: 5px">${replyList.size()}</span></span><span style="line-height: 30px;color: white;font-weight: 20px; font-size: 1.2em; float: right; margin-right: 20px;"><i style="cursor: pointer" id="refresh" class="fas fa-sync-alt"></i></span></div>
		
	<c:if test="${replyList.size()<1}">댓글이 없습니다.</c:if>
	<c:forEach items="${replyList }" var="replyview">
		<c:if test="${sessionScope.loginUser.id == replyview.writer }">
			<div class="reply_body_user">
				<span>${replyview.writer }</span>
				<span style="float: right;">${replyview.regdate}</span>
				<div style="text-align: right"><span class="reply_del" data_num = "${replyview.rno}" style="border: 1px solid black; border-radius:3px; padding:2px; user-select:none; cursor: pointer;">삭제</span></div>
				<div class="reply_content">${replyview.content}</div>
			</div>
		</c:if>
		<c:if test="${sessionScope.loginUser.id != replyview.writer }">
			<div class="reply_body_viewer">
				<span>${replyview.writer }</span>
				<span style="float: right;">${replyview.regdate}</span>
				<div class="reply_content">${replyview.content}</div>
			</div>
		</c:if>
	</c:forEach>
	
		<hr style="border: 1px solid darkgray">
		<c:choose>
			<c:when test="${!empty sessionScope.loginUser }">
			<form action="replyAdd.ms" method="post" name="frm_reply" id="frm_reply" class="frm_reply">
				<div style="width:700px; border:1px solid mediumseagreen; border-top:10px solid mediumseagreen; padding: 10px; border-radius: 5px; margin-bottom: 20px; box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19); margin-left: 125px">
					<span id="reply_writer">${sessionScope.loginUser.id}</span>
					<textarea name="re_textarea" id="replyInsert" style="width: 690px; border:1px solid #747474; margin-top: 10px; padding: 15px 5px; border-radius: 5px;"></textarea>
					<script type="text/javascript">
						var oEditors = [];
						nhn.husky.EZCreator.createInIFrame({
							oAppRef: oEditors,
						 	elPlaceHolder: "replyInsert",
						 	sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
						 	fCreator: "createSEditor2"
						});
					</script>
					<div style="text-align: right;">
						<span id="replyBtn" style="background-color: mediumseagreen;text-align: center;padding: 6px; border-radius: 10px; color: white; font-size: 13px; cursor: pointer; user-select:none">댓글 쓰기</span>
					</div>
				</div>
				<input type="hidden" name="re_writer" value="${sessionScope.loginUser.id }">
				<input type="hidden" id="re_bno" name="re_bno">
			</form>
			</c:when>
			<c:otherwise>
				<div>로그인 후 댓글을 입력 할 수 있습니다.</div>
			</c:otherwise>
		</c:choose>
	</div>