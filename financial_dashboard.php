<?php include 'db_connect.php'; ?>
<?php
// Calculate total income from course payments
$course_payments = $conn->query("SELECT COALESCE(SUM(amount), 0) as total FROM payments");
$course_income = $course_payments->fetch_assoc()['total'];

// Calculate total income from miscellaneous payments
$misc_payments = $conn->query("SELECT COALESCE(SUM(amount), 0) as total FROM miscellaneous_payments");
$misc_income = $misc_payments->fetch_assoc()['total'];

// Total income
$total_income = $course_income + $misc_income;

// Calculate total expenses from teacher payments
$teacher_payments = $conn->query("SELECT COALESCE(SUM(amount), 0) as total FROM teacher_payments");
$teacher_expenses = $teacher_payments->fetch_assoc()['total'];

// Calculate total expenses from general expenses
$general_expenses = $conn->query("SELECT COALESCE(SUM(amount), 0) as total FROM expenses");
$general_exp = $general_expenses->fetch_assoc()['total'];

// Total expenses
$total_expenses = $teacher_expenses + $general_exp;

// Balance
$balance = $total_income - $total_expenses;
?>

<div class="container-fluid">
	<div class="col-lg-12">
		<div class="row mt-4 mb-4">
			<div class="col-md-12">
				<h3><b>Dashboard Financiero</b></h3>
			</div>
		</div>

		<!-- Summary Cards -->
		<div class="row">
			<div class="col-md-4">
				<div class="card bg-success text-white">
					<div class="card-body">
						<h5 class="card-title"><i class="fa fa-arrow-up"></i> Total Ingresos</h5>
						<h2>$<?php echo number_format($total_income, 0) ?></h2>
						<small>Pagos de cursos + Pagos misceláneos</small>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card bg-danger text-white">
					<div class="card-body">
						<h5 class="card-title"><i class="fa fa-arrow-down"></i> Total Gastos</h5>
						<h2>$<?php echo number_format($total_expenses, 0) ?></h2>
						<small>Pagos a profesores + Gastos generales</small>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card <?php echo $balance >= 0 ? 'bg-primary' : 'bg-warning' ?> text-white">
					<div class="card-body">
						<h5 class="card-title"><i class="fa fa-balance-scale"></i> Balance</h5>
						<h2>$<?php echo number_format($balance, 0) ?></h2>
						<small>Ingresos - Gastos</small>
					</div>
				</div>
			</div>
		</div>

		<!-- Detailed Breakdown -->
		<div class="row mt-4">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header bg-success text-white">
						<b>Desglose de Ingresos</b>
					</div>
					<div class="card-body">
						<table class="table table-bordered">
							<tr>
								<td>Pagos de Cursos</td>
								<td class="text-right"><b>$<?php echo number_format($course_income, 0) ?></b></td>
							</tr>
							<tr>
								<td>Pagos Misceláneos</td>
								<td class="text-right"><b>$<?php echo number_format($misc_income, 0) ?></b></td>
							</tr>
							<tr class="table-success">
								<td><b>TOTAL INGRESOS</b></td>
								<td class="text-right"><b>$<?php echo number_format($total_income, 0) ?></b></td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-header bg-danger text-white">
						<b>Desglose de Gastos</b>
					</div>
					<div class="card-body">
						<table class="table table-bordered">
							<tr>
								<td>Pagos a Profesores</td>
								<td class="text-right"><b>$<?php echo number_format($teacher_expenses, 0) ?></b></td>
							</tr>
							<tr>
								<td>Gastos Generales</td>
								<td class="text-right"><b>$<?php echo number_format($general_exp, 0) ?></b></td>
							</tr>
							<tr class="table-danger">
								<td><b>TOTAL GASTOS</b></td>
								<td class="text-right"><b>$<?php echo number_format($total_expenses, 0) ?></b></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>

		<!-- Recent Transactions -->
		<div class="row mt-4">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<b>Últimos Ingresos</b>
					</div>
					<div class="card-body">
						<table class="table table-sm table-hover">
							<thead>
								<tr>
									<th>Fecha</th>
									<th>Tipo</th>
									<th class="text-right">Monto</th>
								</tr>
							</thead>
							<tbody>
								<?php
								// Get last 5 course payments
								$recent_course = $conn->query("SELECT p.date_created, p.amount, s.name FROM payments p INNER JOIN student_ef_list ef ON ef.id = p.ef_id INNER JOIN student s ON s.id = ef.student_id ORDER BY p.date_created DESC LIMIT 5");
								while ($row = $recent_course->fetch_assoc()) :
								?>
									<tr>
										<td><?php echo date("d/m/Y", strtotime($row['date_created'])) ?></td>
										<td><small>Pago Curso - <?php echo substr($row['name'], 0, 20) ?></small></td>
										<td class="text-right text-success"><b>$<?php echo number_format($row['amount'], 0) ?></b></td>
									</tr>
								<?php endwhile; ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<b>Últimos Gastos</b>
					</div>
					<div class="card-body">
						<table class="table table-sm table-hover">
							<thead>
								<tr>
									<th>Fecha</th>
									<th>Tipo</th>
									<th class="text-right">Monto</th>
								</tr>
							</thead>
							<tbody>
								<?php
								// Get last 5 teacher payments
								$recent_teacher = $conn->query("SELECT tp.date_created, tp.amount, t.name FROM teacher_payments tp INNER JOIN teachers t ON t.id = tp.teacher_id ORDER BY tp.date_created DESC LIMIT 3");
								while ($row = $recent_teacher->fetch_assoc()) :
								?>
									<tr>
										<td><?php echo date("d/m/Y", strtotime($row['date_created'])) ?></td>
										<td><small>Profesor - <?php echo substr($row['name'], 0, 20) ?></small></td>
										<td class="text-right text-danger"><b>$<?php echo number_format($row['amount'], 0) ?></b></td>
									</tr>
								<?php endwhile; ?>
								
								<?php
								// Get last 2 general expenses
								$recent_exp = $conn->query("SELECT date_created, amount, concept FROM expenses ORDER BY date_created DESC LIMIT 2");
								while ($row = $recent_exp->fetch_assoc()) :
								?>
									<tr>
										<td><?php echo date("d/m/Y", strtotime($row['date_created'])) ?></td>
										<td><small><?php echo substr($row['concept'], 0, 25) ?></small></td>
										<td class="text-right text-danger"><b>$<?php echo number_format($row['amount'], 0) ?></b></td>
									</tr>
								<?php endwhile; ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<style>
	.card {
		box-shadow: 0 2px 4px rgba(0,0,0,0.1);
		margin-bottom: 20px;
	}
	
	.card-body h2 {
		font-size: 2.5rem;
		margin: 10px 0;
	}
</style>
