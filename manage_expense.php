<?php include 'db_connect.php' ?>
<?php
if (isset($_GET['id'])) {
	$qry = $conn->query("SELECT * FROM expenses where id = {$_GET['id']} ");
	foreach ($qry->fetch_array() as $k => $v) {
		$$k = $v;
	}
}
?>
<div class="container-fluid">
	<form id="manage-expense">
		<div id="msg"></div>
		<input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
		<div class="form-group">
			<label for="" class="control-label">Concepto</label>
			<input type="text" class="form-control" name="concept" value="<?php echo isset($concept) ? $concept : '' ?>" required>
		</div>
		<div class="form-group">
			<label for="" class="control-label">Categoría</label>
			<select name="category" class="custom-select">
				<option value="">Seleccionar</option>
				<option value="Servicios Públicos" <?php echo isset($category) && $category == 'Servicios Públicos' ? 'selected' : '' ?>>Servicios Públicos</option>
				<option value="Mantenimiento" <?php echo isset($category) && $category == 'Mantenimiento' ? 'selected' : '' ?>>Mantenimiento</option>
				<option value="Materiales" <?php echo isset($category) && $category == 'Materiales' ? 'selected' : '' ?>>Materiales</option>
				<option value="Transporte" <?php echo isset($category) && $category == 'Transporte' ? 'selected' : '' ?>>Transporte</option>
				<option value="Otro" <?php echo isset($category) && $category == 'Otro' ? 'selected' : '' ?>>Otro</option>
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
	$('#manage-expense').submit(function(e) {
		e.preventDefault()
		start_load()
		$.ajax({
			url: 'ajax.php?action=save_expense',
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
				}
			}
		})
	})
</script>
