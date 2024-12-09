<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core"%>
<div class="col-xl-12 col-lg-12">
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Cập nhật thông tin nhân viên</h4>
        </div>
        <div class="card-body">
            <div class="basic-form">
                <form action="/WinterHold_HRM/staff?action=update" method="post" enctype="multipart/form-data">

                    <!-- Input hidden để chứa ID của nhân viên cần cập nhật -->
                    <input type="hidden" name="id" value="${staff.id}">

                    <div class="row">
                        <div class="mb-3 col-md-6">
                            <label class="form-label">Họ và tên</label>
                            <input type="text" class="form-control" name="stName" placeholder="Họ và tên" value="${staff.name}">
                        </div>
                        <div class="mb-3 col-md-6">
                            <label class="form-label">Giới tính</label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" value="1" ${staff.gender == 1 ? 'checked' : ''}>
                                <label class="form-check-label"> Nam </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" value="0" ${staff.gender == 0 ? 'checked' : ''}>
                                <label class="form-check-label"> Nữ </label>
                            </div>
                        </div>
                        <div class="col-xl-3 col-xxl-6 col-md-6 mb-3">
                            <label class="form-label">Ngày sinh</label>
                            <input type="text" class="form-control" name="dateOfBirth" placeholder="yyyy-MM-dd" id="mdate" value="${staff.dateOfBirth}">
                        </div>

                        <div class="mb-3 col-md-9">
                            <label class="form-label">Quê quán</label>
                            <input type="text" class="form-control" name="address" value="${staff.address}">
                        </div>
                        <div class="mb-3 col-md-6">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" placeholder="Email" value="${staff.email}">
                        </div>
                        <div class="mb-3 col-md-6">
                            <label class="form-label">Số điện thoại</label>
                            <input type="text" class="form-control" name="phoneNumber" value="${staff.phoneNumber}">
                        </div>
                    </div>

                    <div class="row">
                        <div class="mb-3 col-md-3">
                            <label class="form-label">Phòng Ban</label>
                            <select id="departmentId" name="departmentId" class="default-select form-control wide">
                                <c:forEach var="department" items="${departments}">
                                    <option value="${department.ID_dp}" ${department.ID_dp == staff.departmentId ? 'selected' : ''}>${department.dpName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3 col-md-3">
                            <label class="form-label">Chức vụ</label>
                            <select id="officeId" name="officeId" class="default-select form-control wide">
                                <c:forEach var="office" items="${offices}">
                                    <option value="${office.ID_of}" ${office.ID_of == staff.officeId ? 'selected' : ''}>${office.ofName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3 col-md-6">
                            <label class="form-label">Căn cước công dân</label>
                            <input type="text" class="form-control" name="CCCD" value="${staff.CCCD}">
                        </div>
                         <div class="mb-3 col-md-6">
                            <label class="form-label">Avatar</label>
                            <input type="text" class="form-control" name="iamge" value="${staff.image}">
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                </form>
            </div>
        </div>
    </div>
</div>
