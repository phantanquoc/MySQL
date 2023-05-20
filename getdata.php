<?php
  include 'database.php';
  
  //----------Condition to check that POST value is not empty.
  if (!empty($_POST)) {
    // keep track post values
    $id = $_POST['id'];
    
    $myObj = (object)array();
   
    $pdo = Database::connect();
   		
	// Tai dong : sql = 'SELECT * FROM esp32_table_dht11_update WHERE id="' . $id . '"'; ban co the thay doi ten table giong voi ten table ban tao de cap nhat du lieu 
	
	$sql = 'SELECT * FROM esp32_table_dht11_update WHERE id="' . $id . '"';
    foreach ($pdo->query($sql) as $row) {
      $date = date_create($row['date']);
      $dateFormat = date_format($date,"d-m-Y");
      
      $myObj->id = $row['id'];
      $myObj->temperature = $row['temperature'];
      $myObj->humidity = $row['humidity'];
      $myObj->status_read_sensor_dht11 = $row['status_read_sensor_dht11'];
      $myObj->ls_time = $row['time'];
      $myObj->ls_date = $dateFormat;
      
      $myJSON = json_encode($myObj);
      
      echo $myJSON;
    }
    Database::disconnect();
   
  }
  //---------------------------------------- 
?>