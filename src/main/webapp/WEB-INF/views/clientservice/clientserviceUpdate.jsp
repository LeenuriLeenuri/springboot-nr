<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/nav.jsp"%>

<!-- Show Welcome Area Start -->
<section class="show-welcome-area bg-overlay bg-img jarallax"
	style="background-image: url(/img/sec-img/post.jpg);">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12">
				<div class="show-welcome-text text-center">
					<p>A new story will unfold.</p>
					<h2>Write your story!</h2>
					<span>Client Service Update</span>
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
			<h2 class="text-center">Client Service Update</h2>
			<p></p>
			<form action="BoardReWriteProc.jsp" method="post"
				enctype="multipart/form-data">
				<div class="table table-responsive">
					<table class="table table-striped">
						<tr>
							<td>Title</td>
							<td><input type="text" class="form-control" name="title"
								id="title" placeholder="Write title"
								value="${clientservice.title}" /></td>
						</tr>

						<tr>
							<td>Content</td>
							<td><textarea rows="10" cols="50" name="content"
									class="form-control" id="content">${clientservice.content}</textarea>
							</td>
						</tr>

						<tr>
							<td colspan="2" class="text-center">
								<button value="${clientservice.id}"
									class="btn btn-sm action-button shadow animate blue"
									id="update--submit">Update</button> <input
								type="reset" value="Cancel"
								class="btn btn-sm action-button shadow animate yellow" />
								<a
								class="btn btn-sm action-button shadow animate green text-white"
								href="/clientservice/clientservice">List</a>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Show Routine Area End -->

<script src="/js/csUpdate.js"></script>

<%@include file="../include/footer.jsp"%>