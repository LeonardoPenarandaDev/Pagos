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
						<b>Profesores</b>
						<span class="float:right"><a class="btn btn-primary col-md-2 col-sm-6 float-right" href="javascript:void(0)" id="new_teacher">
								<i class="fa fa-plus"></i> Nuevo Profesor
							</a></span>
					</div>
					<div class="card-body">
						<table class="table table-condensed table-bordered table-hover">
							<thead>
								<tr>
									<th class="text-center">#</th>
									<th class="">ID No.</th>
									<th class="">Nombre</th>
									<th class="">Contacto</th>
									<th class="">Email</th>
									<th class="">Salario</th>
									<th class="text-center">Acción</th>
								</tr>
							</thead>
							<tbody>
								<?php
								$i = 1;
								$teachers = $conn->query("SELECT * FROM teachers order by name asc ");
								if ($teachers->num_rows > 0) :
									while ($row = $teachers->fetch_assoc()) :
								?>
										<tr>
											<td class="text-center"><?php echo $i++ ?></td>
											<td>
												<p><?php echo $row['id_no'] ?></p>
											</td>
											<td>
												<p><?php echo ucwords($row['name']) ?></p>
											</td>
											<td>
												<p><?php echo $row['contact'] ?></p>
											</td>
											<td>
												<p><?php echo $row['email'] ?></p>
											</td>
											<td class="text-right">
												<p>$<?php echo number_format($row['salary'], 0) ?></p>
											</td>
											<td class="text-center">
												<button class="btn btn-info edit_teacher" type="button" data-id="<?php echo $row['id'] ?>"><i class="fa fa-edit"></i></button>
												<button class="btn btn-danger delete_teacher" type="button" data-id="<?php echo $row['id'] ?>"><i class="fa fa-trash-alt"></i></button>
											</td>
										</tr>
									<?php
									endwhile;
								else :
									?>
									<tr>
										<th class="text-center" colspan="7">Sin datos que mostrar.</th>
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
<style>
	td {
		vertical-align: middle !important;
	}

	td p {
		margin: unset
	}
</style>

<script>
	$(document).ready(function() {
		$('table').dataTable()
	})

	$('#new_teacher').click(function() {
		uni_modal("Nuevo Profesor", "manage_teacher.php", "mid-large")
	})

	$('.edit_teacher').click(function() {
		uni_modal("Gestionar Profesor", "manage_teacher.php?id=" + $(this).attr('data-id'), "mid-large")
	})
	
	$('.delete_teacher').click(function() {
		_conf("¿Deseas eliminar este profesor?", "delete_teacher", [$(this).attr('data-id')])
	})

	function delete_teacher($id) {
		start_load()
		$.ajax({
			url: 'ajax.php?action=delete_teacher',
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
