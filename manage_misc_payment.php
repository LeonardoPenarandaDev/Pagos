<?php include 'db_connect.php' ?>
<?php
if (isset($_GET['id'])) {
	$qry = $conn->query("SELECT * FROM miscellaneous_payments where id = {$_GET['id']} ");
	foreach ($qry->fetch_array() as $k => $v) {
		$$k = $v;
	}
}
?>
<div class="container-fluid">
	<form id="manage-misc-payment">
		<div id="msg"></div>
		<input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
		<div class="form-group">
			<label for="" class="control-label">Estudiante</label>
			<select name="student_id" id="student_id" class="custom-select input-sm select2" required>
				<option value=""></option>
				<?php
				$students = $conn->query("SELECT * FROM student order by name asc ");
				while ($row = $students->fetch_assoc()) :
				?>
					<option value="<?php echo $row['id'] ?>" <?php echo isset($student_id) && $student_id == $row['id'] ? 'selected' : '' ?>><?php echo $row['id_no'] . ' | ' . ucwords($row['name']) ?></option>
				<?php endwhile; ?>
			</select>
		</div>
		<div class="form-group">
			<label for="" class="control-label">Concepto</label>
			<input type="text" class="form-control" name="concept" value="<?php echo isset($concept) ? $concept : '' ?>" placeholder="Ej: Certificado, Uniforme, etc." required>
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

	$('#manage-misc-payment').submit(function(e) {
		e.preventDefault()
		start_load()
		$.ajax({
			url: 'ajax.php?action=save_misc_payment',
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
						var nw = window.open('misc_receipt.php?student_id=' + resp.student_id + '&pid=' + resp.pid, "_blank", "width=900,height=600")
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
