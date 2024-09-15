<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Your_Fit</title>
   
<style>

   @font-face {
    font-family: 'InfinitySans-RegularA1';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }
    
   body, h2, p {
    font-family: 'InfinitySans-RegularA1';
   }
</style>

</head>

<body>
      <c:import url="views/common/header.jsp"/>


        <section class="section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 50px;">
                
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
     
                                 <div class="blog-box">
                                  <div class="single-post-media">
                                     <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                         <div class="carousel-inner" role="listbox">
                                             <div class="carousel-item active">
                                                 <img class="d-block img-fluid" src="${pageContext.request.contextPath}/resources/upload/blog_07.jpg" alt="First slide">
                                             </div>
                                             <div class="carousel-item">
                                                 <img class="d-block img-fluid" src="${pageContext.request.contextPath}/resources/upload/blog_08.jpg" alt="Second slide">
                                             </div>
                                             <div class="carousel-item">
                                                 <img class="d-block img-fluid" src="${pageContext.request.contextPath}/resources/upload/blog_09.jpg" alt="Third slide">
                                             </div>
                                         </div>
                                         <ol class="carousel-indicators">
                                             <li data-target="#carouselExampleControls" data-slide-to="0" class="active"></li>
                                             <li data-target="#carouselExampleControls" data-slide-to="1"></li>
                                             <li data-target="#carouselExampleControls" data-slide-to="2"></li>
                                         </ol>
                                     </div>
                                 </div><!-- end post-media -->
                            
                                    <!-- <div class="post-media">
                                        <a href="single.html" title="">
                                            <img src="${pageContext.request.contextPath}/resources/upload/blog_05.jpg" alt="" class="img-fluid">
                                            <div class="hovereffect">
                                                <span></span>
                                            </div><!-- end hover -->
                                      <!--  </a>
                                   </div--><!-- end blog-box -->

                                <hr class="invis">
                            </div><!-- end col -->                            
                           
                     <div class="row">
                     <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <div class="widget">
                            <h2 class="widget-title" style="margin-left: 30px; font-family: 'InfinitySans-RegularA1';">오늘의 베스트</h2>
                            <div class="link-widget">
                                <ul>
                                    <li><a href="#">Fahsion <span>(21)</span></a></li>
                                    <li><a href="#">Lifestyle <span>(15)</span></a></li>
                                    <li><a href="#">Art & Design <span>(31)</span></a></li>
                                    <li><a href="#">Health Beauty <span>(22)</span></a></li>
                                    <li><a href="#">Clothing <span>(66)</span></a></li>
                                    <li><a href="#">Entertaintment <span>(11)</span></a></li>
                                    <li><a href="#">Food & Drink <span>(87)</span></a></li>
                                </ul>
                            </div><!-- end link-widget -->
                        </div><!-- end widget -->
                    </div><!-- end col -->
                    
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <div class="widget">
                            <h2 class="widget-title" style="margin-left: 30px; font-family: 'InfinitySans-RegularA1';">오늘의 추천글</h2>
                            <div class="link-widget">
                                <ul>
                                    <li><a href="#">Fahsion <span>(21)</span></a></li>
                                    <li><a href="#">Lifestyle <span>(15)</span></a></li>
                                    <li><a href="#">Art & Design <span>(31)</span></a></li>
                                    <li><a href="#">Health Beauty <span>(22)</span></a></li>
                                    <li><a href="#">Clothing <span>(66)</span></a></li>
                                    <li><a href="#">Entertaintment <span>(11)</span></a></li>
                                    <li><a href="#">Food & Drink <span>(87)</span></a></li>
                                </ul>
                            </div><!-- end link-widget -->
                        </div><!-- end widget -->
                    </div><!-- end col -->
                  </div>      
                            
                </div><!-- end row -->
                    

                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                      
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="blog-box">
                                    <div class="post-media">
                                        <a href="single.html" title="">
                                            <img src="${pageContext.request.contextPath}/resources/images/BMI.png" alt="" class="img-fluid">
                                        </a>          
                                    </div><!-- end media -->                                   
                                </div><!-- end blog-box -->
                             </div><!-- end col -->

                                <hr class="invis">
                            
                             <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="blog-box">
                                    <div class="post-media">
                                        <a href="${pageContext.request.contextPath}/calorie/calorie_detail.do" title="칼로리처방">
                                            <img src="${pageContext.request.contextPath}/resources/images/CAL.png" alt="" class="img-fluid">                                           
                                        </a>
                                    </div><!-- end media -->
                                </div><!-- end blog-box -->
                            </div><!-- end col -->
                            
                            <hr class="invis">
                         
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top: 30px;">
                        <div class="widget">
                            <h2 class="widget-title" style="margin-left: 30px; font-family: 'InfinitySans-RegularA1';">NOTICE</h2>
                            <div class="link-widget">
                                <ul>
                                    <li><a href="#">Fahsion <span>(21)</span></a></li>
                                    <li><a href="#">Lifestyle <span>(15)</span></a></li>
                                    <li><a href="#">Art & Design <span>(31)</span></a></li>
                                    <li><a href="#">Health Beauty <span>(22)</span></a></li>
                                    <li><a href="#">Clothing <span>(66)</span></a></li>
                                    <li><a href="#">Entertaintment <span>(11)</span></a></li>
                                    <li><a href="#">Food & Drink <span>(87)</span></a></li>
                                </ul>
                            </div><!-- end link-widget -->
                        </div><!-- end widget -->
                    </div><!-- end col -->
                  
                        </div><!-- end row -->
                    </div><!-- end col -->
                </div><!-- end row -->
                </div><!-- end col -->


                <hr class="invis">
                <hr class="invis1">

                <div class="row">
                    <div class="col-lg-12">
                    
                      <div class="row">
                       <div class="col-lg-4 col-md-4">
                        <div class="blog-box">
                            <div class="post-media">
                                <a href="single.html" title="">
                                    <img src="${pageContext.request.contextPath}/resources/upload/blog_10.jpg" alt="" class="img-fluid">
                                    <div class="hovereffect">
                                        <span class="videohover"></span>
                                    </div><!-- end hover -->
                                </a>
                            </div><!-- end media -->
                            <div class="blog-meta">
                                <h4><a href="single.html" title="">We are guests of ABC Design Studio - Vlog</a></h4>
                                <small><a href="blog-category-01.html" title="">Videos</a></small>
                                <small><a href="blog-category-01.html" title="">21 July, 2017</a></small>
                            </div><!-- end meta -->
                        </div><!-- end blog-box -->
                       </div>

                        <hr class="invis">
                        
                      <div class="col-lg-4 col-md-4">
                        <div class="blog-box">
                            <div class="post-media">
                                <a href="single.html" title="">
                                    <img src="${pageContext.request.contextPath}/resources/upload/blog_11.jpg" alt="" class="img-fluid">
                                    <div class="hovereffect">
                                        <span class="videohover"></span>
                                    </div><!-- end hover -->
                                </a>
                            </div><!-- end media -->
                            <div class="blog-meta">
                                <h4><a href="single.html" title="">Nostalgia at work</a></h4>
                                <small><a href="blog-category-01.html" title="">Videos</a></small>
                                <small><a href="blog-category-01.html" title="">20 July, 2017</a></small>
                            </div><!-- end meta -->
                        </div><!-- end blog-box -->
                      </div>

                        <hr class="invis">
                        
                      <div class="col-lg-4 col-md-4">
                        <div class="blog-box">
                            <div class="post-media">
                                <a href="single.html" title="">
                                    <img src="${pageContext.request.contextPath}/resources/upload/blog_12.jpg" alt="" class="img-fluid">
                                    <div class="hovereffect">
                                        <span class="videohover"></span>
                                    </div><!-- end hover -->
                                </a>
                            </div><!-- end media -->
                            <div class="blog-meta">
                                <h4><a href="single.html" title="">How to become a good vlogger</a></h4>
                                <small><a href="blog-category-01.html" title="">Beauty</a></small>
                                <small><a href="blog-category-01.html" title="">20 July, 2017</a></small>
                            </div><!-- end meta -->
                        </div><!-- end blog-box -->
                      </div>
                        
                      </div>

                        <hr class="invis">

                        

                        <div class="row">
                       <div class="col-lg-4 col-md-4">
                        <div class="blog-box">
                            <div class="post-media">
                                <a href="single.html" title="">
                                    <img src="${pageContext.request.contextPath}/resources/upload/blog_10.jpg" alt="" class="img-fluid">
                                    <div class="hovereffect">
                                        <span class="videohover"></span>
                                    </div><!-- end hover -->
                                </a>
                            </div><!-- end media -->
                            <div class="blog-meta">
                                <h4><a href="single.html" title="">We are guests of ABC Design Studio - Vlog</a></h4>
                                <small><a href="blog-category-01.html" title="">Videos</a></small>
                                <small><a href="blog-category-01.html" title="">21 July, 2017</a></small>
                            </div><!-- end meta -->
                        </div><!-- end blog-box -->
                       </div>

                        <hr class="invis">
                        
                      <div class="col-lg-4 col-md-4">
                        <div class="blog-box">
                            <div class="post-media">
                                <a href="single.html" title="">
                                    <img src="${pageContext.request.contextPath}/resources/upload/blog_11.jpg" alt="" class="img-fluid">
                                    <div class="hovereffect">
                                        <span class="videohover"></span>
                                    </div><!-- end hover -->
                                </a>
                            </div><!-- end media -->
                            <div class="blog-meta">
                                <h4><a href="single.html" title="">Nostalgia at work</a></h4>
                                <small><a href="blog-category-01.html" title="">Videos</a></small>
                                <small><a href="blog-category-01.html" title="">20 July, 2017</a></small>
                            </div><!-- end meta -->
                        </div><!-- end blog-box -->
                      </div>

                        <hr class="invis">
                        
                      <div class="col-lg-4 col-md-4">
                        <div class="blog-box">
                            <div class="post-media">
                                <a href="single.html" title="">
                                    <img src="${pageContext.request.contextPath}/resources/upload/blog_12.jpg" alt="" class="img-fluid">
                                    <div class="hovereffect">
                                        <span class="videohover"></span>
                                    </div><!-- end hover -->
                                </a>
                            </div><!-- end media -->
                            <div class="blog-meta">
                                <h4><a href="single.html" title="">How to become a good vlogger</a></h4>
                                <small><a href="blog-category-01.html" title="">Beauty</a></small>
                                <small><a href="blog-category-01.html" title="">20 July, 2017</a></small>
                            </div><!-- end meta -->
                        </div><!-- end blog-box -->
                      </div>
                      
                <hr class="invis1">

               
            </div><!-- end container -->
        </section>

        

        <div class="dmtop">Scroll to Top</div>
        
    </div><!-- end wrapper -->
    
    <c:import url="views/common/footer.jsp"/>

    <!-- Core JavaScript
    ================================================== -->
    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
    <script src="<c:url value="/resources/js/tether.min.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/custom.js"/>"></script>

</body>
</html>