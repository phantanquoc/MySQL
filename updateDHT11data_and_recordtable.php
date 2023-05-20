<?php
  require 'database.php';
  
  //---------Kiem tra gia tri  POST  không trống.
  if (!empty($_POST)) {
    $id = $_POST['id'];
    $temperature = $_POST['temperature'];
    $humidity = $_POST['humidity'];
    $status_read_sensor_dht11 = $_POST['status_read_sensor_dht11'];
    
    
    //.................Lay thoi thoi khu vuc gmt +7.
    date_default_timezone_set("Asia/Jakarta"); 
    $tm = date("H:i:s");
    $dt = date("Y-m-d");
    //........................................
    
   //............ Cap nhat du lieu len table.
	
    $pdo = Database::connect();
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // 'esp32_table_dht11_leds_update'   co the thay doi de phu hop voi table ban da tao
    
    $sql = "UPDATE esp32_table_dht11_update SET temperature = ?, humidity = ?, status_read_sensor_dht11 = ?, time = ?, date = ? WHERE id = ?";
    $q = $pdo->prepare($sql);
    $q->execute(array($temperature,$humidity,$status_read_sensor_dht11,$tm,$dt,$id));
    Database::disconnect();
    //........................................ 
    
    //.....Nhap du lieu vao table
    $id_key;
    $board = $_POST['id'];
    $found_empty = false;
    
    $pdo = Database::connect();
    
    //  Kiem tra  "id" co duoc su dung chua.
    while ($found_empty == false) {
      $id_key = generate_string_id(10);
      /// 'esp32_table_dht11_record'   co the thay doi de phu hop voi table ban da tao
      $sql = 'SELECT * FROM esp32_table_dht11_record WHERE id="' . $id_key . '"';
      $q = $pdo->prepare($sql);
      $q->execute();
      
      if (!$data = $q->fetch()) {
        $found_empty = true;
      }
    }
    
    //   Qua trinh nhap du lieu vao table.
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
          /// 'esp32_table_dht11_record'   co the thay doi de phu hop voi table ban da tao

		$sql = "INSERT INTO esp32_table_dht11_record (id,board,temperature,humidity,status_read_sensor_dht11,time,date) values(?, ?, ?, ?, ?, ?,?)";
		$q = $pdo->prepare($sql);
		$q->execute(array($id_key,$board,$temperature,$humidity,$status_read_sensor_dht11,$tm,$dt));
    //::::::::
    
    Database::disconnect();
    //........................................ 
  }
  //---------------------------------------- 
  
  //------ Ham tao "id"  dua tren numbers va  characters.
  function generate_string_id($strength = 16) {
    $permitted_chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $input_length = strlen($permitted_chars);
    $random_string = '';
    for($i = 0; $i < $strength; $i++) {
      $random_character = $permitted_chars[mt_rand(0, $input_length - 1)];
      $random_string .= $random_character;
    }
    return $random_string;
  }
  //---------------------------------------- 
?>