<?php include 'db_connect.php' ?>
<?php
if (isset($_GET['id'])) {
	$qry = $conn->query("SELECT * FROM teacher_payments where id = {$_GET['id']} ");
	foreach ($qry->fetch_array() as $k => $v) {
		$$k = $v;
	}
}
?>
<div class="container-fluid">
	<form id="manage-teacher-payment">
		<div id="msg"></div>
		<input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
		<div class="form-group">
			<label for="" class="control-label">Profesor</label>
			<select name="teacher_id" id="teacher_id" class="custom-select input-sm select2" required>
				<option value=""></option>
				<?php
				$teachers = $conn->query("SELECT * FROM teachers order by name asc ");
				while ($row = $teachers->fetch_assoc()) :
				?>
					<option value="<?php echo $row['id'] ?>" <?php echo isset($teacher_id) && $teacher_id == $row['id'] ? 'selected' : '' ?>><?php echo ucwords($row['name']) ?></option>
				<?php endwhile; ?>
			</select>
		</div>
		<div class="form-group">
			<label for="" class="control-label">Tipo de Pago</label>
			<select name="payment_type" class="custom-select" required>
				<option value="">Seleccionar</option>
				<option value="Salario" <?php echo isset($payment_type) && $payment_type == 'Salario' ? 'selected' : '' ?>>Salario</option>
				<option value="Bonificación" <?php echo isset($payment_type) && $payment_type == 'Bonificación' ? 'selected' : '' ?>>Bonificación</option>
				<option value="Adelanto" <?php echo isset($payment_type) && $payment_type == 'Adelanto' ? 'selected' : '' ?>>Adelanto</option>
				<option value="Otro" <?php echo isset($payment_type) && $payment_type == 'Otro' ? 'selected' : '' ?>>Otro</option>
			</select>
		</div>
		<div class="form-group">
			<label for="" class="control-label">Monto</label>
			<input type="number" class="form-control text-right" name="amount" value="<?php echo isset($amount) ? $amount : 0 ?>" required>
		</div>
		<div class="form-group">
			<label for="" class="control-label">Observaciones</label>
			<textarea name="remarks" id="" cols="30" rows="3" class="form-control"><?php echo isset($remarks) ? $remarks : '' ?></textarea>
		</div>
	</form>
</div>

<script>
	$('.select2').select2({
		placeholder: 'Porfavor selecciona aquí',
		width: '100%'
	})

	$('#manage-teacher-payment').submit(function(e) {
		e.preventDefault()
		start_load()
		$.ajax({
			url: 'ajax.php?action=save_teacher_payment',
			method: 'POST',
			data: $(this).serialize(),
			error: err => {
				console.log(err)
				end_load()
			},
			success: function(resp) {
				resp = JSON.parse(resp)
				if (resp.status == 1) {
					alert_toast("Datos guardados con éxito.", 'success')
					setTimeout(function() {
						var nw = window.open('teacher_payment_receipt.php?teacher_id=' + resp.teacher_id + '&pid=' + resp.pid, "_blank", "width=900,height=600")
						setTimeout(function() {
							nw.print()
							setTimeout(function() {
								nw.close()
								location.reload()
							}, 500)
						}, 500)
					}, 500)
				}
			}
		})
	})
</script>
