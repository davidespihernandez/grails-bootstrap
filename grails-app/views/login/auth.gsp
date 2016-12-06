<html>
	<head>
		<meta name="layout" content="main"/>
		<title><g:message code='springSecurity.login.title'/></title>
	</head>

	<body>
		<div class="wrapper" id="login">
			<div class="block-center mt-xl wd-xl">
				<!-- START panel-->
				<div class="panel panel-dark panel-flat">
					<div class="panel-heading text-center">
						<a href="#">
							<asset:image src="logo.png" class="block-center img-rounded" alt="App Logo"/>
						</a>
					</div>
					<div class="panel-body">
						<g:render template="/shared/notificationTemplate" />
						<p class="text-center pv">SIGN IN TO CONTINUE.</p>
						<form role="form" data-parsley-validate="" novalidate="" class="mb-lg" action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" autocomplete="off">
							<div class="form-group has-feedback">
								<input name="${usernameParameter ?: 'username'}" id="username" type="text" placeholder="Enter user" autocomplete="off" required class="form-control">
								<span class="fa fa-user form-control-feedback text-muted"></span>
							</div>
							<div class="form-group has-feedback">
								<input name="${passwordParameter ?: 'password'}" id="password" type="password" placeholder="Password" required class="form-control">
								<span class="fa fa-lock form-control-feedback text-muted"></span>
							</div>
							<div class="clearfix">
								<div class="checkbox c-checkbox pull-left mt0">
									<label>
										<input type="checkbox" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if> />
										<span class="fa fa-check"></span>Remember Me</label>
								</div>
							</div>
							<button type="submit" id="submit" class="btn btn-block btn-primary mt-lg">Login</button>
						</form>
					</div>
				</div>
				<!-- END panel-->
				<div class="p-lg text-center">
					<span>&copy;</span>
					<span>2016</span>
					<span>-</span>
					<span>David</span>
					<br>
					<span>Grails and Bootstrap Template</span>
				</div>
			</div>
		</div>
		<script>
			(function() {
				document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
			})();
		</script>
	</body>
</html>
