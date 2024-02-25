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
    <div class="container mt-5">
    <h2 class="mb-4">Thêm sản phẩm đồ dùng học tập mới</h2>

    <form method="post" action="Themsanpham">
        <div class="mb-3">
            <label for="foodName" class="form-label">Tên đồ dùng:</label>
            <input type="text" class="form-control" id="Name" name="name" required>
        </div>

        <div class="mb-3">
            <label for="price" class="form-label">Số tiền:</label>
            <input type="number" class="form-control" id="price" name="price" required>
        </div>
        
        <div class="mb-3">
            <label for="price" class="form-label">Số lượng:</label>
            <input type="number" class="form-control" id="price" name="quantity" required>
        </div>
            <label for="file">Ảnh</label>
            <input type="file" name="img" id="file" accept="image/*" required>
            <br>

        <div class="mb-3">
            <label for="category" class="form-label">Loại sản phẩm:</label>
            <select class="form-select" id="category" name="category" required>
                <c:forEach items="${listCategory}" var="category">
                <option value="${category.id}">${category.name}</option>
                </c:forEach>
            </select>
        </div>

<!--        <div class="mb-3">
            <label for="image" class="form-label">Image URL:</label>
            <input type="url" class="form-control" id="image" name="image" required>
        </div>-->

<button type="submit" class="btn text-white" style="background-color: rgba(255,176,189,.9)">Thêm sản phẩm</button>
    </form>
</div>
</div>

<!-- ====== ionicons ======= -->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>

