<?php
include 'db_connect.php';
$payment = $conn->query("SELECT tp.*, t.name as teacher_name, t.id_no FROM teacher_payments tp inner join teachers t on t.id = tp.teacher_id where tp.id = {$_GET['pid']}");
$row = $payment->fetch_assoc();
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Recibo de Pago a Profesor</title>
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
		<div class="header text-center">
			<h3 class="bold">INSTITUCION EDUCATIVA EMUNAH</h3>
			<p>NIT: 60350099-8</p>
			<p>DANE: 354405000195</p>
			<p>Calle 17 AV 9 N KDX 153-10</p>
			<p>Barrio Tierra Linda</p>
		</div>

		<div class="divider"></div>

		<div class="text-center bold" style="margin: 8px 0; font-size: 12px;">
			COMPROBANTE DE PAGO A PROFESOR
		</div>

		<div class="divider"></div>

		<div class="info-row">
			<span class="info-label">Profesor:</span>
			<span class="info-value"><?php echo ucwords($row['teacher_name']) ?></span>
		</div>
		<div class="info-row">
			<span class="info-label">Cédula:</span>
			<span class="info-value"><?php echo $row['id_no'] ?></span>
		</div>
		<div class="info-row">
			<span class="info-label">Fecha:</span>
			<span class="info-value"><?php echo date("d/m/Y H:i", strtotime($row['date_created'])) ?></span>
		</div>

		<div class="divider"></div>

		<div class="summary-box">
			<div class="summary-row">
				<span>Tipo de Pago:</span>
				<span class="bold"><?php echo $row['payment_type'] ?></span>
			</div>
			<div class="summary-row total">
				<span>MONTO:</span>
				<span>$<?php echo number_format($row['amount'], 0) ?></span>
			</div>
		</div>

		<?php if(!empty($row['remarks'])): ?>
		<div class="divider"></div>
		<div style="font-size: 9px;">
			<p class="bold">Observaciones:</p>
			<p><?php echo $row['remarks'] ?></p>
		</div>
		<?php endif; ?>

		<div class="divider"></div>

		<div class="footer">
			<p>Comprobante de pago</p>
			<p><?php echo date("d/m/Y H:i:s") ?></p>
		</div>
	</div>
</body>
</html>
