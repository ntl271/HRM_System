<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content="admin, dashboard">
<meta name="author" content="DexignZone">
<meta name="robots" content="index, follow">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Dompet : Payment Admin Template">
<meta property="og:title" content="Dompet : Payment Admin Template">
<meta property="og:description" content="Dompet : Payment Admin Template">
<meta property="og:image" content="https://dompet.dexignlab.com/xhtml/social-image.png">
<meta name="format-detection" content="telephone=no">
<!-- FAVICONS ICON -->
<link rel="shortcut icon" type="image/png" href="resources/images/favicon.png">
<link href="resources/css/style.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body class="vh-100">
	<div class="authincation h-100">
		<div class="container h-100">
			<div class="row justify-content-center h-100 align-items-center">
				<div class="col-md-6">
					<div class="authincation-content">
						<div class="row no-gutters">
							<div class="col-xl-12">
								<div class="auth-form">
									<div class="text-center mb-3">
										<a href="index.html"><img src="resources/images/logo-full.png"
											alt=""></a>
									</div>
									<h4 class="text-center mb-4">Đăng nhập với tài khoản</h4>
									<form action="index.jsp">
										<div class="mb-3">
											<label class="mb-1"><strong>Email</strong></label> <input
												type="email" class="form-control" value="hello@example.com">
										</div>
										<div class="mb-3">
											<label class="mb-1"><strong>Mật khẩu</strong></label> <input
												type="password" class="form-control" value="Password">
										</div>
										<div class="row d-flex justify-content-between mt-4 mb-2">
											<div class="mb-3">
												<div class="form-check custom-checkbox ms-1">
													<input type="checkbox" class="form-check-input"
														id="basic_checkbox_1"> <label
														class="form-check-label" for="basic_checkbox_1">Lưu
														tài khoản</label>
												</div>
											</div>
											<div class="mb-3">
												<a href="forgot-password.jsp">Quên mật khẩu?</a>
											</div>
										</div>
										<div class="text-center">
											<button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
										</div>
									</form>
									<div class="new-account mt-3">
										<p>
											Chưa có account? <a class="text-primary"
												href="register.jsp">Đăng ký</a>
										</p>
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
        Scripts
    ***********************************-->
	<!-- Required vendors -->
	<script src="resources/vendor/global/global.min.js"></script>
	<script src="resources/js/custom.min.js"></script>
	<script src="resources/js/dlabnav-init.js"></script>
	<script src="resources/js/styleSwitcher.js"></script>
</body>
</html>