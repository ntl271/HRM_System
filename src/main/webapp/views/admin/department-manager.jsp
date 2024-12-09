<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content="admin, dashboard">
<meta name="author" content="DexignZone">
<meta name="robots" content="index, follow">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Dompet : Payment Admin Template">
<meta property="og:title" content="Dompet : Payment Admin Template">
<meta property="og:description"
	content="Dompet : Payment Admin Template">
<meta property="og:image"
	content="https://dompet.dexignlab.com/xhtml/social-image.png">
<meta name="format-detection" content="telephone=no">

<!-- PAGE TITLE HERE -->
<title></title>

<!-- Datatable -->
<link
	href="/WinterHold_HRM/views/resources/vendor/datatables/css/jquery.dataTables.min.css"
	rel="stylesheet">
<!-- Custom Stylesheet -->
<link
	href="/WinterHold_HRM/views/resources/vendor/jquery-nice-select/css/nice-select.css"
	rel="stylesheet">
<!-- FAVICONS ICON -->
<link rel="shortcut icon" type="image/png"
	href="/WinterHold_HRM/views/resources/images/favicon.png">
<link
	href="/WinterHold_HRM/views/resources/vendor/sweetalert2/dist/sweetalert2.min.css"
	rel="stylesheet">


<link rel="stylesheet"
	href="/WinterHold_HRM/views/resources/vendor/nouislider/nouislider.min.css">
<!-- Style css -->
<link href="/WinterHold_HRM/views/resources/css/style.css"
	rel="stylesheet">

