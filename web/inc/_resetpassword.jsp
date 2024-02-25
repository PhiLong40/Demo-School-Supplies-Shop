<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container d-flex align-items-center justify-content-center" style="padding-top: 80px">
    <form action="" method="post">
  <div class="card text-center" style="width: 400px;">
      <div class="card-header h5 text-white" style="background-color: rgba(255,176,189,.9)">Quên mật khẩu</div>
    <div class="card-body px-5">
      
      <div class="form-outline">
        <label for="Email">Mật khẩu mới</label>
        <input type="password" id="typeEmail" name="rspass" class="form-control my-3" required="required"/>
        <label for="Email">Nhập lại Mật khẩu mới</label>
        <input type="password" id="typeEmail" name="rerspass" class="form-control my-3" required="required"/>
        <span style="color: red">${err_pass}</span>
      </div>
      <button type="submit" class="btn w-100 text-white" style="background-color: rgba(255,176,189,.9)">Gửi</button>
      <div class="d-flex justify-content-between mt-4">
      </div>
    </div>
  </div>
  </form>
</div>