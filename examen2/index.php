<?php
    include 'includes/header.php';

    require '../Examen2Parcial/includes/config/database.php';

    $db = conectarDB();

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $vendedor_id = $_POST["vendedor_id"]; 
        $propiedad_id = $_POST["propiedad_id"];
        $comprador = $_POST["comprador"];
        $fecha_venta = $_POST["fecha_venta"]; 
    
        $query = "INSERT INTO propiedadesVendidas (propiedad_id, vendedor_id, comprador, fecha_venta) VALUES (?, ?, ?, ?)";
        
        // Preparar la consulta
        $stmt = $db->prepare($query);
        
        if ($stmt === false) {
            die("Error en la preparación de la consulta: " . $db->error);
        }
    
        $stmt->bind_param("iiss", $propiedad_id, $vendedor_id, $comprador, $fecha_venta);
    
        if ($stmt->execute()) {
            echo "Propiedad vendida registrada exitosamente.";
        } else {
            echo "Error al registrar la propiedad vendida: " . $stmt->error;
        }
    
        $stmt->close();
        $db->close();
    }

?>
    <h1>Registrar Propiedad Vendida</h1>
    <form action="index.php" method="POST">
        <label for="vendedor_id">ID del Vendedor:</label>
        <input type="number" id="vendedor_id" name="vendedor_id" required>
        <br>
        <label for="propiedad_id">ID de la Propiedad:</label>
        <input type="number" id="propiedad_id" name="propiedad_id" required>
        <br>
        <label for="comprador">Nombre del Comprador:</label>
        <input type="text" id="comprador" name="comprador" required>
        <br>
        <label for="fecha_venta">Fecha de la Venta:</label>
        <input type="date" id="fecha_venta" name="fecha_venta" required>
        <br>
        <input type="submit" value="Registrar Propiedad Vendida">
    </form>
<?php
    include 'includes/footer.php'
?>