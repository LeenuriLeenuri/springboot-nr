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

    <!-- Blog Details Area Start -->
    <section class="blog-details-area section-padding-80">
      <div class="container">
        <!-- Post Details Text -->
        <div class="post-details-text">
          <div class="row justify-content-center">
            <div class="col-2 col-md-2 col-lg-1">
              <!-- Post Share -->
              <div class="razo-post-share">
                <h5>Share</h5>
                <a
                  href="#"
                  data-toggle="tooltip"
                  data-placement="left"
                  title="Facebook"
                  class="facebook"
                  ><i class="fa fa-facebook"></i
                ></a>
                <a
                  href="#"
                  data-toggle="tooltip"
                  data-placement="left"
                  title="Twitter"
                  class="twitter"
                  ><i class="fa fa-twitter"></i
                ></a>
                <a
                  href="#"
                  data-toggle="tooltip"
                  data-placement="left"
                  title="Google Plus"
                  class="google-plus"
                  ><i class="fa fa-google-plus"></i
                ></a>
                <a
                  href="#"
                  data-toggle="tooltip"
                  data-placement="left"
                  title="Pinterest"
                  class="pinterest"
                  ><i class="fa fa-pinterest"></i
                ></a>
                <a
                  href="#"
                  data-toggle="tooltip"
                  data-placement="left"
                  title="Instagram"
                  class="instagram"
                  ><i class="fa fa-instagram"></i
                ></a>
              </div>
            </div>

            <div class="col-10 col-md-10 col-lg-9">
              <a
                type="button"
                href="/clientservice/clientservice"
                class="btn btn-sm action-button shadow animate green pull-right"
                >List</a
              >
              <c:if test="${clientservice.userId eq sessionScope.principal.id}">
              <a
                href="/clientservice/clientserviceUpdate/${clientservice.id}"
                class="btn btn-sm action-button shadow animate yellow pull-right"
                >Update</a
              >
              </c:if>
              <c:if test="${clientservice.userId eq sessionScope.principal.id || sessionScope.principal.username eq 'admin' }">
              <button
                id="cs--delete"
                value="${clientservice.id}"
                class="btn btn-sm action-button shadow animate red pull-right"
                >Delete</button
              >
              
              </c:if>

              <h1>${clientservice.title}</h1>

              <img src="/img/sec-img/about-us-detail.jpg" alt="author" />

              <!-- Blockquote -->
              <blockquote class="razo-blockquote d-flex">
                <div class="icon">
                  <i class="icon_quotations" aria-hidden="true"></i>
                </div>
                <div class="text">
                  <p>
                    “${clientservice.content}”
                  </p>
                </div>
              </blockquote>
              <hr />
              
              <!-- Answer Area -->
              <div class="answer_area mb-50 clearfix">
                <h5 class="title mb-5">ANSWER</h5>

                <ol id="answer--items" class="list-group">
                  <!-- Single Answer Area -->
                  <c:forEach var="answer" items="${answer}">
                  <li class="single_answer_area" id="answer--item--${answer.id}">
                    <!-- Answer Content -->
                    <div class="answer-content d-flex">
                      <!-- Answer Author -->
                      <div class="answer-author mx-4">
                      <img src="/media/${answer.profile}" onerror="javascript:this.src = '/img/core-img/unknown.jpg'" alt="author" style="width: 105px; height: 105px; border-radius: 50px;" />
                      </div>
                      <!-- Answer Meta -->
                      <div class="answer-meta">
                        <a href="#" class="author-name"
                          >${answer.username}
                          <span class="post-date">- <fmt:formatDate value="${answer.createDate}" type="date" dateStyle="full" /></span></a
                        >
                        <p>
                          ${answer.content}
                        </p>
                        <button class="btn btn-sm action-button shadow animate blue pull-left like">Like</button>
                        <button class="btn btn-sm action-button shadow animate green pull-left reply">Reply</button>
                        <c:if test="${answer.userId eq sessionScope.principal.id || sessionScope.principal.username eq 'admin' }">
                        <button onclick="answerDelete(${answer.id})" class="btn btn-sm action-button shadow animate red pull-left delete">Delete</button>
                        </c:if>
                      </div>
                    </div>
                    <hr />
                  </li>
                  </c:forEach>
                </ol>
              </div>

              <!-- Leave A Answer -->
              <c:if test="${clientservice.userId eq sessionScope.principal.id || sessionScope.principal.username eq 'admin' }">
              <div class="razo-contact-form">
                <h2 class="mb-4">Leave A Answer</h2>

                <!-- Form -->
                <form>
                  <div class="row">
                    <div class="col-12">
                    <input type="hidden" id="clientServiceId" value="${clientservice.id}" /> <input type="hidden" id="userId" value="${sessionScope.principal.id}" />
                      <textarea
                        name="message"
                        class="form-control mb-30"
                        placeholder="Write Answer"
                        id="content"
                        maxlength="50"
                      ></textarea>
                    </div>
                    <div class="col-12">
                      <button class="btn razo-btn btn-3 mt-15" id="answer--save">
                        Post Answer
                      </button>
                    </div>
                  </div>
                </form>
              </div>
              </c:if>
              
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Blog Details Area End -->

<script src="/js/csDetail.js"></script>

<%@include file="../include/footer.jsp"%>