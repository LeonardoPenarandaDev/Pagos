<?php
include 'db_connect.php';
$fees = $conn->query("SELECT ef.*,s.name as sname,s.id_no,concat(c.course,' - ',c.level) as `class` FROM student_ef_list ef inner join student s on s.id = ef.student_id inner join courses c on c.id = ef.course_id  where ef.id = {$_GET['ef_id']}");
foreach ($fees->fetch_array() as $k => $v) {
	$$k = $v;
}
$payments = $conn->query("SELECT * FROM payments where ef_id = $id ");
$pay_arr = array();
while ($row = $payments->fetch_array()) {
	$pay_arr[$row['id']] = $row;
}
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Recibo de Pago</title>
	<style>
		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}

		body {
			font-family: 'Courier New', Courier, monospace;
			font-size: 11px;
			line-height: 1.3;
			background: #f0f0f0;
			padding: 10px;
		}

		.receipt-container {
			width: 80mm;
			max-width: 302px;
			margin: 0 auto;
			background: white;
			padding: 10px;
		}

		.text-center {
			text-align: center;
		}

		.text-right {
			text-align: right;
		}

		.bold {
			font-weight: bold;
		}

		.header {
			margin-bottom: 8px;
		}

		.header h3 {
			font-size: 13px;
			margin: 2px 0;
		}

		.header p {
			font-size: 10px;
			margin: 1px 0;
		}

		.divider {
			border-top: 1px dashed #333;
			margin: 8px 0;
		}

		.section {
			margin-bottom: 8px;
		}

		.section-title {
			font-weight: bold;
			font-size: 11px;
			margin-bottom: 4px;
			border-bottom: 1px solid #333;
		}

		.info-row {
			display: flex;
			justify-content: space-between;
			margin: 2px 0;
			font-size: 10px;
		}

		.info-label {
			font-weight: bold;
		}

		.info-value {
			text-align: right;
			flex: 1;
			margin-left: 5px;
		}

		table {
			width: 100%;
			border-collapse: collapse;
			font-size: 10px;
			margin: 4px 0;
		}

		table th,
		table td {
			padding: 2px 4px;
			text-align: left;
		}

		table th {
			border-bottom: 1px solid #333;
			font-weight: bold;
		}

		table td.amount {
			text-align: right;
		}

		.total-row {
			border-top: 1px solid #333;
			font-weight: bold;
			font-size: 11px;
		}

		.summary-box {
			background: #f5f5f5;
			padding: 6px;
			margin: 8px 0;
			border: 1px solid #ddd;
		}

		.summary-row {
			display: flex;
			justify-content: space-between;
			margin: 3px 0;
			font-size: 11px;
		}

		.summary-row.total {
			font-weight: bold;
			font-size: 12px;
			border-top: 1px solid #333;
			padding-top: 3px;
			margin-top: 3px;
		}

		.footer {
			margin-top: 10px;
			font-size: 9px;
			text-align: center;
		}

		/* Print styles */
		@media print {
			body {
				background: white;
				padding: 0;
			}

			.receipt-container {
				width: 80mm;
				max-width: 80mm;
				margin: 0;
				padding: 5mm;
			}

			@page {
				size: 80mm auto;
				margin: 0;
			}
		}
	</style>
