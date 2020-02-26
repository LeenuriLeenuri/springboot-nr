<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/nav.jsp"%>

    <!-- Show Welcome Area Start -->
    <section
      class="show-welcome-area bg-overlay bg-img jarallax"
      style="background-image: url(/img/sec-img/client-service-main.jpg);"
    >
      <div class="container h-100">
        <div class="row h-100 align-items-center">
          <div class="col-12">
            <div class="show-welcome-text text-center">
              <p>Do you need any assistance?</p>
              <h2>Ask me anything!</h2>
              <span>We'll give you a sincere answer.</span>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Show Welcome Area End -->

    <!-- Show Routine Area Start -->
    <div class="container my-5">
      <h2>Client Service</h2>
      <p class="pull-left">Would you like any help?</p>
      <c:if test="${not empty sessionScope.principal}">
      <a
        type="button"
        href="/clientservice/clientservicePost"
        class="btn btn-sm action-button shadow animate yellow pull-right"
        >Post</a
      >
      </c:if>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>NO</th>
            <th>TITLE</th>
            <th>WRITER</th>
            <th>DATE</th>
          </tr>
        </thead>
        <tbody>
        
        <c:forEach var="clientservice" items="${clientservice}">
          <tr>
            <td>${clientservice.id}</td>
            <td><a href="/clientservice/clientserviceDetail/${clientservice.id}">${clientservice.title}</a></td>
            <td>${clientservice.username}</td>
            <td><fmt:formatDate value="${clientservice.createDate}" type="date" dateStyle="short" /></td>
          </tr>
          </c:forEach>
          
        </tbody>
      </table>

      <!-- PAGINATION Start -->
      <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
          <li class="page-item disabled">
            <a class="page-link" href="#" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
              <span class="sr-only">Previous</span>
            </a>
          </li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item"><a class="page-link" href="#">4</a></li>
          <li class="page-item"><a class="page-link" href="#">5</a></li>
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
              <span class="sr-only">Next</span>
            </a>
          </li>
        </ul>
      </nav>
      <!-- PAGINATION End -->
    </div>
    <!-- Show Routine Area End -->

<%@include file="../include/footer.jsp"%>