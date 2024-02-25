<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${id_category==null}" >
        <c:forEach items="${listCategory}" var="category">
        <section>
            <div class="container my-5">
                <header class="mb-4">
                    <h3>${category.name}</h3>
                </header>
                <div class="row">
                    <c:forEach items="${listProduct}" var="product">
                        <c:if test="${category.id == product.id_category && product.status==true}">
                            <div class="col-lg-3 col-md-6 col-sm-6 d-flex">
                                <div class="card w-100 my-2 shadow-2-strong">
                                    <div class="blockImage">
                                    <img src="./assets/images/${product.image}" class="card-img-top Hover" style="aspect-ratio: 1 / 1" />
                                    <div class="d-flex align-items-end px-0 mt-auto giohang">
                                        <a href="
                                           <c:if test="${user==null}">
                                               Dangnhap
                                           </c:if>
                                           <c:if test="${user!=null}">
                                               Home?id_product=${product.id}
                                           </c:if>
                                           " class="js-add-cart btn shadow-0 me-1"></a>
                                    </div>
                                    </div>
                                    <div class="card-body d-flex flex-column">
                                        <h5 class="card-title">
                                            <a href="">${product.name}</a>
                                        </h5>
                                        <p class="card-text">${product.price}đ</p>
                                    </div>
                                </div>
                            </div>                   
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </section>
        </c:forEach>
        </c:if>

<c:if test="${id_category!=null}">
    <c:forEach items="${listCategory}" var="category">
        <c:if test="${category.id == id_category}">
            <section>
            <div class="container my-5">
                <header class="mb-4">
                    <h3>${category.name}</h3>
                </header>
                <div class="row">
                    <c:forEach items="${listProduct}" var="product">
                        <c:if test="${category.id == product.id_category && product.status==true}">
                            <div class="col-lg-3 col-md-6 col-sm-6 d-flex">
                                <div class="card w-100 my-2 shadow-2-strong">
                                    <div class="blockImage">
                                    <img src="./assets/images/${product.image}" class="card-img-top Hover" style="aspect-ratio: 1 / 1" />
                                    <div class="d-flex align-items-end px-0 mt-auto giohang">
                                        <a href="
                                           <c:if test="${user==null}">
                                               Dangnhap
                                           </c:if>
                                           <c:if test="${user!=null}">
                                               Home?id_product=${product.id}
                                           </c:if>
                                           " class="js-add-cart btn shadow-0 me-1"></a>
                                    </div>
                                    </div>
                                    <div class="card-body d-flex flex-column">
                                        <h5 class="card-title">
                                            <a href="">${product.name}</a>
                                        </h5>
                                        <p class="card-text">${product.price}đ</p>
                                    </div>
                                </div>
                            </div>                   
                        </c:if>
                    </c:forEach>

                </div>
            </div>
        </section>
        </c:if>
    </c:forEach>
</c:if>
