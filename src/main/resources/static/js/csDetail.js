// 게시글 삭제
$('#cs--delete').on('click', function() {
	var id = $('#cs--delete').val();

	$.ajax({
		type : 'DELETE',
		url : '/clientservice/clientserviceDelete/' + id,
		dataType : 'json'
	}).done(function(r) {
		if (r.statusCode = 200) {
			alert('삭제 성공');
			location.href = '/clientservice/clientservice';
		} else {
			alert('삭제 실패');
		}
	}).fail(function(r) {
		alert('삭제 실패');
	});
});

// 댓글 저장
$('#answer--save').on('click', function() {

	var data = {
		userId : $('#userId').val(),
		clientServiceId : $('#clientServiceId').val(),
		content : $('#content').val()
	}

	$.ajax({
		type : 'POST',
		url : '/answer/answerPost',
		data : JSON.stringify(data),
		contentType : "application/json; charset=utf-8",
		dataType : 'json'
	}).done(function(r) {
		if (r.status.statusCode = 200) {
			alert('댓글쓰기 성공');
			makeCommentItem(r);
			$('#content').val("");
		} else {
			alert('댓글쓰기 실패');
		}
	}).fail(function(r) {
		alert('댓글쓰기 실패');
	});
});

function makeAnswerItem(r) {
	var answer_item = `<li class="single_answer_area" id="answer--item--${r.id}">`;
	answer_item += `<div class="answer-content d-flex">`;
	answer_item += `<div class="answer-author mx-4">`;
	answer_item += `<img src="/media/${sessionScope.principal.profile}" onerror="javascript:this.src = '/img/core-img/unknown.jpg'" alt="author" style="width: 70px; height: 70px; border-radius: 50px;" />`;
	answer_item += `</div>`;
	answer_item += `<div class="answer-meta">`;
	answer_item += `<a href="#" class="author-name">${r.username}`;
	answer_item += `<span class="post-date">- <fmt:formatDate value="${r.createDate}" type="date" dateStyle="full" /></span></a>`;
	answer_item += `<p>${r.content}</p>`;
	answer_item += `<button class="btn btn-sm action-button shadow animate blue pull-left like">Like</button>`;
	answer_item += `<button class="btn btn-sm action-button shadow animate green pull-left reply">Reply</button>`;
	answer_item += `<button onclick="answerDelete(${r.id})" class="btn btn-sm action-button shadow animate red pull-left delete">Delete</button>`;
	answer_item += `</div>`;
	answer_item += `</div>`;
	answer_item += `<hr />`;
	answer_item += `</li>`;
	$('#answer--items').prepend(answer_item);
}

// 댓글 삭제
function answerDelete(answerId) {
	$.ajax({
		type : 'DELETE',
		url : '/answer/answerDelete/' + answerId,
		dataType : 'json'
	}).done(function(r) {
		if (r.statusCode = 200) {
			alert('댓글삭제 성공');
			$('#answer--item--' + answerId).remove();
		} else {
			alert('댓글삭제 실패');
		}
	}).fail(function(r) {
		alert('댓글삭제 실패');
	});
}