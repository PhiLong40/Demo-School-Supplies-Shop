<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container d-flex align-items-center justify-content-center" style="padding-top: 80px">
    <form action="Forgot" method="post">
  <div class="card text-center" style="width: 400px;">
      <div class="card-header h5 text-white" style="background-color: rgba(255,176,189,.9)">Quên mật khẩu</div>
    <div class="card-body px-5">
      <p class="card-text py-2">
        Nhập địa chỉ email của bạn và chúng tôi sẽ gửi cho bạn một email kèm theo hướng dẫn để đặt lại mật khẩu của bạn.
      </p>
      <div class="form-outline">
        <input type="email" id="typeEmail" name="Email" class="form-control my-3" required="required"/>
        <span style="color: red">${err_email}</span>
        <span style="color: #33ff00">${accept}</span>
      </div>
      <button type="submit" class="btn w-100 text-white" style="background-color: rgba(255,176,189,.9)">Gửi</button>
      <div class="d-flex justify-content-between mt-4">
        <a class="" href="#">Đăng nhập</a>
        <a class="" href="#">Đăng ký</a>
      </div>
    </div>
  </div>
  </form>
</div>