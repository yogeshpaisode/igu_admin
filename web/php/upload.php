<?php
   header("Access-Control-Allow-Origin: *");
   if(isset($_FILES['image'])){
      $errors= array();
      $file_name = $_FILES['image']['name'];
      $file_size =$_FILES['image']['size'];
      $file_tmp =$_FILES['image']['tmp_name'];
      $file_type=$_FILES['image']['type'];
      
      if(empty($errors)==true){
           move_uploaded_file($file_tmp,"img/".$file_name);
         echo "Success BRO..".$_POST["p_Id"]."--".$_POST["p_Title"]."--".$_POST["p_Subject"];
      }else{
         print_r($errors);
      }
   }
?>
