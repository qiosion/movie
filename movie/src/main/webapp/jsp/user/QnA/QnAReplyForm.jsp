<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <title>게시판 - 답변글</title>
</head>
<body>
    <br>
    <b><font size="6" color="gray">답글 작성</font></b>
    <br>

	<form method="post" action="QnAReply.do" name="QnAForm">
	
		<input type="hidden" name="qa_no" value="${vo.qa_no}"/>
		<input type="hidden" name="qa_re_ref" value="${vo.qa_re_ref}"/>
		<input type="hidden" name="qa_re_step" value="${vo.qa_re_step}"/>
		<input type="hidden" name="qa_re_lev" value="${vo.qa_re_lev}"/>

		<table width="700" border="3" bordercolor="lightgray" align="center">
		<tr>
				<td id="title">작성자</td>
				<td><input name="qa_name" type="text" size="70" maxlength="100"
					/></td>
			</tr>
			<tr>
				<td id="title">제 목</td>
				<td><input name="qa_title" type="text" size="70"
					maxlength="100" /></td>
			</tr>
			<tr>
				<td id="title">내 용</td>
				<td><textarea name="qa_cont" cols="72" rows="20">
                </textarea></td>
			</tr>

			<tr align="center" valign="middle">
				<td colspan="5"><input type="reset" value="작성취소"> <input
					type="submit" value="등록"> <input type="button" value="목록">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>
