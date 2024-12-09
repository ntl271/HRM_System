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
						<li class="breadcrumb-item"><a href="/WinterHold_HRM/admin/card">Quản
								lý thưởng phạt</a></li>
					</ol>
				</div>

				<div class="row">

					<div class="col-xl-8">
						<div class="card">
							<div class="card-header d-sm-flex d-block border-0 pb-0">
								<div class="me-auto mb-sm-0 mb-4">
									<h4 class="fs-20 text-black">Card List</h4>
									<span class="fs-12">Lorem ipsum dolor sit amet,
										consectetur</span>
								</div>

							</div>
							<div class="card-body pb-0">



								<c:forEach items="${cards}" var="cards">
									<div
										class="d-flex mb-3 border-bottom justify-content-between align-items-center">


										<c:choose>
											<c:when test="${cards.type == true}">
												<div class="d-flex pb-3 align-items-center">
													<img
														src="/WinterHold_HRM/views/resources/images/card/3.jpg"
														alt="" class="rounded me-3 card-list-img" width="130">
													<div class="me-3">
														<p class="fs-14 mb-1">Card Type</p>
														<span class="text-black font-w500">Thumup</span>
													</div>
												</div>
											</c:when>
											<c:when test="${cards.type == false}">
												<div class="d-flex pb-3 align-items-center">
													<img
														src="/WinterHold_HRM/views/resources/images/card/4.jpg"
														alt="" class="rounded me-3 card-list-img" width="130">
													<div class="me-3">
														<p class="fs-14 mb-1">Card Type</p>
														<span class="text-black font-w500">Ticket</span>
													</div>
												</div>
											</c:when>

										</c:choose>
										<div class="me-3 pb-3">
											<p class="fs-14 mb-1">Nhân viên</p>
											<span class="text-black font-w500">${cards.staff.ID_staff}
												- ${cards.staff.stName}</span>
										</div>
										<div class="me-3 pb-3">
											<p class="fs-14 mb-1">Số tiền</p>
											<span class="text-black font-w500">${cards.money_aos}đ</span>
										</div>
										<div class="me-3 pb-3">
											<p class="fs-14 mb-1">Ngày gửi</p>
											<span class="text-black font-w500">${cards.extraDay}</span>
										</div>
										<div class="me-3 pb-3 text-center">
											<p class="fs-14 mb-1" style="width: 200px;">Mô tả</p>
											<span class="text-black font-w500">${cards.description}</span>
										</div>

									</div>
								</c:forEach>

							</div>
						</div>
					</div>

					<div class="col-xl-4">
						<div class="col-xl-12">
							<div class="card text-white bg-success">
								<div class="card-header">
									<h5 class="card-title text-white">Thumup Card</h5>
								</div>
								<div class="card-body mb-0">
									<p class="card-text">Thumup là thẻ thưởng: Đại diện cho
										việc nhân viên nhận được khen thưởng hoặc điểm thưởng cho việc
										hoàn thành tốt nhiệm vụ hoặc đạt được mục tiêu nào đó.</p>
									<a href="javascript:void(0);"
										class="btn bg-white text-success light btn-card"
										data-bs-toggle="modal" data-bs-target="#addNewCard">New
										card</a>
								</div>

							</div>
						</div>

						<div class="col-xl-12">
							<div class="card text-white bg-warning">
								<div class="card-header">
									<h5 class="card-title text-white">Ticket Card</h5>
								</div>
								<div class="card-body mb-0">
									<p class="card-text">Ticket là thẻ phạt: Đại diện cho việc
										nhân viên nhận một hình phạt hoặc bị trừ điểm do vi phạm quy
										định hoặc không hoàn thành nhiệm vụ.</p>
									<a href="javascript:void(0);"
										class="btn bg-white text-success light btn-card"
										data-bs-toggle="modal" data-bs-target="#addNewCard">New
										card</a>
								</div>

							</div>
						</div>
					</div>
				</div>

				<!-- Modle thêm thẻ -->
				<div class="modal fade" id="addNewCard">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">New Card</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
							</div>
							<div class="modal-body">
								<form class="comment-form"
									action="card?action=addCard" method="post">
									<div class="row">
										<div class="col-lg-12">
											<div class="mb-3">
												<label class="text-black font-w600 form-label">Card
													Type<span class="required">*</span>
												</label> <select id="type" name="type"
													class=" form-control wide mb-3">
													<option value="true">Thumup</option>
													<option value="false">Ticket</option>


												</select>
											</div>
										</div>
										<div class="col-lg-12">
											<div class="mb-3">
												<label class="text-black font-w600 form-label">Nhân
													viên<span class="required">*</span>
												</label> <select id="staffId" name="staffId"
													class=" form-control wide mb-3">
													<c:forEach items="${staffs}" var="staff1">
														<option value="${staff1.ID_staff}">${staff1.stName}
															- ${staff1.ID_staff}</option>
													</c:forEach>

												</select>
											</div>
										</div>
										<div class="col-lg-12">
											<div class="mb-3">
												<label class="text-black font-w600 form-label">Số
													tiền<span class="required">*</span>
												</label> <select id="money" name="money"
													class=" form-control wide mb-3">
													<option value="20000">20.000đ</option>
													<option value="50000">50000</option>
													<option value="100000">100.000đ</option>
													<option value="150000">150.000đ</option>
													<option value="200000">200.000đ</option>
													<option value="300000">300.000đ</option>
													<option value="500000">500.000đ</option>
												</select>
											</div>
										</div>
										<div class="col-lg-12">
											<div class="mb-3">
												<label class="text-black font-w600 form-label">Mô tả<span
													class="required">*</span>
												</label> <input type="text" class="form-control" name="description"
													id="description" />
											</div>
										</div>
										<div class="col-lg-12">
											<div class="mb-1 mb-0 text-center">
												<input class="btn btn-primary" type="submit" value="Submit">
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



	<script>
		function filterTableByDate() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("filterDate");
			filter = input.value;
			table = document.getElementById("timekeepingTable");
			tr = table.getElementsByTagName("tr");

			for (i = 1; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[2];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.includes(filter)) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>
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
