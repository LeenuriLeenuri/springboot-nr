<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/nav.jsp"%>

    <!-- Latest News Area Start -->
    <section
      class="razo-latest-news-area bg-overlay bg-img jarallax"
      style="background-image: url(/img/sec-img/about-us-carousel_1.jpg);"
    >
      <!-- Razo Latest News Slide -->
      <div class="razo-latest-news-slide owl-carousel">
        <!-- Single Latest News Area -->
        <div
          class="razo-single-latest-news-area bg-overlay bg-img"
          style="background-image: url(/img/sec-img/about-us-carousel_2.jpg);"
        >
          <!-- Post Content -->
          <div class="post-content">
            <a href="#" class="post-title"
              >'URGENT HELP' NEEDED FOR 113 SPECIES AFTER FIRES</a
            >
            <p>
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
              eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
              enim ad minim veniam.
            </p>
          </div>
          <!-- Post Date -->
          <div class="post-date">
            <h2>12</h2>
            <p>April</p>
          </div>
          <!-- Read More -->
          <div class="read-more-btn">
            <a href="#" class="btn"
              >Read More
              <i class="fa fa-angle-double-right" aria-hidden="true"></i
            ></a>
          </div>
        </div>

        <!-- Single Latest News Area -->
        <div
          class="razo-single-latest-news-area bg-overlay bg-img"
          style="background-image: url(/img/sec-img/about-us-carousel_3.jpg);"
        >
          <!-- Post Content -->
          <div class="post-content">
            <a href="#" class="post-title"
              >PRIVATE KEEPING OF WILD ANIMALS</a
            >
            <p>
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
              eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
              enim ad minim veniam.
            </p>
          </div>
          <!-- Post Date -->
          <div class="post-date">
            <h2>25</h2>
            <p>June</p>
          </div>
          <!-- Read More -->
          <div class="read-more-btn">
            <a href="#" class="btn"
              >Read More
              <i class="fa fa-angle-double-right" aria-hidden="true"></i
            ></a>
          </div>
        </div>

        <!-- Single Latest News Area -->
        <div
          class="razo-single-latest-news-area bg-overlay bg-img"
          style="background-image: url(/img/sec-img/about-us-carousel_4.jpg);"
        >
          <!-- Post Content -->
          <div class="post-content">
            <a href="#" class="post-title"
              >SAY NO TO CANNED HUNTING!</a
            >
            <p>
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
              eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
              enim ad minim veniam.
            </p>
          </div>
          <!-- Post Date -->
          <div class="post-date">
            <h2>31</h2>
            <p>July</p>
          </div>
          <!-- Read More -->
          <div class="read-more-btn">
            <a href="#" class="btn"
              >Read More
              <i class="fa fa-angle-double-right" aria-hidden="true"></i
            ></a>
          </div>
        </div>
      </div>
    </section>
    <!-- Latest News Area End -->

    <!-- News Area Start -->
    <section class="uza-news-area section-padding-80">
      <div class="container">
        <div class="row">
          <!-- Section Heading -->
          <div class="col-12">
            <div class="section-heading text-center">
              <h2>Latest News</h2>
            </div>
          </div>
        </div>
      </div>

      <div class="container">
        <div class="row razo-blog-masonary">
          <!-- Single Blog Item -->
          <c:forEach var="news" items="${news}">
          <div class="col-12 col-sm-6 col-lg-4 razo-blog-masonary-item mb-30">
            <div class="razo-blog-masonary-single-item">
              <!-- Post Thumbnail -->
              <div class="post-thumbnail">
                <a href="/news/newsDetail/${news.id}"
                  ><img src="/media/${news.picture}" alt=""
                /></a>
              </div>
              <!-- Post Content -->
              <div class="post-content">
                <div class="post-date">
                  <i class="fa fa-calendar" aria-hidden="true"></i>
                  <fmt:formatDate value="${news.createDate}" type="date" dateStyle="short" />
                </div>
                <a href="/news/newsDetail/${news.id}" class="post-title"
                  >${news.title}</a
                >
                <p>
                  ${news.summary}
                </p>
                <a href="/news/newsDetail/${news.id}" class="btn read-more-btn"
                  >Read More
                  <i class="fa fa-angle-double-right" aria-hidden="true"></i
                ></a>
              </div>
            </div>
          </div>
          </c:forEach>
        </div>

        <div class="row">
          <div class="col-12 text-center">
            <a href="#" class="btn razo-btn mt-30">Load More</a>
          </div>
        </div>
      </div>
    </section>
    <!-- News Area End -->

<%@include file="../include/footer.jsp"%> 