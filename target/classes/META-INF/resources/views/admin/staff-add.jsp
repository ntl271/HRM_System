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
<link rel="shortcut icon"
	type="/WinterHold_HRM/views/resources/image/png"
	href="/WinterHold_HRM/views/resources//WinterHold_HRM/views/resources/images/favicon.png">
<!-- Daterange picker -->
<link
	href="/WinterHold_HRM/views/resources/vendor/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">
<!-- Clockpicker -->
<link
	href="/WinterHold_HRM/views/resources/vendor/clockpicker/css/bootstrap-clockpicker.min.css"
	rel="stylesheet">
<!-- asColorpicker -->
<link
	href="/WinterHold_HRM/views/resources/vendor/jquery-asColorPicker/css/asColorPicker.min.css"
	rel="stylesheet">
<!-- Material color picker -->
<!-- Pick date -->
<link rel="stylesheet"
	href="/WinterHold_HRM/views/resources/vendor/pickadate/themes/default.css">
<link rel="stylesheet"
	href="/WinterHold_HRM/views/resources/vendor/pickadate/themes/default.date.css">
<link href="../icon?family=Material+Icons" rel="stylesheet">

<link
	href="/WinterHold_HRM/views/resources/vendor/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css"
	rel="stylesheet">
<link
	href="/WinterHold_HRM/views/resources/vendor/jquery-nice-select/css/nice-select.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="/WinterHold_HRM/views/resources/vendor/nouislider/nouislider.min.css">
