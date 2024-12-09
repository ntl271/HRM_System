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

<!-- FAVICONS ICON -->
<link rel="shortcut icon"
	type="/WinterHold_HRM/views/resources/image/png"
	href="/WinterHold_HRM/views/resources/images/favicon.png">

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
            Nội dung trang
        trang******************************-->
		<div class="content-body">
			<!-- row -->
			<div class="container-fluid">


				<div class="row page-titles">
					<ol class="breadcrumb">
						<li class="breadcrumb-item active"><a
							href="javascript:void(0)">App</a></li>
						<li class="breadcrumb-item"><a href="javascript:void(0)">Profile</a></li>
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
										<img
											src="/WinterHold_HRM/<c:out value="${staff.image }"></c:out>"
											class="img-fluid rounded-circle" alt="">
									</div>
									<div class="profile-details">
										<div class="profile-name px-3 pt-2">
											<h4 class="text-primary mb-0">
												<c:out value="${staff.stName }"></c:out>
											</h4>
											<p>
												<c:out value="${staff.office.ofName }"></c:out>
											</p>
										</div>
										<div class="profile-email px-2 pt-2">
											<h4 class="text-muted mb-0">
												<c:out value="${staff.email }"></c:out>
											</h4>
											<p>Email</p>
										</div>
										<div class="dropdown ms-auto">
											<a href="#" class="btn btn-primary light sharp"
												data-bs-toggle="dropdown" aria-expanded="true"><svg
													xmlns="http://www.w3.org/2000/svg"
													xmlns:xlink="http://www.w3.org/1999/xlink" width="18px"
													height="18px" viewBox="0 0 24 24" version="1.1">
													<g stroke="none" stroke-width="1" fill="none"
														fill-rule="evenodd">
													<rect x="0" y="0" width="24" height="24"></rect>
													<circle fill="#000000" cx="5" cy="12" r="2"></circle>
													<circle fill="#000000" cx="12" cy="12" r="2"></circle>
													<circle fill="#000000" cx="19" cy="12" r="2"></circle></g></svg></a>
											<ul class="dropdown-menu dropdown-menu-end">

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
										<div class="profile-statistics">
											<div class="text-center">
												<div class="row">
													<div class="col">
														<h3 class="m-b-0">
															<c:out value="${countTicket}"></c:out>
														</h3>
														<span>Ticket</span>
													</div>
													<div class="col">
														<h3 class="m-b-0">
															<c:out value="${staff.office.salary }đ"></c:out>
														</h3>
														<span>Salary</span>
													</div>
													<div class="col">
														<h3 class="m-b-0">
															<c:out value="${countThumup}"></c:out>
														</h3>
														<span>Thumup</span>
													</div>
												</div>
												<div class="mt-4">
													<a href="javascript:void(0);" class="btn btn-primary mb-1"
														data-bs-toggle="modal" data-bs-target="#QsendMessageModal">Xin
														nghỉ phép</a> <a href="javascript:void(0);"
														class="btn btn-primary mb-1" data-bs-toggle="modal"
														data-bs-target="#sendMessageModal">Cập nhật OT</a>
												</div>
											</div>
											<!-- Modal -->
											<div class="modal fade" id="sendMessageModal">
												<div class="modal-dialog modal-dialog-centered"
													role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title">Send Message</h5>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal"></button>
														</div>
														<div class="modal-body">
															<form class="comment-form">
																<div class="row">
																	<div class="col-lg-6">
																		<div class="mb-3">
																			<label class="text-black font-w600 form-label">Name
																				<span class="required">*</span>
																			</label> <input type="text" class="form-control"
																				value="Author" name="Author" placeholder="Author">
																		</div>
																	</div>
																	<div class="col-lg-6">
																		<div class="mb-3">
																			<label class="text-black font-w600 form-label">Email
																				<span class="required">*</span>
																			</label> <input type="text" class="form-control"
																				value="Email" placeholder="Email" name="Email">
																		</div>
																	</div>
																	<div class="col-lg-12">
																		<div class="mb-3">
																			<label class="text-black font-w600 form-label">Comment</label>
																			<textarea rows="8" class="form-control"
																				name="comment" placeholder="Comment"></textarea>
																		</div>
																	</div>
																	<div class="col-lg-12">
																		<div class="mb-3 mb-0">
																			<input type="submit" value="Post Comment"
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



						</div>
					</div>
					<div class="col-xl-8">
						<div class="card">
							<div class="card-body">
								<div class="profile-tab">
									<div class="custom-tab-1">
										<ul class="nav nav-tabs">

											<li class="nav-item"><a href="#about-me"
												data-bs-toggle="tab" class="nav-link active">About Me</a></li>
											<li class="nav-item"><a href="#profile-settings"
												data-bs-toggle="tab" class="nav-link">Setting</a></li>
										</ul>
										<div class="tab-content">

											<div id="about-me" class="tab-pane fade active show">
												<div class="profile-about-me">
													<div class="pt-4 border-bottom-1 pb-3">
														<h4 class="text-primary">About Me</h4>
														<p class="mb-2">
															Tôi tên là
															<c:out value="${staff.stName }"></c:out>
															, hiện đang làm việc tại phòng
															<c:out value="${staff.department.dpName }"></c:out>
															của công ty Winterhold. Với kinh nghiệm hơn 5 năm trong
															lĩnh vực Công nghệ thông tin, tôi đã tham gia và đóng góp
															tích cực vào nhiều dự án lớn nhỏ của công ty. Tôi luôn nỗ
															lực học hỏi, nâng cao kỹ năng chuyên môn và kỹ năng mềm
															để có thể hỗ trợ tốt nhất cho các đồng nghiệp trong công
															ty. Bên cạnh công việc, tôi rất thích tham gia các hoạt
															động thể thao và giao lưu văn hóa, giúp tôi cân bằng cuộc
															sống và công việc một cách hiệu quả. Rất mong nhận được
															sự hợp tác và hỗ trợ từ tất cả mọi người.
														</p>
														<p>Trân trọng, <c:out value="${staff.stName }"></c:out></p>
													</div>
												</div>
												<div class="profile-skills mb-5">
													<h4 class="text-primary mb-2">Skills</h4>
													<a href="javascript:void(0);"
														class="btn btn-primary light btn-xs mb-1">Java Core</a> <a
														href="javascript:void(0);"
														class="btn btn-primary light btn-xs mb-1">JSP/Servlet</a>
													<a href="javascript:void(0);"
														class="btn btn-primary light btn-xs mb-1">Spring Boot</a>
													<a href="javascript:void(0);"
														class="btn btn-primary light btn-xs mb-1">Bootstrap</a> <a
														href="javascript:void(0);"
														class="btn btn-primary light btn-xs mb-1">JavaScript</a> <a
														href="javascript:void(0);"
														class="btn btn-primary light btn-xs mb-1">HTML/CSS</a>
												</div>
												<div class="profile-lang  mb-5">
													<h4 class="text-primary mb-2">Language</h4>
													<a href="javascript:void(0);"
														class="text-muted pe-3 f-s-16"><i
														class="flag-icon flag-icon-us"></i> English</a> <a
														href="javascript:void(0);" class="text-muted pe-3 f-s-16"><i
														class="flag-icon flag-icon-fr"></i> Vietnamese</a> <a
														href="javascript:void(0);" class="text-muted pe-3 f-s-16"><i
														class="flag-icon flag-icon-bd"></i> Nauy</a>
												</div>
												<div class="profile-personal-info">
													<h4 class="text-primary mb-4">Personal Information</h4>
													<div class="row mb-2">
														<div class="col-sm-3 col-5">
															<h5 class="f-w-500">
																Mã nhân viên <span class="pull-end">:</span>
															</h5>
														</div>
														<div class="col-sm-9 col-7">
															<span><c:out value="${staff.ID_staff}"></c:out></span>
														</div>
													</div>
													<div class="row mb-2">
														<div class="col-sm-3 col-5">
															<h5 class="f-w-500">
																Name <span class="pull-end">:</span>
															</h5>
														</div>
														<div class="col-sm-9 col-7">
															<span><c:out value="${staff.stName }"></c:out></span>
														</div>
													</div>
													<div class="row mb-2">
														<div class="col-sm-3 col-5">
															<h5 class="f-w-500">
																Email <span class="pull-end">:</span>
															</h5>
														</div>
														<div class="col-sm-9 col-7">
															<span><c:out value="${staff.email }"></c:out></span>
														</div>
													</div>
													<div class="row mb-2">
														<div class="col-sm-3 col-5">
															<h5 class="f-w-500">
																Gender <span class="pull-end">:</span>
															</h5>
														</div>
														<div class="col-sm-9 col-7">
															<c:choose>
																<c:when test="${staff.gender == true }">
																	<span>Male</span>
																</c:when>
																<c:when test="${staff.gender == false }">
																	<span>Female</span>
																</c:when>
															</c:choose>
														</div>
													</div>
													<div class="row mb-2">
														<div class="col-sm-3 col-5">
															<h5 class="f-w-500">
																Date Of Birth <span class="pull-end">:</span>
															</h5>
														</div>
														<div class="col-sm-9 col-7">
															<span><c:out value="${staff.dateOfBirth }"></c:out></span>
														</div>
													</div>
													<div class="row mb-2">
														<div class="col-sm-3 col-5">
															<h5 class="f-w-500">
																Phone Number <span class="pull-end">:</span>
															</h5>
														</div>
														<div class="col-sm-9 col-7">
															<span><c:out value="${staff.phoneNumber }"></c:out></span>
														</div>
													</div>
													<div class="row mb-2">
														<div class="col-sm-3 col-5">
															<h5 class="f-w-500">
																Address <span class="pull-end">:</span>
															</h5>
														</div>
														<div class="col-sm-9 col-7">
															<span><c:out value="${staff.address }"></c:out></span>
														</div>
													</div>
													<div class="row mb-2">
														<div class="col-sm-3 col-5">
															<h5 class="f-w-500">
																CCCD <span class="pull-end">:</span>
															</h5>
														</div>
														<div class="col-sm-9 col-7">
															<span><c:out value="${staff.CCCD }"></c:out></span>
														</div>
													</div>
													<div class="row mb-2">
														<div class="col-sm-3 col-5">
															<h5 class="f-w-500">
																Department <span class="pull-end">:</span>
															</h5>
														</div>
														<div class="col-sm-9 col-7">
															<span><c:out value="${staff.department.dpName }"></c:out></span>
														</div>
													</div>
													<div class="row mb-2">
														<div class="col-sm-3 col-5">
															<h5 class="f-w-500">
																Office <span class="pull-end">:</span>
															</h5>
														</div>
														<div class="col-sm-9 col-7">
															<span><c:out value="${staff.office.ofName }"></c:out></span>
														</div>
													</div>
												</div>
											</div>
											<div id="profile-settings" class="tab-pane fade">
												<div class="pt-3">
													<div class="settings-form">
														<h4 class="text-primary">Account Setting</h4>
														<form
															action="home-page?action=update&id=${staff.ID_staff }"
															method="post">

															<div class="row">
																<div class="mb-3 col-md-6">
																	<label class="form-label">Họ và tên</label> <input
																		type="text" class="form-control" name="stName"
																		placeholder="Họ và tên" value="${staff.stName}">
																</div>
																<div class="mb-3 col-md-6">
																	<label class="form-label">Giới tính</label>
																	<div class="form-check">
																		<input class="form-check-input" type="radio"
																			name="gender" value="1"
																			<c:if test="${staff.gender}">checked</c:if>>
																		<label class="form-check-label">Nam</label>
																	</div>
																	<div class="form-check">
																		<input class="form-check-input" type="radio"
																			name="gender" value="0"
																			<c:if test="${!staff.gender}">checked</c:if>>
																		<label class="form-check-label">Nữ</label>
																	</div>
																</div>
																<div class="col-xl-3 col-xxl-6 col-md-6 mb-3">
																	<label class="form-label">Ngày sinh</label> <input
																		type="text" class="form-control" name="dateOfBirth"
																		placeholder="yyyy-MM-dd" id="mdate"
																		value="${staff.dateOfBirth}">
																</div>

																<div class="mb-3 col-md-9">
																	<label class="form-label">Quê quán</label> <input
																		type="text" class="form-control" name="address"
																		value="${staff.address}">
																</div>
																<div class="mb-3 col-md-6">
																	<label class="form-label">Email</label> <input
																		type="email" class="form-control" name="email"
																		placeholder="Email" value="${staff.email}">
																</div>
																<div class="mb-3 col-md-6">
																	<label class="form-label">Số điện thoại</label> <input
																		type="text" class="form-control" name="phoneNumber"
																		value="${staff.phoneNumber}">
																</div>
															</div>

															<div class="row">
																<div class="mb-3 col-md-3">
																	<label class="form-label">Phòng Ban</label> <select
																		id="departmentId" name="departmentId"
																		class="default-select form-control wide">
																		<option value="${staff.department.ID_dp }">${staff.department.dpName }</option>
																	</select>
																</div>
																<div class="mb-3 col-md-3">
																	<label class="form-label">Chức vụ</label> <select
																		id="officeId" name="officeId"
																		class="default-select form-control wide">

																		<option value="${staff.office.ID_of }">${staff.office.ofName }</option>

																	</select>
																</div>
																<div class="mb-3 col-md-6 ">
																	<label class="form-label">Căn cước công dân</label> <input
																		type="text" class="form-control" name="CCCD"
																		value="${staff.CCCD}">
																</div>
																<div class="mb-3 col-md-6">
																	<label class="form-label">Avatar</label> <input
																		type="text" class="form-control disable" name="image"
																		value="${staff.image}">
																</div>
															</div>

															<button type="submit" class="btn btn-primary">Cập
																nhật</button>
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- Modal -->
									<div class="modal fade" id="replyModal">
										<div class="modal-dialog modal-dialog-centered"
											role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title">Post Reply</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal"></button>
												</div>
												<div class="modal-body">
													<form>
														<textarea class="form-control" rows="4">Message</textarea>
													</form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-danger light"
														data-bs-dismiss="modal">btn-close</button>
													<button type="button" class="btn btn-primary">Reply</button>
												</div>
											</div>
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

	<!--**********************************
        Scripts
    ***********************************-->
	<!-- Required vendors -->
	<script
		src="/WinterHold_HRM/views/resources/vendor/global/global.min.js"></script>
	<script
		src="/WinterHold_HRM/views/resources/vendor/chart.js/Chart.bundle.min.js"></script>
	<script
		src="/WinterHold_HRM/views/resources/vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>

	<!-- Apex Chart -->
	<script
		src="/WinterHold_HRM/views/resources/vendor/apexchart/apexchart.js"></script>
	<script
		src="/WinterHold_HRM/views/resources/vendor/nouislider/nouislider.min.js"></script>
	<script src="/WinterHold_HRM/views/resources/vendor/wnumb/wNumb.js"></script>

	<!-- Dashboard 1 -->
	<script
		src="/WinterHold_HRM/views/resources/js/dashboard/dashboard-1.js"></script>

	<script src="/WinterHold_HRM/views/resources/js/custom.min.js"></script>
	<script src="/WinterHold_HRM/views/resources/js/dlabnav-init.js"></script>
	<script src="/WinterHold_HRM/views/resources/js/demo.js"></script>
	<script src="/WinterHold_HRM/views/resources/js/styleSwitcher.js"></script>
</body>
</html>