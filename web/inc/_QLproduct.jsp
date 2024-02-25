<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- =============== Navigation ================ -->
<div class="navigation">
    <ul>
        <li>
            <a href="#">
                <span class="icon">
                    <ion-icon name="logo-apple"></ion-icon>
                </span>
                <span class="title">Quản lý</span>
            </a>
        </li>

        <li>
            <a href="#">
                <span class="icon">
                    <ion-icon name="home-outline"></ion-icon>
                </span>
                <span class="title">Trang chủ</span>
            </a>
        </li>

        <li>
            <a href="#">
                <span class="icon">
                    <ion-icon name="people-outline"></ion-icon>
                </span>
                <span class="title">Customers</span>
            </a>
        </li>

        <li>
            <a href="./sanphamAdmin">
                <span class="icon">
                    <ion-icon name="book-outline"></ion-icon>
                </span>
                <span class="title">Products</span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="icon">
                    <ion-icon name="lock-closed-outline"></ion-icon>
                </span>
                <span class="title">Password</span>
            </a>
        </li>

        <li>
            <a href="Dangnhap">
                <span class="icon">
                    <ion-icon name="log-out-outline"></ion-icon>
                </span>
                <span class="title">Sign Out</span>
            </a>
        </li>
    </ul>
</div>

<!-- ========================= Main ==================== -->

<div class="main">
    <div class="float-end" style="padding-bottom: 30px; padding-top: 30px; padding-right: 50px">
        <a href="./Themsanpham" class="btn btn-primary" >Thêm sản phẩm</a>
    </div>
    <table class="table mx-auto">
        <thead style="background-color: ">
        <tr>
            <th>STT</th>
            <th>Ảnh</th>
            <th>Tên sản phẩm</th>
            <th>Số tiền</th>
            <th>Số lượng</th>
            <th>Trạng thái</th>
            <th>Thao tác</th>
        </tr>
    </thead>
    <c:forEach items="${listProduct}" var="product" >
    <tbody>
        <tr>
            <td>${i}</td>
            <td><img src="./assets/images/${product.image}" width="100px" alt=""></td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.quantity}</td>
            <td>${product.status}</td>
            <form action="sanphamAdmin" method="post">
            <td>
                <input type="hidden" name="id_product" value="${product.id}">
                <a href="./Suasanpham?id=${product.id}" class="btn btn-primary" >Edit</a>
                <button name="abc" type="submit" class="btn btn-danger btn-sm" style="background-color: #ff6666;" value="delete">Delete</button>
            </td>
            </form>
        </tr>
    </tbody>
    </c:forEach>
</table>
</div>

<!-- ====== ionicons ======= -->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>

