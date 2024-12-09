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
		<jsp:include page="template/user_nav-header.jsp" />
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Chat box start
        ***********************************-->


		<!--**********************************
            Header start
        ***********************************-->
		<jsp:include page="template/user_dlanav.jsp" />

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
						<li class="breadcrumb-item"><a
							href="/WinterHold_HRM/admin/salarytb">Quản lý cá nhân</a></li>
					</ol>
				</div>
				<!-- Form lựa chọn -->
				<div class="d-flex flex-wrap align-items-center mb-3">
					<div class="mb-3 me-auto">
						<div class="card-tabs style-1 mt-3 mt-sm-0">
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									href="javascript:void(0);" data-bs-toggle="tab"
									id="transaction-tab" data-bs-target="#viewTimekeeping"
									role="tab" aria-selected="false">Bảng lương </a></li>
								<li class="nav-item"><a class="nav-link"
									href="javascript:void(0);" data-bs-toggle="tab"
									id="Completed-tab" data-bs-target="#timekeeping" role="tab"
									aria-selected="false">Tăng ca</a></li>
								<li class="nav-item"><a class="nav-link"
									href="javascript:void(0);" data-bs-toggle="tab"
									id="Completed-tab" data-bs-target="#leaves" role="tab"
									aria-selected="false">Nghỉ phép</a></li>
							</ul>
						</div>
					</div>

				</div>

				<!-- Tab 1 -->
				<div class="row">
					<div class="col-lg-12 tab-content">
						<!-- Tab 3 -->
						<div class="tab-pane fade" id="leaves" role="tabpanel"
							aria-labelledby="transaction-tab">
							<div class="row">
								<div class="col-xl-4">
									<div class="col-xl-12">
										<div class="card">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Tạo phiếu nghỉ phép</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal"></button>
												</div>
												<div class="modal-body">
													<form class="comment-form"
														action="home-page?action=addLeave" method="post">
														<div class="row">
															<div class="col-lg-12">
																<div class="mb-3">

																	<label class="text-black font-w600 form-label">Ngày
																		xin nghỉ <span class="required">*</span>
																	</label>
																	<div class="col-auto">
																		<input type="text" class="form-control" name="dayOff"
																			placeholder="yyyy-MM-dd" id="mdate">
																	</div>
																</div>
															</div>
															<div class="col-lg-12">
																<div class="mb-3">
																	<label class="text-black font-w600 form-label">Content</label>
																	<textarea rows="8" class="form-control" name="content"
																		placeholder="description"></textarea>
																</div>
															</div>
															<div class="col-lg-12">
																<div class="mb-3 mb-0">
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
								<div class="col-lg-8 ">
									<form action="timekeeping?action=addTk" method="post">

										<div class="card">
											<div class="card-header">
												<h4 class="card-title">Lịch sử</h4>

											</div>
											<div class="card-body">
												<div class="table-responsive">
													<!--   Form danh sách nhân viên chấm công-->
													<table
														class="table text-center table-bordered verticle-middle table-responsive-sm">
														<thead>
															<tr>
																<th scope="col">Ngày xin nghỉ</th>
																<th scope="col">Lý do</th>

															</tr>
														</thead>
														<tbody>

															<c:forEach var="leaves" items="${leaves}">
																<tr>
																	<td>${leaves.dayOff}</td>
																	<td>${leaves.description}</td>

																</tr>

															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</form>
								</div>
								<!-- Bảng 2 -->

							</div>
						</div>
						<!-- Tab 1 -->
						<div class="tab-pane fade" id="timekeeping" role="tabpanel"
							aria-labelledby="transaction-tab">
							<div class="row">
								<div class="col-xl-4">
									<div class="col-xl-12">
										<div class="card">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Tạo phiếu tăng ca</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal"></button>
												</div>
												<div class="modal-body">
													<form class="comment-form"
														action="home-page?action=addOT" method="post">
														<div class="row">

															<div class="col-lg-12">
																<div class="mb-3">
																	<label class="text-black font-w600 form-label">Số
																		giờ tăng ca <span class="required">*</span>
																	</label> <input type="number" class="form-control" value=""
																		name="otTime" placeholder="Title">
																</div>
															</div>
															<div class="col-lg-12">
																<div class="mb-3">
																	<label class="text-black font-w600 form-label">Lý
																		do tăng ca</label>
																	<textarea rows="8" class="form-control"
																		name="description" placeholder="Content"></textarea>
																</div>
															</div>
															<div class="col-lg-12">
																<div class="mb-3 mb-0">
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
								<div class="col-lg-8 ">
									<form action="timekeeping?action=addTk" method="post">

										<div class="card">
											<div class="card-header">
												<h4 class="card-title">Lịch sử</h4>
											</div>
											<div class="card-body">
												<div class="table-responsive">
													<!--   Form danh sách nhân viên chấm công-->
													<table
														class="table text-center table-bordered verticle-middle table-responsive-sm">
														<thead>
															<tr>
																<th scope="col">Ngày tăng ca</th>
																<th scope="col">Thời gian</th>
																<th scope="col">Hệ số</th>
																<th scope="col">Lý do</th>
																<th scope="col">Trạng thái</th>

															</tr>
														</thead>
														<tbody>

															<c:forEach var="otBonus" items="${otBonus}">
																<tr>
																	<td>${otBonus.otDay}</td>
																	<td>${otBonus.otTime}</td>
																	<td>${otBonus.coefficient}</td>
																	<td>${otBonus.description}</td>
																	<c:choose>
																		<c:when test="${otBonus.type == false}">
																			<td><span class="badge badge-warning">Chưa
																					duyệt</span></td>
																		</c:when>
																		<c:when test="${otBonus.type == true}">
																			<td><span class="badge badge-primary">Đã
																					duyệt</span>
																			<td>
																		</c:when>
																	</c:choose>
																</tr>

															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</form>
								</div>
								<!-- Bảng 2 -->

							</div>
						</div>
						<!-- Tab 2 -->
						<div class="tab-pane fade active show" id="viewTimekeeping"
							role="tabpanel" aria-labelledby="transaction-tab">
							<div class="col-lg-12">
								<div class="card">

									<div class="card-header">
										<h4 class="card-title">Danh sách nhân viên đã nhận lương</h4>

									</div>
									<div class="card-body">
										<div class="table-responsive">
											<!-- Form danh sách nhân viên chấm công -->
											<table id="timekeepingTable"
												class="table text-center table-bordered verticle-middle table-responsive-sm">
												<thead>
													<tr>
														<th scope="col">#</th>
														<th scope="col">Thời gian</th>
														<th scope="col">Tăng ca</th>
														<th scope="col">Thumup</th>
														<th scope="col">Ticket</th>
														<th scope="col">Lương cơ bản</th>
														<th scope="col">Tổng lương</th>
														<th scope="col">Trạng thái</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="salary" items="${salaries}">
														<form action="otbonus?action=edit" method="post">
															<tr>
																<td>${salary.ID_salary}</td>
																<td><span class="badge badge-primary">Tháng
																		${salary.dateCreate.getMonth()+1}</span></td>
																<td>${salary.total_ticket}</td>
																<td>${salary.total_thumup}</td>
																<td>${salary.total_bonus}</td>
																<td>${salary.total_salaryTimekeeping}</td>
																<td>${salary.total_salary()}</td>
																<td><span class="badge badge-success">Done</span></td>
															</tr>
														</form>
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
			</div>
		</div>
		<!--**********************************
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
		<jsp:include page="template/user_footer.jsp" />
		<!--**********************************
            Footer end
        ***********************************-->

	</div>
	<!--**********************************
        Main wrapper end
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

	<!-- JavaScript để hiển thị form -->
	<script>
		
	</script>
</body>

</html>
