<?php include 'db_connect.php' ?>
<?php
if (isset($_GET['id'])) {
	$qry = $conn->query("SELECT * FROM teachers where id = {$_GET['id']} ");
	foreach ($qry->fetch_array() as $k => $v) {
		$$k = $v;
	}
}
?>
<div class="container-fluid">
	<form id="manage-teacher">
		<div id="msg"></div>
		<input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
		<div class="form-group">
			<label for="" class="control-label">Cédula/ID</label>
			<input type="text" class="form-control" name="id_no" value="<?php echo isset($id_no) ? $id_no : '' ?>" required>
		</div>
		<div class="form-group">
			<label for="" class="control-label">Nombre Completo</label>
			<input type="text" class="form-control" name="name" value="<?php echo isset($name) ? $name : '' ?>" required>
		</div>
		<div class="form-group">
			<label for="" class="control-label">Contacto</label>
			<input type="text" class="form-control" name="contact" value="<?php echo isset($contact) ? $contact : '' ?>">
		</div>
		<div class="form-group">
			<label for="" class="control-label">Email</label>
			<input type="email" class="form-control" name="email" value="<?php echo isset($email) ? $email : '' ?>">
		</div>
		<div class="form-group">
			<label for="" class="control-label">Dirección</label>
			<textarea name="address" id="" cols="30" rows="3" class="form-control"><?php echo isset($address) ? $address : '' ?></textarea>
		</div>
		<div class="form-group">
			<label for="" class="control-label">Salario Mensual</label>
			<input type="number" class="form-control text-right" name="salary" value="<?php echo isset($salary) ? $salary : 0 ?>" required>
		</div>
	</form>
</div>

<script>
	$('#manage-teacher').submit(function(e) {
		e.preventDefault()
		start_load()
		$.ajax({
			url: 'ajax.php?action=save_teacher',
			method: 'POST',
			data: $(this).serialize(),
			error: err => {
				console.log(err)
				end_load()
			},
			success: function(resp) {
				if (resp == 1) {
					alert_toast("Datos guardados con éxito.", 'success')
					setTimeout(function() {
						location.reload()
					}, 1500)
				} else if (resp == 2) {
					$('#msg').html('<div class="alert alert-danger">Cédula/ID ya existe.</div>')
					end_load()
				}
			}
		})
	})
</script>