<!-- Style css -->
<link href="/WinterHold_HRM/views/resources/css/style.css"
	rel="stylesheet">
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
						<li class="breadcrumb-item"><a href="staff">Quản
								lý nhân viên</a></li>
						<li class="breadcrumb-item"><a href="javascript:void(0)">Thêm
								nhân viên</a></li>
					</ol>
				</div>
				<!-- row -->


				<div class="row">
					<div class="col-12">
						<div class="col-xl-12 col-lg-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Thêm nhân viên mới</h4>
								</div>
								<div class="card-body">
									<div class="basic-form">
										<form action="staff?action=insert"
											method="post" enctype="multipart/form-data">

											<div class="row">
												<div class="mb-3 col-md-6">
													<label class="form-label">Họ và tên</label> <input
														type="text" class="form-control" name="stName"
														placeholder="Họ và tên">
												</div>
												<div class="mb-3 col-md-6">
													<label class="form-label">Giới tính</label>
													<div class="form-check">
														<input class="form-check-input" type="radio" name="gender"
															value="true" checked> <label
															class="form-check-label"> Nam </label>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="radio" name="gender"
															value="false"> <label class="form-check-label">
															Nữ </label>
													</div>
												</div>
												<div class="col-xl-3 col-xxl-6 col-md-6 mb-3">
													<label class="form-label">Ngày sinh</label> <input
														type="text" class="form-control" name="dateOfBirth"
														placeholder="yyyy-MM-dd" id="mdate">
												</div>

												<div class="mb-3 col-md-9">
													<label class="form-label">Quê quán</label> <input
														type="text" class="form-control" name="address">
												</div>
												<div class="mb-3 col-md-6">
													<label class="form-label">Email</label> <input type="email"
														class="form-control" name="email" placeholder="Email">
												</div>
												<div class="mb-3 col-md-6">
													<label class="form-label">Số điện thoại</label> <input
														type="text" class="form-control" name="phoneNumber">
												</div>
											</div>

											<div class="row">
												<div class="mb-3 col-md-3">
													<label class="form-label">Phòng Ban</label> <select
														id="departmentId" name="departmentId"
														class="default-select form-control wide"
														onchange="loadOffices()">
															<option value="5">Assignment</option>
													</select>
												</div>
												<div class="mb-3 col-md-3">
													<label class="form-label">Chức vụ</label> <select
														id="officeId" name="officeId"
														class="default-select form-control wide">
														<option value="16">New Staff</option>
													</select>
												</div>
												<div class="mb-3 col-md-6">
													<label class="form-label">Căn cước công dân</label> <input
														type="text" class="form-control" name="CCCD">
												</div>
												<div class="input-group mb-4">
													<div class="form-file">
														<input type="file" class="form-file-input form-control"
															name="avatar">
													</div>
													<span class="input-group-text">Avatar</span>
												</div>
											</div>

											<button type="submit" class="btn btn-primary">Hoàn
												thành</button>
										</form>


									</div>
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

		<script>
		function loadOffices() {
			var departmentId = document.getElementById("departmentId").value;
			var url = "/WinterHold_HRM/staff?action=getOffices&departmentId="
					+ departmentId;

			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState === XMLHttpRequest.DONE) {
					if (xhr.status === 200) {
						var offices = JSON.parse(xhr.responseText);
						var officeDropdown = document
								.getElementById("officeId");
						officeDropdown.innerHTML = ""; // Clear previous options
						offices.forEach(function(office) {
							var option = document.createElement("option");
							option.value = office.ID_of;
							option.textContent = office.ofName;
							officeDropdown.appendChild(option);
						});
					} else {
						console.error("Error fetching offices: " + xhr.status);
					}
				}
			};

			xhr.open("GET", url, true);
			xhr.send();
		}
	</script>

	<!--**********************************
        Scripts
    ***********************************-->
	<!-- Required vendors -->
	<script
		src="/WinterHold_HRM/views/resources/vendor/global/global.min.js"></script>
	<script
		src="/WinterHold_HRM/views/resources/vendor/chart.js/Chart.bundle.min.js"></script>
	<script
		src="/WinterHold_HRM/views/resources/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
	<!-- Apex Chart -->
	<script
		src="/WinterHold_HRM/views/resources/vendor/apexchart/apexchart.js"></script>

	<!-- Datatable -->
	<script
		src="/WinterHold_HRM/views/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="/WinterHold_HRM/views/resources/js/plugins-init/datatables.init.js"></script>

	<script
		src="/WinterHold_HRM/views/resources/vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>


	<!-- Daterangepicker -->
	<!-- momment js is must -->
	<script
		src="/WinterHold_HRM/views/resources/vendor/moment/moment.min.js"></script>
	<script
		src="/WinterHold_HRM/views/resources/vendor/bootstrap-daterangepicker/daterangepicker.js"></script>

	<!-- asColorPicker -->
	<script
		src="/WinterHold_HRM/views/resources/vendor/jquery-asColor/jquery-asColor.min.js"></script>
	<script
		src="/WinterHold_HRM/views/resources/vendor/jquery-asGradient/jquery-asGradient.min.js"></script>
	<script
		src="/WinterHold_HRM/views/resources/vendor/jquery-asColorPicker/js/jquery-asColorPicker.min.js"></script>
	<!-- Material color picker -->
	<script
		src="/WinterHold_HRM/views/resources/vendor/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
	<!-- pickdate -->
	<script
		src="/WinterHold_HRM/views/resources/vendor/pickadate/picker.js"></script>
	<script
		src="/WinterHold_HRM/views/resources/vendor/pickadate/picker.time.js"></script>
	<script
		src="/WinterHold_HRM/views/resources/vendor/pickadate/picker.date.js"></script>




	<!-- Material color picker init -->
	<script
		src="/WinterHold_HRM/views/resources/js/plugins-init/material-date-picker-init.js"></script>
	<!-- Pickdate -->
	<script
		src="/WinterHold_HRM/views/resources/js/plugins-init/pickadate-init.js"></script>


	<script src="/WinterHold_HRM/views/resources/js/custom.min.js"></script>
	<script src="/WinterHold_HRM/views/resources/js/dlabnav-init.js"></script>
	<script src="/WinterHold_HRM/views/resources/js/demo.js"></script>
	<script src="/WinterHold_HRM/views/resources/js/styleSwitcher.js"></script>
</body>
</html>