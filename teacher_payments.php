<?php include 'db_connect.php'; ?>
<div class="container-fluid">
	<div class="col-lg-12">
		<div class="row mb-4 mt-4">
			<div class="col-md-12">
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<b>Pagos a Profesores</b>
						<span class="float:right"><a class="btn btn-primary col-md-2 col-sm-6 float-right" href="javascript:void(0)" id="new_payment">
								<i class="fa fa-plus"></i> Nuevo Pago
							</a></span>
					</div>
					<div class="card-body">
						<table class="table table-condensed table-bordered table-hover">
							<thead>
								<tr>
									<th class="text-center">#</th>
									<th class="">Fecha</th>
									<th class="">Profesor</th>
									<th class="">Tipo de Pago</th>
									<th class="">Monto</th>
									<th class="text-center">Acción</th>
								</tr>
							</thead>
							<tbody>
								<?php
								$i = 1;
								$payments = $conn->query("SELECT tp.*, t.name as teacher_name FROM teacher_payments tp inner join teachers t on t.id = tp.teacher_id order by unix_timestamp(tp.date_created) desc ");
								if ($payments->num_rows > 0) :
									while ($row = $payments->fetch_assoc()) :
								?>
										<tr>
											<td class="text-center"><?php echo $i++ ?></td>
											<td>
												<p><?php echo date("M d,Y H:i A", strtotime($row['date_created'])) ?></p>
											</td>
											<td>
												<p><?php echo ucwords($row['teacher_name']) ?></p>
											</td>
											<td>
												<p><?php echo $row['payment_type'] ?></p>
											</td>
											<td class="text-right">
												<p>$<?php echo number_format($row['amount'], 0) ?></p>
											</td>
											<td class="text-center">
												<button class="btn btn-primary print_receipt" type="button" data-id="<?php echo $row['id'] ?>" data-teacher_id="<?php echo $row['teacher_id'] ?>"><i class="fa fa-print"></i></button>
												<button class="btn btn-info edit_payment" type="button" data-id="<?php echo $row['id'] ?>"><i class="fa fa-edit"></i></button>
												<button class="btn btn-danger delete_payment" type="button" data-id="<?php echo $row['id'] ?>"><i class="fa fa-trash-alt"></i></button>
											</td>
										</tr>
									<?php
									endwhile;
								else :
									?>
									<tr>
										<th class="text-center" colspan="6">Sin datos que mostrar.</th>
									</tr>
								<?php
								endif;
								?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('table').dataTable()
	})

	$('#new_payment').click(function() {
		uni_modal("Nuevo Pago a Profesor", "manage_teacher_payment.php", "mid-large")
	})

	$('.edit_payment').click(function() {
		uni_modal("Gestionar Pago", "manage_teacher_payment.php?id=" + $(this).attr('data-id'), "mid-large")
	})

	$('.print_receipt').click(function() {
		var nw = window.open('teacher_payment_receipt.php?teacher_id=' + $(this).attr('data-teacher_id') + '&pid=' + $(this).attr('data-id'), "_blank", "width=900,height=600")
		nw.print()
	})

	$('.delete_payment').click(function() {
		_conf("¿Deseas eliminar este pago?", "delete_payment", [$(this).attr('data-id')])
	})

	function delete_payment($id) {
		start_load()
		$.ajax({
			url: 'ajax.php?action=delete_teacher_payment',
			method: 'POST',
			data: {
				id: $id
			},
			success: function(resp) {
				if (resp == 1) {
					alert_toast("Datos eliminados exitósamente", 'success')
					setTimeout(function() {
						location.reload()
					}, 1500)
				}
			}
		})
	}
</script>
