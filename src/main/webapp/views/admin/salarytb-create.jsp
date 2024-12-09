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
						<li class="breadcrumb-item"><a href="/WinterHold_HRM/admin/staff">Quản
								lý lương nhân viên</a></li>
						<li class="breadcrumb-item"><a href="javascript:void(0)">Tạo
								phiếu lương</a></li>
					</ol>
				</div>
				<!-- row -->


				<div class="row">
					<div class="col-xl-8">
						<div class="card">
							<form action="salarytb?action=add" method="post">
								<div class="card-header">
									<h4 class="card-title">Phiếu lương của nhân viên</h4>
								</div>
								<div class="card-body">
									<div class="basic-list-group">
										<ul class="list-group justify-content-between">
											
											<li
												class="list-group-item active d-flex justify-content-between"><span
												class="mb-0"></span> <c:out
													value="${staff.stName} - ${staff.ID_staff }"></c:out><strong></strong></li>
											<li class="list-group-item d-flex justify-content-between"><span
												class="mb-0">Tiền Thumup:</span><strong><c:out
														value="+${thumup}đ "></c:out></strong></li>
											<li class="list-group-item d-flex justify-content-between"><span
												class="mb-0">Tiền Ticket:</span><strong><c:out
														value="-${ticket}đ "></c:out></strong></li>
											<li class="list-group-item d-flex justify-content-between"><span
												class="mb-0">Tiền tăng ca:</span><strong><c:out
														value="+${otbonus}đ "></c:out></strong></li>
											<li class="list-group-item d-flex justify-content-between"><span
												class="mb-0">Tiền lương cơ bản:</span><strong><c:out
														value="+${salaryTk}đ "></c:out></strong></li>
											<li class="list-group-item d-flex justify-content-between"><span
												class="mb-0">Tổng lương:</span><strong><c:out
														value="= ${total}đ "></c:out></strong></li>
										</ul>
										<button type="submit" class="btn btn-primary mt-2 justify-content-between">Tạo
											phiếu lương</button>
									</div>
								</div>
								<input type="hidden" class="id"
									value="<c:out value="${staff.ID_staff }" />" name="id">
								<input type="hidden" class="thumup"
									value="<c:out value="${thumup}" />" name="thumup"> <input
									type="hidden" class="ticket"
									value="<c:out value="${ticket}" />" name="ticket"> <input
									type="hidden" class="otbonus"
									value="<c:out value="${otbonus}" />" name="otbonus"> <input
									type="hidden" class="salaryTk"
									value="<c:out value="${salaryTk}" />" name="salaryTk">

							</form>
						</div>
					</div>

					<div class="col-xl-4 col-lg-6 col-xxl-4 col-sm-6">
						<div class="card text-white bg-primary">
							<ul class="list-group list-group-flush">
								<li class="list-group-item d-flex justify-content-between"><span
									class="mb-0">Tiền Thumup:</span><strong>Tổng tiền thumup trong tháng</strong></li>
								<li class="list-group-item d-flex justify-content-between"><span
									class="mb-0">Tiền Ticket:</span><strong>Tổng tiền ticket trong tháng</strong></li>
								<li class="list-group-item d-flex justify-content-between"><span
									class="mb-0">Tiền tăng ca:</span><strong>(LVT/8) * Time * Hệ số OT</strong></li>
								<li class="list-group-item d-flex justify-content-between"><span
									class="mb-0">Tiền lương cơ bản:</span><strong>Số ngày công * LVT</strong></li>
								<li class="list-group-item d-flex justify-content-between"><span
									class="mb-0">Tổng lương:</span><strong>Thumup + OT + LCB - Ticket</strong></li>
							</ul>
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