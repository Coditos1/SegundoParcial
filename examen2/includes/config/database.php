<?php

    function conectarDB(): mysqli{
        $db = mysqli_connect("127.0.0.1", "root", "", "bienesraices", 3306);

        if($db){
            echo "Conexion exitosa";
        } else{
            echo "Conexion fallida";
        }
        return $db;
    }

?>