<!-- Custom CSS for modal -->
<style>
.modal1 {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 80%; /* Could be more or less, depending on screen size */
	max-width: 800px; /* Maximum width of the modal */
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.list-group {
	
}

.edit-form {
	display: none;
	position: fixed;
	top: 300px; /* Cách trên cùng màn hình 20px */
	left: 50%;
	transform: translateX(-50%);
	width: 300px; /* Chiều rộng của form */
	background-color: #EDEDED;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	z-index: 1000;
}

.edit-form .form-group {
	margin-bottom: 15px;
}

.edit-form label {
	display: block;
	margin-bottom: 5px;
}

.edit-form input, .edit-form select, .edit-form button {
	width: 100%;
}
</style>

</head>
<body>

	<!--*******************
        Màn hình loading
    ********************-->
	<div id="preloader">
		<div class="waviy">
			<span style="--i: 1">L</span> <span style="--i: 2">o</span> <span
				style="--i: 3">a</span> <span style="--i: 4">d</span> <span
				style="--i: 5">i</span> <span style="--i: 6">n</span> <span
				style="--i: 7">g</span> <span style="--i: 8">.</span> <span
				style="--i: 9">.</span> <span style="--i: 10">.</span>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->

	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		<!--**********************************
            Nav header start
        ***********************************-->
		<jsp:include page="template/admin_nav-header.jsp" />
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Chat box start
        ***********************************-->


		<!--**********************************
            Header start
        ***********************************-->
		<jsp:include page="template/admin_dlanav.jsp" />

		<!--**********************************
            Sidebar start
        ***********************************-->


		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="container-fluid">

				<div class="row page-titles">
					<ol class="breadcrumb">
						<li class="breadcrumb-item active"><a
							href="javascript:void(0)">Page</a></li>
						<li class="breadcrumb-item"><a href="/WinterHold_HRM/staff">Quản
								lý Phòng ban</a></li>
					</ol>
				</div>
				<!-- row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="profile card card-body px-3 pt-3 pb-0">
							<div class="profile-head">
								<div class="photo-content">
									<div class="cover-photo rounded"></div>
								</div>
								<div class="profile-info">
									<div class="profile-photo">
										<img src="images/profile/profile.png"
											class="img-fluid rounded-circle" alt="">
									</div>
									<div class="profile-details">
										<div class="profile-name col-xl-11 px-3 pt-2">
											<h2 class="text-primary mb-0 text-center">
												<c:out value="${department.dpName}" />

											</h2>
											<p class="text-center">WinterHold Company</p>
										</div>

										<div class="dropdown ms-auto">
											<a href="#" class="btn btn-primary light sharp"
												data-bs-toggle="dropdown" aria-expanded="false"><svg
													xmlns="http://www.w3.org/2000/svg"
													xmlns:xlink="http://www.w3.org/1999/xlink" width="18px"
													height="18px" viewBox="0 0 24 24" version="1.1">
													<g stroke="none" stroke-width="1" fill="none"
														fill-rule="evenodd">
													<rect x="0" y="0" width="24" height="24"></rect>
													<circle fill="#000000" cx="5" cy="12" r="2"></circle>
													<circle fill="#000000" cx="12" cy="12" r="2"></circle>
													<circle fill="#000000" cx="19" cy="12" r="2"></circle></g></svg></a>
											<ul class="dropdown-menu dropdown-menu-end" style="">
												<c:forEach items="${departments}" var="department">
													<li class="dropdown-item"><a class="dropdown-item"
														href="/WinterHold_HRM/department?id=${department.ID_dp}">
															<i class="fa fa-users text-primary me-2"></i>${department.dpName}</a></li>
												</c:forEach>


												<li class="dropdown-item"><a href="javascript:void();;"
													class="dropdown-item" data-bs-toggle="modal"
													data-bs-target="#addDepartmantModal"><i
														class="fa fa-plus text-primary me-2"></i> Thêm phòng ban
														mới</a></li>
												<li class="dropdown-item"><i
													class="fa fa-ban text-primary me-2"></i> Block</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-xl-4">
						<div class="row">
							<div class="col-xl-12">
								<div class="card">
									<div class="card-body">
										<div class="profile-blog">
											<h5 class="text-primary d-inline">
												<c:out value="${department.dpName}" />
											</h5>
											<img src="images/profile/1.jpg" alt=""
												class="img-fluid mt-4 mb-4 w-100">
											<h4>
												<a href="post-details.html" class="text-black">Thông tin
													về phòng ban</a>
											</h4>
											<p class="mb-0">
												<c:out value="${department.dpDescription}" />
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-12">
								<div class="card">
									<div class="card-body">
										<div class="profile-statistics">
											<div class="text-center">
												<div class="row">
													<div class="col">
														<h3 class="m-b-0">150</h3>
														<span>Follower</span>
													</div>
													<div class="col">
														<h3 class="m-b-0">
															<c:out value="${staffCount}" />
														</h3>
														<span>Nhân viên</span>
													</div>
													<div class="col">
														<h3 class="m-b-0">45</h3>
														<span>Reviews</span>
													</div>
												</div>
												<div class="mt-4">
													<a href="javascript:void();;" class="btn btn-primary mb-1"
														data-bs-toggle="modal" data-bs-target="#addStaff">Thêm
														nhân viên vào phòng ban</a>
												</div>

											</div>
											<!-- Modal add staff -->
											<div class="modal fade" id="addStaff">
												<div class="modal-dialog modal-dialog-centered"
													role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title">Chọn nhân viên mới</h5>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal"></button>
														</div>
														<div class="modal-body">
															<form class="comment-form"
																action="department?action=editDp" method="post">
																<div class="row">
																	<div class="col-lg-12">
																		<div class="mb-3">
																			<input type="hidden" class="id"
																				value="<c:out value="${department.ID_dp}" />"
																				name="id"> <input type="hidden"
																				class="newDepartment"
																				value="<c:out value="${department.ID_dp}" />"
																				name="newDepartment"> <label
																				class="text-black font-w600 form-label">Tên
																				chức vụ <span class="required">*</span>
																			</label> <select id="staffId" name="staffId"
																				class=" form-control wide mb-3">
																				<c:forEach items="${dpAssignment.staff}"
																					var="staff1">
																					<option value="${staff1.ID_staff}">${staff1.stName}-${staff1.ID_staff}</option>
																				</c:forEach>

																			</select> <label class="text-black font-w600 form-label">Chức
																				vụ<span class="required">*</span>
																			</label> <select id="newPosition" name="newPosition"
																				class=" form-control wide mb-3">
																				<c:forEach items="${dpWithOf.office}" var="office">
																					<option value="${office.ID_of}">${office.ofName}</option>
																				</c:forEach>
																			</select>
																		</div>
																	</div>
																	<div class="col-lg-12">
																		<div class="mb-1 mb-0 text-center">
																			<button type="submit" class="btn btn-primary">Submit</button>

																		</div>
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>

											<!-- Modal -->
											<div class="modal fade" id="sendMessageModal">
												<div class="modal-dialog modal-dialog-centered"
													role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title">Thêm chức vụ mới cho phòng
																ban</h5>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal"></button>
														</div>
														<div class="modal-body">
															<form class="comment-form"
																action="office?action=addOffice" method="post">
																<div class="row">
																	<div class="col-lg-12">
																		<div class="mb-3">
																			<input type="hidden" class="id"
																				value="<c:out value="${department.ID_dp}" />"
																				name="id"> <label
																				class="text-black font-w600 form-label">Tên
																				chức vụ <span class="required">*</span>
																			</label> <input type="text" class="ofName form-control"
																				value="" name="ofName" placeholder="Author">
																			<label class="text-black font-w600 form-label">Lương
																				cơ bản <span class="required">*</span>
																			</label> <input type="text" class="ofName form-control"
																				value="" name="salary" placeholder="money">
																		</div>
																	</div>
																	<div class="col-lg-12">
																		<div class="mb-1 mb-0 text-center">

																			<input type="submit" value="Submit"
																				class="submit btn btn-primary" name="submit">
																		</div>

																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Chức vụ trong phòng ban</h4>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table class="table table-bordered table-responsive-sm">
												<thead>
													<tr>
														<th>#</th>
														<th>Tên chức vụ</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${dpWithOf.office}" var="office">
														<tr>

															<th>${office.ID_of}</th>
															<td>${office.ofName}</td>

														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<div class="text-center">
											<div class="mt-4">
												<a href="javascript:void();;" class="btn btn-primary mb-1"
													data-bs-toggle="modal" data-bs-target="#sendMessageModal">Thêm
													chức vụ mới</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- Modal -->
							<div class="modal fade" id="addDepartmantModal">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Thêm phòng ban mới</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal"></button>
										</div>
										<div class="modal-body">
											<form class="comment-form" action="department?action=addDp">
												<div class="row">
													<div class="col-lg-12">
														<div class="mb-3">
															<input type="hidden" class="id"
																value="<c:out value="${department.ID_dp}" />" name="id">
															<label class="text-black font-w600 form-label">Tên
																phòng ban <span class="required">*</span>
															</label> <input type="text" class="dpName form-control" value=""
																name="dpName" placeholder="Phòng ban">
														</div>
													</div>
													<div class="col-lg-12">
														<div class="mb-3">
															<label class="text-black font-w600 form-label">Description</label>
															<textarea rows="8" class="description form-control"
																name="description" placeholder="Mô tả"></textarea>
														</div>
													</div>
													<div class="col-lg-12 text-center">
														<div class="mb-1 mb-0">
															<input type="submit" value="Submit"
																class="submit btn btn-primary" name="action">
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>



						</div>
					</div>
					<div class="col-xl-8">
						<div class="col-xl-12 col-xxl-6 col-lg-6 col-sm-6">
							<div class="widget-stat card bg-primary">
								<div class="card-body  p-1">
									<div class="media">
										<span class="me-3"> <i class="la la-users"></i>
										</span>
										<div class="media-body text-center text-white">
											<p class="mb-1  me-5">Danh sách nhân viên</p>
											<h3 class="text-white  me-5">
												<c:out value="${staffCount}" />
											</h3>

										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<c:forEach items="${department.staff}" var="staff"
								varStatus="status">
								<div class="col-xl-4 col-lg-8 col-sm-8">
									<div class="card overflow-hidden">
										<div class="text-center p-3 overlay-box "
											style="background-image: url(/WinterHold_HRM/views/resources/images/big/img1.jpg);">
											<div class="profile-photo">
											<!--views/resources/images/profile/profile.png  -->
												<img
													src="/WinterHold_HRM/<c:out value="${staff.image}" />"
													width="100" class="img-fluid rounded-circle" alt="">
											</div>
											<h3 class="mt-3 mb-1 text-white">${staff.stName}</h3>
											<p class="text-white mb-0">${staff.office.ofName}</p>
										</div>
										<ul class="list-group list-group-flush">
											<li class="list-group-item d-flex justify-content-between"><span
												class="mb-0">Patient Gender</span> <strong
												class="text-muted">${staff.gender ? 'Male' : 'Female'}
											</strong></li>
											<li class="list-group-item d-flex justify-content-between"><span
												class="mb-0">Liên hệ</span> <strong class="text-muted">${staff.email}
											</strong></li>
										</ul>
										<div class="card-footer border-0 mt-0">
											<div class="btn-group dropup mb-1 col-xl-12">
												<button type="button"
													class="btn btn-primary dropdown-toggle"
													data-bs-toggle="dropdown" aria-expanded="false">
													Options</button>
												<div class="dropdown-menu col-xl-12" style="">
													<a class="dropdown-item showFormButton"
														data-id="${status.index}" href="#">View</a> <a
														class="dropdown-item"
														onclick="showEditForm(${staff.ID_staff})">Thay đổi
														chức vụ</a> <a class="dropdown-item"
														href="department?action=editDp&staffId=${staff.ID_staff}&newDepartment=5&newPosition=17&id=${department.ID_dp}">Khai
														trừ khỏi phòng ban</a>
												</div>
											</div>

										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--**********************************
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
		<jsp:include page="template/admin_footer.jsp" />
		<!--**********************************
            Footer end
        ***********************************-->

	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!-- Modal -->
	<div id="myModal" class="modal1">
		<div class="modal-content">
			<span class="close">&times;</span>
			<form id="myForm">
				<div class="card-header">
					<h4 class="card-title">Staff Details</h4>
				</div>
				<div class="card-body ">
					<div class="basic-list-group">
						<ul class="list-group" id="staffDetailsList">
							<!-- Thông tin nhân viên sẽ được cập nhật ở đây -->
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- Form sửa chức vụ -->
	<div id="editForm" class="edit-form" style="display: none;">
		<form id="editPositionForm" method="post"
			action="department?action=edit">
			<input type="text" name="staffId2" id="staffId2" value="" /> <input
				type="text" name="id" id="id"
				value="<c:out value="${department.ID_dp}" />" />
			<div class="form-group">
				<label for="newPosition">Chức vụ mới:</label> <select
					id="newPosition" name="newPosition"
					class="default-select form-control wide mb-3">
					<c:forEach items="${dpWithOf.office}" var="office">
						<option value="${office.ID_of}">${office.ofName}</option>
					</c:forEach>
				</select>
			</div>
			<div class="mt-4 col-xl-12 text-center">
				<button type="submit" class="btn btn-social btn-primary">Lưu</button>
			</div>
			<div class="mt-4 col-xl-12 text-center">
				<button type="button" class="btn btn-social btn-secondary"
					onclick="hideEditForm()">Hủy</button>
			</div>
		</form>
	</div>


	<!-- Required vendors -->
	<script
		src="/WinterHold_HRM/views/resources/vendor/global/global.min.js"></script>
	<script
		src="/WinterHold_HRM/views/resources/vendor/chart.js/Chart.bundle.min.js"></script>
	<!-- Apex Chart -->
	<script
		src="/WinterHold_HRM/views/resources/vendor/apexchart/apexchart.js"></script>
	<script
		src="/WinterHold_HRM/views/resources/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
	<script
		src="/WinterHold_HRM/views/resources/js/plugins-init/sweetalert.init.js"></script>
	<!-- Datatable -->
	<script
		src="/WinterHold_HRM/views/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="/WinterHold_HRM/views/resources/js/plugins-init/datatables.init.js"></script>

	<script
		src="/WinterHold_HRM/views/resources/vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>

	<script src="/WinterHold_HRM/views/resources/js/custom.min.js"></script>
	<script src="/WinterHold_HRM/views/resources/js/dlabnav-init.js"></script>
	<script src="/WinterHold_HRM/views/resources/js/demo.js"></script>
	<script src="/WinterHold_HRM/views/resources/js/styleSwitcher.js"></script>

	<!-- JavaScript để hiển thị form -->
	<script>
	function showEditForm(staffId2) {
	    console.log("Staff ID:", staffId2); // Log the staff ID to check its value
	    if (!staffId2) {
	        alert("Staff ID is missing.");
	        return;
	    }
	    document.getElementById("staffId2").value = staffId2;
	    document.getElementById("editForm").style.display = "block";
	}

	function hideEditForm() {
	    document.getElementById("editForm").style.display = "none";
	}
	  // Định nghĩa biến JavaScript để lưu trữ danh sách nhân viên
    var listStaff = [
        <c:forEach var="staff" items="${department.staff}">
            {
                ID_staff: "${staff.ID_staff}",
                stName: "${staff.stName}",
                gender: "${staff.gender}",
                dateOfBirth: "${staff.dateOfBirth}",
                email: "${staff.email}",
                phoneNumber: "${staff.phoneNumber}",
                address: "${staff.address}",
                CCCD: "${staff.CCCD}",
                dpName: "${staff.department.dpName}",
                ofName: "${staff.office.ofName}"
            }<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];

    $(document).ready(function() {
        // Xử lý sự kiện khi nhấn vào nút Xem
        $('.showFormButton').click(function(e) {
            e.preventDefault();

            // Lấy index từ data-id của nút Xem
            var index = $(this).data('id');

            // Lấy thông tin staff từ listStaff
            var staff = listStaff[index];

            // Đổ thông tin staff lên form modal
            var ul = $('#staffDetailsList');
            ul.empty();

            ul.append('<li class="list-group-item active">ID: ' + staff.ID_staff + '</li>');
            ul.append('<li class="list-group-item">Name: ' + staff.stName + '</li>');
            ul.append('<li class="list-group-item">Gender: ' + (staff.gender ? 'Male' : 'Female') + '</li>');
            ul.append('<li class="list-group-item">Date of Birth: ' + staff.dateOfBirth + '</li>');
            ul.append('<li class="list-group-item">Email: ' + staff.email + '</li>');
            ul.append('<li class="list-group-item">Phone Number: ' + staff.phoneNumber + '</li>');
            ul.append('<li class="list-group-item">Adress: ' + staff.address + '</li>');
            ul.append('<li class="list-group-item">Căn cước công dân: ' + staff.CCCD + '</li>');
            ul.append('<li class="list-group-item">Phòng Ban: ' + staff.dpName + '</li>');
            ul.append('<li class="list-group-item">Chức vụ: ' + staff.ofName + '</li>');
			
            // Hiển thị modal
            $('#myModal').css('display', 'block');
        });

        // Xử lý sự kiện khi nhấn vào nút đóng của modal
        $('.close').click(function() {
            $('#myModal').css('display', 'none');
        });

        // Đóng modal khi nhấp ra ngoài
        $(window).click(function(event) {
            if ($(event.target).is('#myModal')) {
                $('#myModal').css('display', 'none');
            }
        });
        
     

    });

    
	</script>
</body>

</html>
