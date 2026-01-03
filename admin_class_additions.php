	// ============ TEACHERS ============
	function save_teacher(){
		extract($_POST);
		$data = "";
		foreach($_POST as $k => $v){
			if(!in_array($k, array('id')) && !is_numeric($k)){
				if(empty($data)){
					$data .= " $k='$v' ";
				}else{
					$data .= ", $k='$v' ";
				}
			}
		}
		$check = $this->db->query("SELECT * FROM teachers where id_no ='$id_no' ".(!empty($id) ? " and id != {$id} " : ''))->num_rows;
		if($check > 0){
			return 2;
			exit;
		}
		if(empty($id)){
			$save = $this->db->query("INSERT INTO teachers set $data");
		}else{
			$save = $this->db->query("UPDATE teachers set $data where id = $id");
		}
		if($save)
			return 1;
	}
	
	function delete_teacher(){
		extract($_POST);
		$delete = $this->db->query("DELETE FROM teachers where id = ".$id);
		if($delete){
			return 1;
		}
	}

	// ============ TEACHER PAYMENTS ============
	function save_teacher_payment(){
		extract($_POST);
		$data = "";
		foreach($_POST as $k => $v){
			if(!in_array($k, array('id')) && !is_numeric($k)){
				if($k == 'amount'){
					$v = str_replace(',', '', $v);
				}
				if(empty($data)){
					$data .= " $k='$v' ";
				}else{
					$data .= ", $k='$v' ";
				}
			}
		}
		if(empty($id)){
			$save = $this->db->query("INSERT INTO teacher_payments set $data");
			if($save)
				$id= $this->db->insert_id;
		}else{
			$save = $this->db->query("UPDATE teacher_payments set $data where id = $id");
		}
		if($save)
			return json_encode(array('teacher_id'=>$teacher_id, 'pid'=>$id,'status'=>1));
	}
	
	function delete_teacher_payment(){
		extract($_POST);
		$delete = $this->db->query("DELETE FROM teacher_payments where id = ".$id);
		if($delete){
			return 1;
		}
	}

	// ============ MISCELLANEOUS PAYMENTS ============
	function save_misc_payment(){
		extract($_POST);
		$data = "";
		foreach($_POST as $k => $v){
			if(!in_array($k, array('id')) && !is_numeric($k)){
				if($k == 'amount'){
					$v = str_replace(',', '', $v);
				}
				if(empty($data)){
					$data .= " $k='$v' ";
				}else{
					$data .= ", $k='$v' ";
				}
			}
		}
		if(empty($id)){
			$save = $this->db->query("INSERT INTO miscellaneous_payments set $data");
			if($save)
				$id= $this->db->insert_id;
		}else{
			$save = $this->db->query("UPDATE miscellaneous_payments set $data where id = $id");
		}
		if($save)
			return json_encode(array('student_id'=>$student_id, 'pid'=>$id,'status'=>1));
	}
	
	function delete_misc_payment(){
		extract($_POST);
		$delete = $this->db->query("DELETE FROM miscellaneous_payments where id = ".$id);
		if($delete){
			return 1;
		}
	}

	// ============ EXPENSES ============
	function save_expense(){
		extract($_POST);
		$data = "";
		foreach($_POST as $k => $v){
			if(!in_array($k, array('id')) && !is_numeric($k)){
				if($k == 'amount'){
					$v = str_replace(',', '', $v);
				}
				if(empty($data)){
					$data .= " $k='$v' ";
				}else{
					$data .= ", $k='$v' ";
				}
			}
		}
		if(empty($id)){
			$save = $this->db->query("INSERT INTO expenses set $data");
		}else{
			$save = $this->db->query("UPDATE expenses set $data where id = $id");
		}
		if($save)
			return 1;
	}
	
	function delete_expense(){
		extract($_POST);
		$delete = $this->db->query("DELETE FROM expenses where id = ".$id);
		if($delete){
			return 1;
		}
	}
