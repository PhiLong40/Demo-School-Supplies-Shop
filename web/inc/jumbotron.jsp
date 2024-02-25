<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- carousel -->
<div class="carousel slide" id="carouselDemo" data-bs-wrap="true" data-bs-ride="carousel">
    
    <div class="carousel-inner">
        <div class="carousel-item active" data-bs-interval="2000">
            <img src="./assets/images/poster0.jpg" class="thunho">
        </div>
        <div class="carousel-item" data-bs-interval="2000">
            <img src="./assets/images/poster1.jpg" class="thunho">
        </div>
        <div class="carousel-item" data-bs-interval="2000">
            <img src="./assets/images/poster2.jpg" class="thunho">
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