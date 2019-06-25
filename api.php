<?php 
// Connect the Database
$conn = new mysqli("localhost", "root", "", "vuecrud");
if ($conn->connect_error) {
	die("Database connection established Failed..");
} 

// Save the error
$res = array('error' => false);



// check if the parameter is set 
if (isset($_GET['action'])) {
	$action = $_GET['action'];
}else{
$action = 'read';
}


// if parameter is read
if ($action == 'read') {
	$result = $conn->query("SELECT * FROM `users`");
	$users = array();

	while ($row = $result->fetch_assoc()){
		array_push($users, $row);
	}
	$res['users'] = $users;
}


// if parameter is  create
if ($action == 'create') {

	$username = $_POST['username'];
	$email = $_POST['email'];
	$mobile = $_POST['mobile'];


	$result = $conn->query("INSERT INTO `users` (`username`, `email`, `mobile`) VALUES ('$username', '$email', '$mobile') ");
	if ($result) {
		$res['message'] = "User Added successfully";
	} else{
		$res['error'] = true;
		$res['message'] = "Insert User fail";
	}
}

// If parameter is update
if ($action == 'update') {
	$id = $_POST['id'];
	$username = $_POST['username'];
	$email = $_POST['email'];
	$mobile = $_POST['mobile'];


	$result = $conn->query("UPDATE `users` SET `username` = '$username', `email` = '$email', `mobile` = '$mobile'WHERE `id` = '$id'");
	if ($result) {
		$res['message'] = "User Updated successfully";
	} else{
		$res['error'] = true;
		$res['message'] = "User Update failed";
	}
}




// if parameter is delete
if ($action == 'delete') {
	$id = $_POST['id'];
	$username = $_POST['username'];
	$email = $_POST['email'];
	$mobile = $_POST['mobile'];


	$result = $conn->query("DELETE FROM `users` WHERE `id` = '$id'");
	if ($result) {
		$res['message'] = "User deleted successfully";
	} else{
		$res['error'] = true;
		$res['message'] = "User delete failed";
	}
}









$conn -> close();
header("Content-type: application/json");
echo json_encode($res);
die();

 ?>