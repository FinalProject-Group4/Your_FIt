<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>다이어트 꿀팁(식단)</title>	
</head>
<body>
    <c:import url="../common/header.jsp"/>

        <div class="page-title wb">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                        <h2><i class="fa fa-shopping-bag bg-red"></i>다이어트 꿀팁(식단) <!--  <small class="hidden-xs-down hidden-sm-down">Nulla felis eros, varius sit amet volutpat non. </small>--></h2>
                    </div><!-- end col -->
                    <div class="col-lg-4 col-md-4 col-sm-12 hidden-xs-down hidden-sm-down">
                       <!--   <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Blog</a></li>
                            <li class="breadcrumb-item active">Food</li>
                        </ol> -->
                         <div class="widget">
                                <h2 class="widget-title">Search</h2>
                                <form class="form-inline search-form">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Search on the site">
                                    </div>
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                </form>
                            </div><!-- end widget -->
                    </div><!-- end col -->                    
                </div><!-- end row -->
            </div><!-- end container -->
        </div><!-- end page-title -->

        <section class="section wb">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                        <div class="page-wrapper">
                            <div class="blog-list clearfix">
                       		<c:forEach items="${list}" var="b"> 
                                <div class="blog-box row">
                                    <div class="col-md-4">
                                        <div class="post-media">
                                            <a href="${pageContext.request.contextPath}/dtboard/dtBoardView.do?no=${b.dt_No}" title="">
                                                <c:if test="${ ! empty b.files }">	
                                                <img src="${pageContext.request.contextPath}/resources/dtboardUpload/${b.files[0].f_Cname}" class="img-fluid" >
                                              </c:if>
											  <c:if test="${ empty b.files }">
														X
											  </c:if>
											 
                                                <div class="hovereffect"></div>
                                            </a>
                                        </div><!-- end media -->
                                    </div><!-- end col -->

                                    <div class="blog-meta big-meta col-md-8">
                                        <h4><a href="${pageContext.request.contextPath}/dtboard/dtBoardView.do?no=${b.dt_No}" title="">${b.dt_Title}</a></h4>
                                        <p>${b.dt_Content}</p>
                                        <small><a href="blog-category-01.html" title="">Food</a></small>
                                        <small><a href="single.html" title="">11 July, 2017</a></small>
                                        <small><a href="blog-author.html" title="">by Matilda</a></small>
                                    </div><!-- end meta -->
                                </div><!-- end blog-box -->

                                <hr class="invis">
								</c:forEach>
								<c:out value="${pageBar}" escapeXml="false" />
								
                               <div class="blog-box row">
                                    <div class="col-md-4">
                                        <div class="post-media">
                                          <!--   <a href="single.html" title="">
                                                <img src="upload/blog_square_06.jpg" alt="" class="img-fluid">
                                                <div class="hovereffect"></div> --> 
                                            </a>
                                        </div><!-- end media -->
                                     </div><!-- end col --> 

                                    <div class="blog-meta big-meta col-md-8">
                                       <!--   <h4><a href="single.html" title="">10 practical ways to choose organic vegetables</a></h4> -->
                                       <!--  <p>Aenean interdum arcu blandit, vehicula magna non, placerat elit. Mauris et pharetratortor. Suspendissea sodales urna. In at augue elit. Vivamus enim nibh, maximus ac felis nec, maximus tempor odio.</p>
                                        <small><a href="blog-category-01.html" title="">Food</a></small>
                                        <small><a href="single.html" title="">10 July, 2017</a></small>
                                        <small><a href="blog-author.html" title="">by Matilda</a></small>  -->
                                    </div><!-- end meta -->
                                </div><!-- end blog-box -->

                                <hr class="invis">

                                <div class="blog-box row">
                                    <div class="col-md-4">
                                        <div class="post-media">
                                         <!--     <a href="single.html" title="">
                                                <img src="upload/blog_square_07.jpg" alt="" class="img-fluid">
                                                <div class="hovereffect"></div>
                                            </a>-->
                                        </div><!-- end media -->
                                    </div><!-- end col -->

                                    <div class="blog-meta big-meta col-md-8">
                                      <!--   <h4><a href="single.html" title="">We are making homemade ravioli</a></h4>
                                        <p>Aenean interdum arcu blandit, vehicula magna non, placerat elit. Mauris et pharetratortor. Suspendissea sodales urna. In at augue elit. Vivamus enim nibh, maximus ac felis nec, maximus tempor odio.</p>
                                        <small><a href="blog-category-01.html" title="">Food</a></small>
                                        <small><a href="single.html" title="">09 July, 2017</a></small>
                                        <small><a href="blog-author.html" title="">by Clara</a></small> --> 
                                    </div><!-- end meta -->
                                </div><!-- end blog-box -->

                                <hr class="invis">

                                <div class="row">
                                    <div class="col-lg-10 offset-lg-1">
                                       
                                    </div><!-- end col -->
                                </div><!-- end row -->

                                <hr class="invis">

                                <div class="blog-box row">
                                  <div class="col-md-4">
                                        <div class="post-media">
                                        <!--    <a href="single.html" title="">
                                                <img src="upload/blog_square_08.jpg" alt="" class="img-fluid">  
                                                <div class="hovereffect"></div> 
                                            </a> --> 
                                        </div><!-- end media -->
                                    </div><!-- end col -->

                                    <div class="blog-meta big-meta col-md-8">
                                    <!--     <h4><a href="single.html" title="">What do you think of a luxurious and elegant restaurant?</a></h4>
                                        <p>Aenean interdum arcu blandit, vehicula magna non, placerat elit. Mauris et pharetratortor. Suspendissea sodales urna. In at augue elit. Vivamus enim nibh, maximus ac felis nec, maximus tempor odio.</p>
                                        <small><a href="blog-category-01.html" title="">Food</a></small>
                                        <small><a href="single.html" title="">05 July, 2017</a></small>
                                        <small><a href="blog-author.html" title="">by Jenny</a></small> --> 
                                    </div><!-- end meta -->
                                </div><!-- end blog-box -->

                                <hr class="invis">

                                <div class="blog-box row">
                                    <div class="col-md-4">
                                        <div class="post-media">
                                         <!--    <a href="single.html" title="">
                                                <img src="upload/blog_square_09.jpg" alt="" class="img-fluid">
                                                <div class="hovereffect"></div>
                                            </a>  -->
                                        </div><!-- end media -->
                                    </div><!-- end col -->

                                    <div class="blog-meta big-meta col-md-8">
                                     <!--     <h4><a href="single.html" title="">10 different samples of vegetables</a></h4>
                                        <p>Aenean interdum arcu blandit, vehicula magna non, placerat elit. Mauris et pharetratortor. Suspendissea sodales urna. In at augue elit. Vivamus enim nibh, maximus ac felis nec, maximus tempor odio.</p>
                                        <small><a href="blog-category-01.html" title="">Food</a></small>
                                        <small><a href="single.html" title="">04 July, 2017</a></small>
                                        <small><a href="blog-author.html" title="">by Melinda</a></small> -->
                                    </div><!-- end meta -->
                                </div><!-- end blog-box -->

                              

                                <div class="blog-box row">
                                    <div class="col-md-4">
                                        <div class="post-media">
                                         <!--    <a href="single.html" title="">
                                                <img src="upload/blog_square_10.jpg" alt="" class="img-fluid">
                                                <div class="hovereffect"></div>
                                            </a> --> 
                                        </div><!-- end media -->
                                    </div><!-- end col -->

                                    <div class="blog-meta big-meta col-md-8">
                                   <!--       <h4><a href="single.html" title="">You can make money by giving recipes</a></h4>
                                        <p>Aenean interdum arcu blandit, vehicula magna non, placerat elit. Mauris et pharetratortor. Suspendissea sodales urna. In at augue elit. Vivamus enim nibh, maximus ac felis nec, maximus tempor odio.</p>
                                        <small><a href="blog-category-01.html" title="">Food</a></small>
                                        <small><a href="single.html" title="">03 July, 2017</a></small>
                                        <small><a href="blog-author.html" title="">by Matilda</a></small> -->
                                    </div><!-- end meta -->
                                </div><!-- end blog-box -->

                                

                                <div class="blog-box row">
                                    <div class="col-md-4">
                                        <div class="post-media">
                                         <!--     <a href="single.html" title="">
                                                <img src="upload/blog_square_11.jpg" alt="" class="img-fluid">
                                                <div class="hovereffect"></div>
                                            </a> -->
                                        </div><!-- end media -->
                                    </div><!-- end col -->

                                    <div class="blog-meta big-meta col-md-8">
                                     <!--     <h4><a href="single.html" title="">What do you say we make potatoes?</a></h4>
                                        <p>Aenean interdum arcu blandit, vehicula magna non, placerat elit. Mauris et pharetratortor. Suspendissea sodales urna. In at augue elit. Vivamus enim nibh, maximus ac felis nec, maximus tempor odio.</p>
                                        <small><a href="blog-category-01.html" title="">Food</a></small>
                                        <small><a href="single.html" title="">02 July, 2017</a></small>
                                        <small><a href="blog-author.html" title="">by Martines</a></small> -->
                                    </div><!-- end meta -->
                                </div><!-- end blog-box -->

                                <hr class="invis">

                              
                            </div><!-- end blog-list -->
                        </div><!-- end page-wrapper -->

                        <div class="row">
                            <div class="col-md-12">
                                <nav aria-label="Page navigation">
                                 <!--    <ul class="pagination justify-content-start">
                                  
                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">Next</a>
                                        </li>
                                        
                                    </ul>  -->
                                </nav>
                            </div><!-- end col -->
                        </div><!-- end row -->
                    </div><!-- end col -->

                    <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
                        <div class="sidebar">
                           

                            <div class="widget">
                            <!--     <h2 class="widget-title">Recent Posts</h2>
                                <div class="blog-list-widget">
                                    <div class="list-group">
                                        <a href="single.html" class="list-group-item list-group-item-action flex-column align-items-start">
                                            <div class="w-100 justify-content-between">
                                                <img src="upload/blog_square_01.jpg" alt="" class="img-fluid float-left">
                                                <h5 class="mb-1">5 Beautiful buildings you need to before dying</h5>
                                                <small>12 Jan, 2016</small>
                                            </div>
                                        </a>

                                        <a href="single.html" class="list-group-item list-group-item-action flex-column align-items-start">
                                            <div class="w-100 justify-content-between">
                                                <img src="upload/blog_square_02.jpg" alt="" class="img-fluid float-left">
                                                <h5 class="mb-1">Let's make an introduction for creative life</h5>
                                                <small>11 Jan, 2016</small>
                                            </div>
                                        </a>

                                        <a href="single.html" class="list-group-item list-group-item-action flex-column align-items-start">
                                            <div class="w-100 last-item justify-content-between">
                                                <img src="upload/blog_square_03.jpg" alt="" class="img-fluid float-left">
                                                <h5 class="mb-1">Did you see the most beautiful sea in the world?</h5>
                                                <small>07 Jan, 2016</small>
                                            </div>
                                        </a>
                                    </div>
                                </div><!-- end blog-list --> 
                            </div><!-- end widget -->

                            <div class="widget">
                            <!--      <h2 class="widget-title">Advertising</h2>
                                <div class="banner-spot clearfix">
                                    <div class="banner-img">
                                        <img src="upload/banner_03.jpg" alt="" class="img-fluid">
                                    </div><!-- end banner-img -->
                                </div><!-- end banner -->
                            </div><!-- end widget -->

                            <div class="widget">
                            <!--    <h2 class="widget-title">Instagram Feed</h2>
                                <div class="instagram-wrapper clearfix">
                                    <a class="" href="#"><img src="upload/insta_01.jpeg" alt="" class="img-fluid"></a>
                                    <a href="#"><img src="upload/insta_02.jpeg" alt="" class="img-fluid"></a>
                                    <a href="#"><img src="upload/insta_03.jpeg" alt="" class="img-fluid"></a>
                                    <a href="#"><img src="upload/insta_04.jpeg" alt="" class="img-fluid"></a>
                                    <a href="#"><img src="upload/insta_05.jpeg" alt="" class="img-fluid"></a>
                                    <a href="#"><img src="upload/insta_06.jpeg" alt="" class="img-fluid"></a>
                                    <a href="#"><img src="upload/insta_07.jpeg" alt="" class="img-fluid"></a>
                                    <a href="#"><img src="upload/insta_08.jpeg" alt="" class="img-fluid"></a>
                                    <a href="#"><img src="upload/insta_09.jpeg" alt="" class="img-fluid"></a>
                                </div><!-- end Instagram wrapper -->
                            </div><!-- end widget -->

                            <div class="widget">
                               
                                <div class="link-widget">
                                    
                                </div><!-- end link-widget -->
                            </div><!-- end widget -->
                        </div><!-- end sidebar -->
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section>

        

        <div class="dmtop">Scroll to Top</div>
        
    </div><!-- end wrapper -->
    
    <c:import url="../common/footer.jsp"/>

   <!-- Core JavaScript
    ================================================== -->
    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
    <script src="<c:url value="/resources/js/tether.min.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/custom.js"/>"></script>
</body>
</html>