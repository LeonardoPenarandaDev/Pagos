<style>
	.collapse a {
		text-indent: 10px;
	}

	nav#sidebar {
		/*background: url(assets/uploads/<?php echo $_SESSION['system']['cover_img'] ?>) !important*/
	}
</style>

<nav id="sidebar" class='mx-lt-5 bg-white'>

	<div class="sidebar-list">
		<a href="index.php?page=students" class="nav-item nav-students"><span class='icon-field'><i class="fa fa-users "></i></span> Estudiantes</a>
		<a href="index.php?page=fees" class="nav-item nav-fees"><span class='icon-field'><i class="fa fa-money-check "></i></span> Pagos de Estudiantes</a>
		<a href="index.php?page=courses" class="nav-item nav-courses"><span class='icon-field'><i class="fa fa-scroll "></i></span> Cursos</a>

		<a href="index.php?page=payments" class="nav-item nav-payments"><span class='icon-field'><i class="fa fa-receipt "></i></span> Pagos</a>

		<a href="index.php?page=payments_report" class="nav-item nav-payments_report"><span class='icon-field'><i class="fa fa-th-list"></i></span> Reportes de Pago</a>
	
	<a href="index.php?page=misc_payments" class="nav-item nav-misc_payments"><span class='icon-field'><i class="fa fa-file-invoice-dollar"></i></span> Pagos Misceláneos</a>
	
	<a href="index.php?page=teachers" class="nav-item nav-teachers"><span class='icon-field'><i class="fa fa-chalkboard-teacher"></i></span> Profesores</a>
	
	<a href="index.php?page=teacher_payments" class="nav-item nav-teacher_payments"><span class='icon-field'><i class="fa fa-hand-holding-usd"></i></span> Pagos a Profesores</a>
	
	<a href="index.php?page=expenses" class="nav-item nav-expenses"><span class='icon-field'><i class="fa fa-shopping-cart"></i></span> Gastos</a>
	
	<a href="index.php?page=financial_dashboard" class="nav-item nav-financial_dashboard"><span class='icon-field'><i class="fa fa-chart-line"></i></span> Dashboard Financiero</a>
	
	<?php if ($_SESSION['login_type'] == 1) : ?>
		<a href="index.php?page=users" class="nav-item nav-users"><span class='icon-field'><i class="fa fa-users "></i></span> Usuarios</a> <?php endif; ?>
	</div>

</nav>

<script>
	$('.nav_collapse').click(function() {
		console.log($(this).attr('href'))
		$($(this).attr('href')).collapse()
	})
	$('.nav-<?php echo isset($_GET['page']) ? $_GET['page'] : '' ?>').addClass('active')
</script>