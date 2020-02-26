<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/nav.jsp"%>

    <!-- Show Welcome Area Start -->
    <section
      class="show-welcome-area bg-overlay bg-img jarallax"
      style="background-image: url(/img/sec-img/post.jpg);"
    >
      <div class="container h-100">
        <div class="row h-100 align-items-center">
          <div class="col-12">
            <div class="show-welcome-text text-center">
              <p>A new story will unfold.</p>
              <h2>Write your story!</h2>
              <span>News Post</span>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Show Welcome Area End -->

    <!-- Show Routine Area Start -->
    <div class="container my-5">
      <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
          <h2 class="text-center">News Post</h2>
          <p></p>
          <form action="/news/newsPost" method="post" enctype="multipart/form-data">
            <div class="table table-responsive form-group">
              <table class="table table-striped">
                <tr>
                  <td>Title</td>
                  <td>
                    <input
                      type="text"
                      class="form-control"
                      name="title"
                      id="title"
                      placeholder="Write title"
                    />
                  </td>
                </tr>

                <tr>
                  <td>Summary</td>
                  <td>
                    <input type="text" class="form-control" name="summary" id="summary" placeholder="Write summary" />
                  </td>
                </tr>

                <tr>
                  <td>Picture</td>
                  <td>
                    <input
                      type="file"
                      class="form-control"
                      name="picture"
                      id="picture"
                    />
                  </td>
                </tr>

                <tr>
                  <td>Content</td>
                  <td>
                    <textarea
                      rows="10"
                      cols="50"
                      name="content"
                      class="form-control"
                      id="content"
                    ></textarea>
                  </td>
                </tr>
                <tr>
                  <td colspan="2" class="text-center">
                  <input type="hidden" name="userId" value="${sessionScope.principal.id}"/>
                    <button
                      class="btn btn-sm action-button shadow animate blue"
                      id="write--submit"
                    >Post</button>
                    <input
                      type="reset"
                      value="Cancel"
                      class="btn btn-sm action-button shadow animate yellow"
                    />
                    <a
                      class="btn btn-sm action-button shadow animate green text-white"
                      href="/news/news"
                    >List</a>
                  </td>
                </tr>
              </table>
            </div>
          </form>
        </div>
      </div>
    </div>
    <!-- Show Routine Area End -->
    
    <script>
//     $('#write--submit').on('click', function(e) {
//     	//e.preventDefault();

//     	alert('title: ' + $('#title').val());
//     	var data = {
//     		title : $('#title').val(),
//     		summary : $('#summary').val(),
//     		picture : $('#picture').val(),
//     		content : $('#content').val()
//     	};

//     	$.ajax({
//     		type : 'POST',
//     		url : '/news/newsPost',
//     		data : JSON.stringify(data),
//     		contentType : 'application/json; charset=utf-8',
//     		dataType : 'json'
//     	}).done(function(r, XMLHttpRequest, textStatus) {

//     		if (r.statusCode == 200) {
//     			alert("글 쓰기 성공");
//     			console.log(r);
//     			location.href = "/news/news";
//     		} else {
//     			alert("글쓰기 실패");
//     		}

//     		console.log('XMLHttpRequest: ' + XMLHttpRequest);
//     		console.log('XMLHttpRequest: ' + XMLHttpRequest.status);
//     		console.log('textStatus: ' + textStatus);
//     		console.log('textStatus: ' + textStatus.status);
//     	}).fail(function(r, XMLHttpRequest, textStatus) {
//     		alert("글쓰기 실패");
//     		console.log(r);

//     		console.log('XMLHttpRequest: ' + XMLHttpRequest);
//     		console.log('XMLHttpRequest: ' + XMLHttpRequest.status);
//     		console.log('textStatus: ' + textStatus);
//     		console.log('textStatus: ' + textStatus.status);
//     	});
//     });
</script>

<%@include file="../include/footer.jsp"%> 