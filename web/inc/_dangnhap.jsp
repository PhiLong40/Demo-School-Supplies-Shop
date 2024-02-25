<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="my-5">
    <div class="container-fluid h-custom">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-9 col-lg-6 col-xl-7">
                <div class="carousel slide" id="carouselDemo" data-bs-wrap="true" data-bs-ride="carousel">

                    <div class="carousel-inner">
                        <div class="carousel-item active" data-bs-interval="2000">
                            <img src="./assets/images/poster0.jpg" class="thunho2">
                        </div>
                        <div class="carousel-item" data-bs-interval="2000">
                            <img src="./assets/images/poster4.jpg" class="thunho2">
                        </div>
                        <div class="carousel-item" data-bs-interval="2000">
                            <img src="./assets/images/poster5.jpg" class="thunho2">
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselDemo"
                                data-bs-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselDemo"
                                data-bs-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </button>
                        <div class="carousel-indicators">
                            <button type="button" class="active" data-bs-target="#carouselDemo" data-bs-slide-to="0"></button>
                            <button type="button" class="active" data-bs-target="#carouselDemo" data-bs-slide-to="1"></button>
                            <button type="button" class="active" data-bs-target="#carouselDemo" data-bs-slide-to="2"></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8 col-lg-6 col-xl-4" style="margin-left: 20px">
                <form action="" method="post">
                    <h1 style="padding: 30px 0 30px 0; color: rgba(255,176,189,.9)">Đăng nhập</h1>
                    <div class="link-danger">${error_login}</div>
                    <!-- Email input -->
                    <div class="form-outline mb-4">
                        <input type="type" name="emailphone" class="form-control form-control-lg" id="emailphone"
                               placeholder="Nhập Email hoặc Số điện thoại" />
                        
                    </div>
                    <!-- Password input -->
                    <div class="form-outline mb-3">
                        <input type="password" name="password" class="form-control form-control-lg"
                               placeholder="Nhập mật khẩu" />
                        
                    </div>

                    <div class="d-flex justify-content-between align-items-center">
                        <!-- Checkbox -->
                        <div class="form-check mb-0">
                            <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
                            <label class="form-check-label" for="form2Example3">
                                Nhớ mật khẩu
                            </label>
                        </div>
                        <a href="Forgot" class="qmk">Quên mật khẩu?</a>
                    </div>
                    
                    <div class="text-center ">
                        <button type="submit" class="btn btn-lg" 
                                style="padding-left: 2.5rem; padding-right: 2.5rem; background: rgba(255,176,189,.9)">Login</button>
                        <p class="small fw-bold mt-2 pt-1 mb-0">Bạn chưa có tài khoản? 
                        <a href="Dangky"class="link-danger">Đăng ký</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>