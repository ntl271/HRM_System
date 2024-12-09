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
						<li class="breadcrumb-item"><a
							href="/WinterHold_HRM/admin/notification">Quản lý thông báo</a></li>

					</ol>
				</div>
				<!-- row -->


				<div class="row">
					<div class="col-xl-4">
						<div class="col-xl-12">
							<div class="card">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Tạo thông báo mới</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal"></button>
									</div>
									<div class="modal-body">
										<form class="comment-form"
											action="notification?action=add"
											method="post">
											<div class="row">
												<div class="col-lg-12">
													<div class="mb-3">

														<label class="text-black font-w600 form-label">Title
															<span class="required">*</span>
														</label> <select id="staffId" name="staffId"
															class="default-select form-control wide">
															<c:forEach var="staff" items="${staffs}">
																<option value="${staff.ID_staff}">
																	${staff.ID_staff} - ${staff.stName}</option>
															</c:forEach>
														</select>
													</div>
												</div>

												<div class="col-lg-12">
													<div class="mb-3">
														<label class="text-black font-w600 form-label">Title
															<span class="required">*</span>
														</label> <input type="text" class="form-control" value=""
															name="title" placeholder="Title">
													</div>
												</div>

												<div class="col-lg-12">
													<div class="mb-3">
														<label class="text-black font-w600 form-label">Content</label>
														<textarea rows="8" class="form-control" name="content"
															placeholder="Content"></textarea>
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

					<div class="col-xl-8">
						<div class="col-xl-12 ">
							<div class="card border-0 pb-0">
								<div class="card-header border-0 pb-0">
									<h4 class="card-title">Message</h4>
								</div>
								<div class="card-body">
									<div id="dlab_W_Todo3"
										class="widget-media dlab-scroll height700 ps ">
										<ul class="timeline">
											<li>
												<div class="timeline-panel">
													<div class="media me-2">
														<img alt="image" width="50"
															src="/WinterHold_HRM/views/resources/images/avatar/1.jpg">
													</div>
													<div class="media-body">
														<h5 class="mb-1">
															Alfie Mason <small class="text-muted">29 July
																2020</small>
														</h5>
														<p class="mb-1">I shared this on my fb wall a few
															months back..</p>
														<a href="#" class="btn btn-primary btn-xxs shadow">Reply</a>
														<a href="#" class="btn btn-outline-danger btn-xxs">Delete</a>
													</div>
													<div class="dropdown">
														<button type="button" class="btn btn-primary light sharp"
															data-bs-toggle="dropdown" aria-expanded="false">
															<svg width="18px" height="18px" viewBox="0 0 24 24"
																version="1.1">
																<g stroke="none" stroke-width="1" fill="none"
																	fill-rule="evenodd">
																<rect x="0" y="0" width="24" height="24"></rect>
																<circle fill="#000000" cx="5" cy="12" r="2"></circle>
																<circle fill="#000000" cx="12" cy="12" r="2"></circle>
																<circle fill="#000000" cx="19" cy="12" r="2"></circle></g></svg>
														</button>
														<div class="dropdown-menu dropdown-menu-end" style="">
															<a class="dropdown-item" href="#">Edit</a> <a
																class="dropdown-item" href="#">Delete</a>
														</div>
													</div>
												</div>
											</li>

											<li>
												<div class="timeline-panel">
													<div class="media me-2 media-success">
														<img alt="image" width="50"
															src="/WinterHold_HRM/views/resources/images/avatar/2.jpg">
													</div>
													<div class="media-body">
														<h5 class="mb-1">
															Jack Ronan <small class="text-muted">29 July 2020</small>
														</h5>
														<p class="mb-1">I shared this on my fb wall a few
															months back..</p>
														<a href="#" class="btn btn-primary btn-xxs shadow">Reply</a>
														<a href="#" class="btn btn-outline-danger btn-xxs">Delete</a>
													</div>
													<div class="dropdown">
														<button type="button" class="btn btn-success light sharp"
															data-bs-toggle="dropdown">
															<svg width="18px" height="18px" viewBox="0 0 24 24"
																version="1.1">
																<g stroke="none" stroke-width="1" fill="none"
																	fill-rule="evenodd">
																<rect x="0" y="0" width="24" height="24"></rect>
																<circle fill="#000000" cx="5" cy="12" r="2"></circle>
																<circle fill="#000000" cx="12" cy="12" r="2"></circle>
																<circle fill="#000000" cx="19" cy="12" r="2"></circle></g></svg>
														</button>
														<div class="dropdown-menu dropdown-menu-end">
															<a class="dropdown-item" href="#">Edit</a> <a
																class="dropdown-item" href="#">Delete</a>
														</div>
													</div>
												</div>
											</li>
											<li>
												<div class="timeline-panel">
													<div class="media me-2">
														<img alt="image" width="50"
															src="/WinterHold_HRM/views/resources/images/avatar/1.jpg">
													</div>
													<div class="media-body">
														<h5 class="mb-1">
															Noah Baldon <small class="text-muted">29 July
																2020</small>
														</h5>
														<p class="mb-1">I shared this on my fb wall a few
															months back..</p>
														<a href="#" class="btn btn-primary btn-xxs shadow">Reply</a>
														<a href="#" class="btn btn-outline-danger btn-xxs">Delete</a>
													</div>
													<div class="dropdown">
														<button type="button" class="btn btn-primary light sharp"
															data-bs-toggle="dropdown">
															<svg width="18px" height="18px" viewBox="0 0 24 24"
																version="1.1">
																<g stroke="none" stroke-width="1" fill="none"
																	fill-rule="evenodd">
																<rect x="0" y="0" width="24" height="24"></rect>
																<circle fill="#000000" cx="5" cy="12" r="2"></circle>
																<circle fill="#000000" cx="12" cy="12" r="2"></circle>
																<circle fill="#000000" cx="19" cy="12" r="2"></circle></g></svg>
														</button>
														<div class="dropdown-menu dropdown-menu-end">
															<a class="dropdown-item" href="#">Edit</a> <a
																class="dropdown-item" href="#">Delete</a>
														</div>
													</div>
												</div>
											</li>

											<li>
												<div class="timeline-panel">
													<div class="media me-2 media-primary">
														<img alt="image" width="50"
															src="/WinterHold_HRM/views/resources/images/avatar/3.jpg">
													</div>
													<div class="media-body">
														<h5 class="mb-1">
															Oscar Weston <small class="text-muted">29 July
																2020</small>
														</h5>
														<p class="mb-1">I shared this on my fb wall a few
															months back..</p>
														<a href="#" class="btn btn-primary btn-xxs shadow">Reply</a>
														<a href="#" class="btn btn-outline-danger btn-xxs">Delete</a>
													</div>
													<div class="dropdown">
														<button type="button" class="btn btn-primary light sharp"
															data-bs-toggle="dropdown">
															<svg width="18px" height="18px" viewBox="0 0 24 24"
																version="1.1">
																<g stroke="none" stroke-width="1" fill="none"
																	fill-rule="evenodd">
																<rect x="0" y="0" width="24" height="24"></rect>
																<circle fill="#000000" cx="5" cy="12" r="2"></circle>
																<circle fill="#000000" cx="12" cy="12" r="2"></circle>
																<circle fill="#000000" cx="19" cy="12" r="2"></circle></g></svg>
														</button>
														<div class="dropdown-menu dropdown-menu-end">
															<a class="dropdown-item" href="#">Edit</a> <a
																class="dropdown-item" href="#">Delete</a>
														</div>
													</div>
												</div>
											</li>
											<!-- Thông báo -->
											<c:forEach var="notification" items="${notifications}">
												<li>
													<div class="timeline-panel">
														<div class="media me-2 media-primary">
															<img alt="image" width="50"
																src="/WinterHold_HRM/views/resources/images/avatar/1.jpg">
														</div>
														<div class="media-body">

															<h5 class="mb-3 text-primary">
																${notification.staff.stName} <small class="text-muted">${notification.date}
																</small>
															</h5>
															<h5 class="mb-2">${notification.title}</h5>
															<p class="mb-2">${notification.content}</p>
															<a href="#" class="btn btn-primary btn-xxs shadow">Reply</a>
															<a href="#" class="btn btn-outline-danger btn-xxs">Delete</a>
														</div>
														<div class="dropdown">
															<button type="button" class="btn btn-primary light sharp"
																data-bs-toggle="dropdown">
																<svg width="18px" height="18px" viewBox="0 0 24 24"
																	version="1.1">
																<g stroke="none" stroke-width="1" fill="none"
																		fill-rule="evenodd">
																<rect x="0" y="0" width="24" height="24"></rect>
																<circle fill="#000000" cx="5" cy="12" r="2"></circle>
																<circle fill="#000000" cx="12" cy="12" r="2"></circle>
																<circle fill="#000000" cx="19" cy="12" r="2"></circle></g></svg>
															</button>
															<div class="dropdown-menu dropdown-menu-end">
																<a class="dropdown-item" href="#">Edit</a> <a
																	class="dropdown-item" href="#">Delete</a>
															</div>
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
										<div class="ps__rail-x" style="left: 0px; bottom: -370px;">
											<div class="ps__thumb-x" tabindex="0"
												style="left: 0px; width: 0px;"></div>
										</div>
										<div class="ps__rail-y"
											style="top: 370px; height: 370px; right: 0px;">
											<div class="ps__thumb-y" tabindex="0"
												style="top: 185px; height: 185px;"></div>
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