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
						<li class="breadcrumb-item"><a href="/WinterHold_HRM/admin/otbonus">Quản lý tăng ca</a></li>
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
									role="tab" aria-selected="false">Duyệt OT</a></li>
								<li class="nav-item"><a class="nav-link"
									href="javascript:void(0);" data-bs-toggle="tab"
									id="Completed-tab" data-bs-target="#timekeeping" role="tab"
									aria-selected="false">Danh sách OT</a></li>
							</ul>
						</div>
					</div>
					
				</div>

				<!-- Tab 1 -->
				<div class="row">
					<div class="col-lg-12 tab-content">
						<!-- Tab 1 -->
						<div class="tab-pane fade" id="timekeeping" role="tabpanel"
							aria-labelledby="transaction-tab">
							<div class="row">
								<div class="col-lg-12 ">
									<form action="timekeeping?action=addTk" method="post">

										<div class="card">
											<div class="card-header">
												<h4 class="card-title">Bordered Table</h4>
												<button type="submit" class="btn btn-primary">Lưu
													chấm công hôm nay</button>
											</div>
											<div class="card-body">
												<div class="table-responsive">
													<!--   Form danh sách nhân viên chấm công-->
													<table
														class="table text-center table-bordered verticle-middle table-responsive-sm">
														<thead>
															<tr>
																<th scope="col">#</th>
																<th scope="col">Nhân viên</th>
																<th scope="col">Date</th>
																<th scope="col">Time(Số giờ)</th>
																<th scope="col">Hệ số</th>
																<th scope="col">Mô tả</th>
															</tr>
														</thead>
														<tbody>

															<c:forEach var="otBonus" items="${otBonuses}">
																<c:choose>
																	<c:when test="${otBonus.type == true}">
																		<tr>
																			<td>${otBonus.ID_ot}</td>
																			<td>${otBonus.staff.stName}-
																				${otBonus.staff.ID_staff}</td>
																			<td><span class="badge light badge-secondary">${otBonus.otDay}</span></td>
																			<td>${otBonus.otTime}</td>
																			<td>x${otBonus.coefficient}</td>
																			<td>${otBonus.description}</td>

																		</tr>
																	</c:when>
																</c:choose>
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
										<h4 class="card-title">Bordered Table</h4>

									</div>
									<div class="card-body">
										<div class="table-responsive">
											<!-- Form danh sách nhân viên chấm công -->
											<table id="timekeepingTable"
												class="table text-center table-bordered verticle-middle table-responsive-sm">
												<thead>
													<tr>
														<th scope="col">#</th>
														<th scope="col">Nhân viên</th>
														<th scope="col">Date</th>
														<th scope="col">Time(Số giờ)</th>
														<th scope="col">Hệ số</th>
														<th scope="col">Mô tả</th>
														<th scope="col">Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="otBonus" items="${otBonuses}">
														<c:choose>
															<c:when test="${otBonus.type == false}">
																<form action="otbonus?action=edit"
																	method="post">
																	<tr>
																		<td>${otBonus.ID_ot}</td>
																		<td>${otBonus.staff.stName}-
																			${otBonus.staff.ID_staff}</td>
																		<td><span class="badge light badge-secondary">${otBonus.otDay}</span></td>
																		<td>${otBonus.otTime}</td>
																		<td><div class="row align-items-center ms-5">
																				<div class="col-auto">
																					<div class="form-check">
																						<input class="form-check-input" type="radio"
																							name="coef" value="1.5" checked=""> <label
																							class="form-check-label"> x1.5 </label>
																					</div>
																				</div>
																				<div class="col-auto">
																					<div class="form-check">
																						<input class="form-check-input" type="radio"
																							name="coef" value="2.0"> <label
																							class="form-check-label"> x2.0 </label>
																					</div>
																				</div>

																			</div></td>
																		<td>${otBonus.description}</td>
																		<td><input type="hidden" name="otDay"
																			value="${otBonus.otDay}"> <input
																			type="hidden" name="otTime" value="${otBonus.otTime}">
																			<input type="hidden" name="description"
																			value="${otBonus.description}"><input
																			type="hidden" name="staffId"
																			value="${otBonus.staff.ID_staff}"><input
																			type="hidden" name="ID_ot" value="${otBonus.ID_ot}">
																			<button type="submit" class="btn btn-primary">Duyệt
																				OT</button></td>

																	</tr>

																</form>
															</c:when>


														</c:choose>

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
		<jsp:include page="template/admin_footer.jsp" />
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
		
	</script>
</body>

</html>
