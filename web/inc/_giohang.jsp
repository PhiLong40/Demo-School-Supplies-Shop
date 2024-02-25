<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="h-custom mt-3">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col" style="height: 510px">
        <p><span class="h2">Giỏ hàng</span><span class="h4">(${cart.size()} sản phẩm trong giỏ hàng của bạn)</span>
            <span style="font-size: large"><a href="BuySP?clear=OK" style="color: #ff6666;">Làm trống cart</a></span>
        </p>
        <c:set var="total" value="0"></c:set>
        <c:forEach items="${cart}" var="product">
        <form action="BuySP" method="post">
        <div class="card mb-4">
          <div class="card-body p-4">

            <div class="row align-items-center">
              <div class="col-md-2">
                <img src="./assets/images/${product.image}"
                  class="img-fluid" alt="Generic placeholder image">
              </div>
              <div class="col-md-4 d-flex">
                <div>
                    <p class="small text-muted" style="font-size: 20px">Mô tả</p>
                  <p class="lead fw-normal mb-0">${product.name}</p>
                </div>
              </div>
              <div class="col-md-2 d-flex justify-content-center">
                <div>
                  <p class="small text-muted" style="font-size: 20px">Màu</p>
                  <p class="lead fw-normal mb-0">Mic</p>
                </div>
              </div>
              
              <div class="col-md-1 d-flex justify-content-center">
               
                <div>
                  <input type="hidden" name="id_product" value="${product.id}">
                  <p class="small text-muted" style="font-size: 20px">Sốlượng</p>
                  <input type="text" name="quantity" value="${product.quantity}" style="width: 30px;">
                </div>
              </div>
              <div class="col-md-1 d-flex justify-content-center">
                <div>
                  <p class="small text-muted" style="font-size: 20px">Đơn giá</p>
                  <p class="lead fw-normal mb-0">${product.price}đ</p>
                </div>
              </div>
                <div class="col-md-2 d-flex justify-content-center">
                    
                    <div>
                        <p class="small text-muted"style="font-size: 20px">Thao tác</p>
                        <p class="mb-0 icontest">
                            <button type="submit" name="action" value="update">
                                <img src="./assets/icon/update.png" width="16" height="16"/>
                            </button>
                            <button type="submit" name="action" value="delete">
                                <img src="./assets/icon/thungrac.jpg" width="20" height="20"/>
                            </button>
                        </p>
                    </div>
                    
                </div>
                
            </div>

          </div>
        </div>
       </form>
        <c:set var="total" value="${total + product.quantity*product.price}"></c:set>
        </c:forEach>
        <div class="card mb-5">
          <div class="card-body p-4">

            <div class="float-end">
              <p class="mb-0 me-5 d-flex align-items-center">
                <span class="me-2" style="color: #FFB0BD; font-family: Nunito-Black; font-size: 22px">Tổng:</span> 
                <span class="lead fw-normal" style="color: #FFB0BD; font-family: 'Nunito-Black'; font-size: 22px">${total}đ</span>
              </p>
            </div>

          </div>
        </div>

        <div class="d-flex justify-content-end" style="padding-bottom: 30px">
          <a href="Home" class="btn btn-light btn-lg me-2">Tiếp tục mua sắm</a>
          <button type="button" class="btn btn-primary btn-lg">Thanh Toán</button>
        </div>

      </div>
    </div>
  </div>
</section>
