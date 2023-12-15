<?php
    require "const.php";
    function getDBConnection($dbConn=DB_CONN,$user=DB_USER,$pass=DB_PASS){
        $conn = null;
        try{
            $conn  = new PDO($dbConn,$user,$pass,[PDO::ATTR_PERSISTENT=>true]);
        }catch(PDOException $error){
            echo "Error BD: ".$error->getMessage();
        }finally{
            return $conn;
        }
    }
    function checkUserDB($mail,$pass){
            $pass  = md5($pass);
            $conn  = getDBConnection();

            $sql   = "SELECT * FROM trabajadores WHERE `user` = '$mail' AND `pass`= '$pass';";
            try{
                $login = null;
                $login = $conn->query($sql);
                $login = $login && $login->rowCount()>0 ? true : false;
            }catch(PDOException $error){
                echo "Error BD: ".$error->getMessage();
                $login = false;
            }finally{
                return $login;
            }
        }
    function getUser($tabla){
        $conn = getDBConnection();
        $sql  = "SELECT * FROM $tabla";
        try {
            $user = false;
            $user = $conn->query($sql);
        } catch (PDOException $error) {
            return [];
        } finally {
            return $user;
        }
    }