</head>
<body>
	<div class="receipt-container">
		<!-- Header -->
		<div class="header text-center">
			<h3 class="bold">INSTITUCION EDUCATIVA EMUNAH</h3>
			<p>NIT: 60350099-8</p>
			<p>DANE: 354405000195</p>
			<p>Calle 17 AV 9 N KDX 153-10</p>
			<p>Barrio Tierra Linda</p>
		</div>

		<div class="divider"></div>

		<!-- Receipt Type -->
		<div class="text-center bold" style="margin: 8px 0; font-size: 12px;">
			<?php echo $_GET['pid'] == 0 ? "FACTURA" : 'RECIBO DE PAGO' ?>
		</div>

		<div class="divider"></div>

		<!-- Student Information -->
		<div class="section">
			<div class="info-row">
				<span class="info-label">No. Curso:</span>
				<span class="info-value"><?php echo $ef_no ?></span>
			</div>
			<div class="info-row">
				<span class="info-label">Estudiante:</span>
				<span class="info-value"><?php echo ucwords($sname) ?></span>
			</div>
			<div class="info-row">
				<span class="info-label">Curso/Nivel:</span>
				<span class="info-value"><?php echo $class ?></span>
			</div>
			<div class="info-row">
				<span class="info-label">ID:</span>
				<span class="info-value"><?php echo $id_no ?></span>
			</div>
		</div>

		<?php if ($_GET['pid'] > 0) : ?>
		<div class="divider"></div>
		
		<!-- Payment Details -->
		<div class="section">
			<div class="section-title">DETALLE DEL PAGO</div>
			<div class="info-row">
				<span class="info-label">Fecha:</span>
				<span class="info-value"><?php echo isset($pay_arr[$_GET['pid']]) ? date("d/m/Y", strtotime($pay_arr[$_GET['pid']]['date_created'])) : '' ?></span>
			</div>
			<div class="info-row">
				<span class="info-label">Monto:</span>
				<span class="info-value bold">$<?php echo isset($pay_arr[$_GET['pid']]) ? number_format($pay_arr[$_GET['pid']]['amount'], 0) : '' ?></span>
			</div>
			<?php if(isset($pay_arr[$_GET['pid']]) && !empty($pay_arr[$_GET['pid']]['remarks'])): ?>
			<div class="info-row">
				<span class="info-label">Observación:</span>
			</div>
			<div style="font-size: 9px; margin-top: 2px;">
				<?php echo $pay_arr[$_GET['pid']]['remarks'] ?>
			</div>
			<?php endif; ?>
		</div>
		<?php endif; ?>

		<div class="divider"></div>

		<!-- Fee Details -->
		<div class="section">
			<div class="section-title">DETALLES DE TARIFA</div>
			<table>
				<thead>
					<tr>
						<th>Concepto</th>
						<th class="amount">Monto</th>
					</tr>
				</thead>
				<tbody>
					<?php
					$cfees = $conn->query("SELECT * FROM fees where course_id = $course_id");
					$ftotal = 0;
					while ($row = $cfees->fetch_assoc()) {
						$ftotal += $row['amount'];
					?>
					<tr>
						<td><?php echo $row['description'] ?></td>
						<td class="amount">$<?php echo number_format($row['amount'], 0) ?></td>
					</tr>
					<?php } ?>
				</tbody>
				<tfoot>
					<tr class="total-row">
						<td>TOTAL TARIFA</td>
						<td class="amount">$<?php echo number_format($ftotal, 0) ?></td>
					</tr>
				</tfoot>
			</table>
		</div>

		<div class="divider"></div>

		<!-- Payment History -->
		<div class="section">
			<div class="section-title">HISTORIAL DE PAGOS</div>
			<table>
				<thead>
					<tr>
						<th>Fecha</th>
						<th class="amount">Monto</th>
					</tr>
				</thead>
				<tbody>
					<?php
					$ptotal = 0;
					foreach ($pay_arr as $row) {
						if ($row["id"] <= $_GET['pid'] || $_GET['pid'] == 0) {
							$ptotal += $row['amount'];
					?>
					<tr>
						<td><?php echo date("d/m/Y", strtotime($row['date_created'])) ?></td>
						<td class="amount">$<?php echo number_format($row['amount'], 0) ?></td>
					</tr>
					<?php
						}
					}
					?>
				</tbody>
				<tfoot>
					<tr class="total-row">
						<td>TOTAL PAGADO</td>
						<td class="amount">$<?php echo number_format($ptotal, 0) ?></td>
					</tr>
				</tfoot>
			</table>
		</div>

		<div class="divider"></div>

		<!-- Summary -->
		<div class="summary-box">
			<div class="summary-row">
				<span>Tarifa Total:</span>
				<span class="bold">$<?php echo number_format($ftotal, 0) ?></span>
			</div>
			<div class="summary-row">
				<span>Total Pagado:</span>
				<span class="bold">$<?php echo number_format($ptotal, 0) ?></span>
			</div>
			<div class="summary-row total">
				<span>BALANCE:</span>
				<span>$<?php echo number_format($ftotal - $ptotal, 0) ?></span>
			</div>
		</div>

		<div class="divider"></div>

		<!-- Footer -->
		<div class="footer">
			<p>Gracias por su pago</p>
			<p><?php echo date("d/m/Y H:i:s") ?></p>
		</div>
	</div>

	<script>
		// Auto print on load (optional)
		// window.onload = function() { window.print(); }
	</script>
</body>
</html>