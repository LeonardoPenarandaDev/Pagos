<?php include 'db_connect.php'; ?>
<div class="container-fluid">
	<div class="col-lg-12">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<b>Gastos del Colegio</b>
						<span class="float:right"><a class="btn btn-primary col-md-2 col-sm-6 float-right" href="javascript:void(0)" id="new_expense">
								<i class="fa fa-plus"></i> Nuevo Gasto
							</a></span>
					</div>
					<div class="card-body">
						<table class="table table-condensed table-bordered table-hover">
							<thead>
								<tr>
									<th class="text-center">#</th>
									<th>Fecha</th>
									<th>Concepto</th>
									<th>Categoría</th>
									<th>Monto</th>
									<th class="text-center">Acción</th>
								</tr>
							</thead>
							<tbody>
								<?php
								$i = 1;
								$expenses = $conn->query("SELECT * FROM expenses order by unix_timestamp(date_created) desc ");
								if ($expenses->num_rows > 0) :
									while ($row = $expenses->fetch_assoc()) :
								?>
										<tr>
											<td class="text-center"><?php echo $i++ ?></td>
											<td><?php echo date("M d,Y H:i A", strtotime($row['date_created'])) ?></td>
											<td><?php echo $row['concept'] ?></td>
											<td><?php echo $row['category'] ?></td>
											<td class="text-right">$<?php echo number_format($row['amount'], 0) ?></td>
											<td class="text-center">
												<button class="btn btn-info edit_expense" type="button" data-id="<?php echo $row['id'] ?>"><i class="fa fa-edit"></i></button>
												<button class="btn btn-danger delete_expense" type="button" data-id="<?php echo $row['id'] ?>"><i class="fa fa-trash-alt"></i></button>
											</td>
										</tr>
									<?php
									endwhile;
								else :
									?>
									<tr>
										<th class="text-center" colspan="6">Sin datos que mostrar.</th>
									</tr>
								<?php endif; ?>
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

	$('#new_expense').click(function() {
		uni_modal("Nuevo Gasto", "manage_expense.php", "mid-large")
	})

	$('.edit_expense').click(function() {
		uni_modal("Gestionar Gasto", "manage_expense.php?id=" + $(this).attr('data-id'), "mid-large")
	})

	$('.delete_expense').click(function() {
		_conf("¿Deseas eliminar este gasto?", "delete_expense", [$(this).attr('data-id')])
	})

	function delete_expense($id) {
		start_load()
		$.ajax({
			url: 'ajax.php?action=delete_expense',
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
