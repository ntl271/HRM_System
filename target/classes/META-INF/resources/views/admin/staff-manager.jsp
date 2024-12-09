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
<link href="/WinterHold_HRM/views/resources/vendor/sweetalert2/dist/sweetalert2.min.css"
	rel="stylesheet">


<link rel="stylesheet"
	href="/WinterHold_HRM/views/resources/vendor/nouislider/nouislider.min.css">
<!-- Style css -->
<link href="/WinterHold_HRM/views/resources/css/style.css"
	rel="stylesheet">

<!-- Custom CSS for modal -->
<style>
.modal {
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
						<li class="breadcrumb-item"><a href="/WinterHold_HRM/admin/staff">Quản
								lý nhân viên</a></li>
					</ol>
				</div>
				<!-- row -->


				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Profile Datatable</h4>
								
								<a href="staff?action=new"
									class="btn btn-rounded btn-info"> <span
									class="btn-icon-start text-info"> <i
										class="fa fa-plus color-info"></i>
								</span> Thêm nhân viên mới
								</a>
							</div>

							<div class="card-body">
								<div class="table-responsive">
									<table id="example3" class="display" style="min-width: 845px;">
										<thead>
											<tr>
												<th></th>
												<th>Name</th>
												<th>Giới tính</th>
												<th>Ngày Sinh</th>
												<th>Email</th>
												<th>Phone</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach var="staff" items="${listStaff}"
												varStatus="status">
												<tr>
													<td class="sorting_1"><img class="rounded-circle" width="35" src="/WinterHold_HRM/${staff.image}" alt=""></td>
													
													<td>${staff.ID_staff} - ${staff.stName}</td>
													<td><c:choose>
															<c:when test="${staff.gender}">
																<span class="badge light badge-success">Male</span>
															</c:when>
															<c:otherwise>
																<span class="badge light badge-danger ">Female</span>
															</c:otherwise>
														</c:choose></td>
													<td>${staff.dateOfBirth}</td>
													<td>${staff.email}</td>
													<td>${staff.phoneNumber}</td>
													<td>
														<div class="d-flex">
															<a href="#"
																class="btn btn-success shadow btn-xs sharp me-2 showFormButton"
																data-id="${status.index}"> <i class="fa fa-eye"></i>
															</a> <a
																href="staff?action=edit&id=${staff.ID_staff}"
																class="btn btn-primary shadow btn-xs sharp me-1"><i
																class="fas fa-pencil-alt"></i></a> <a
																href="staff?action=delete&id=${staff.ID_staff}"
																class="btn btn-danger shadow btn-xs sharp "><i
																class="fa fa-trash "></i></a>
															
														</div>
													</td>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
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
	<div id="myModal" class="modal">
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



	<!-- Required vendors -->
	<script
		src="/WinterHold_HRM/views/resources/vendor/global/global.min.js"></script>
	<script
		src="/WinterHold_HRM/views/resources/vendor/chart.js/Chart.bundle.min.js"></script>
	<!-- Apex Chart -->
	<script
		src="/WinterHold_HRM/views/resources/vendor/apexchart/apexchart.js"></script>
	<script src="/WinterHold_HRM/views/resources/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
	<script src="/WinterHold_HRM/views/resources/js/plugins-init/sweetalert.init.js"></script>
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
	  // Định nghĩa biến JavaScript để lưu trữ danh sách nhân viên
    var listStaff = [
        <c:forEach var="staff" items="${listStaff}">
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
        
     // Sự kiện khi nhấn vào nút Sửa
        $(document).on('click', '.editButton', function(e) {
            e.preventDefault();

            // Lấy index từ data-id của nút Sửa
            var index = $(this).data('id');

            // Lấy thông tin nhân viên từ listStaff
            var staff = listStaff[index];

            // Đổ thông tin nhân viên lên form modal cập nhật
            $('#updateID').val(staff.ID_staff);
            $('#updateName').val(staff.stName);
            $('#updateGender').val(staff.gender ? 'true' : 'false');
            $('#updateDOB').val(staff.dateOfBirth);
            $('#updateEmail').val(staff.email);
            $('#updatePhone').val(staff.phoneNumber);
            $('#updateCCCD').val(staff.CCCD);
            $('#updateDP').val(staff.dpName);
            $('#updateOF').val(staff.ofName);

            // Hiển thị modal cập nhật
            $('#updateModal').css('display', 'block');
        });

        // Sự kiện khi nhấn vào nút đóng của modal cập nhật
        $(document).on('click', '.close', function() {
            $('#updateModal').css('display', 'none');
        });

        // Đóng modal cập nhật khi nhấp ra ngoài
        $(window).click(function(event) {
            if ($(event.target).is('#updateModal')) {
                $('#updateModal').css('display', 'none');
            }
        });

        // Xử lý sự kiện submit form cập nhật
        $('#updateForm').submit(function(e) {
            e.preventDefault();

            // Lấy thông tin từ form
            var updatedStaff = {
                ID_staff: $('#updateID').val(),
                stName: $('#updateName').val(),
                gender: $('#updateGender').val() === 'true',
                dateOfBirth: $('#updateDOB').val(),
                email: $('#updateEmail').val(),
                phoneNumber: $('#updatePhone').val(),
                CCCD: $('#updateCCCD').val(),
                dpName: $('#updateDP').val(),
                ofName: $('#updateOF').val()
            };

            // Gửi thông tin cập nhật đến server (ví dụ dùng AJAX)
            $.ajax({
                url: '/WinterHold_HRM/staff?action=update', // URL cập nhật
                method: 'POST',
                data: updatedStaff,
                success: function(response) {
                    // Xử lý thành công
                    alert('Cập nhật thành công!');
                    // Ẩn modal cập nhật
                    $('#updateModal').css('display', 'none');
                    // Có thể cập nhật lại danh sách nhân viên nếu cần thiết
                },
                error: function(error) {
                    // Xử lý lỗi
                    alert('Có lỗi xảy ra khi cập nhật!');
                }
            });
        });

    });

    
	</script>
</body>
</html>
