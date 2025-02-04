<?php 
session_start();
if (isset($_SESSION['unique_id'])) {
    include_once "config.php";
    $outgoing_id = $_SESSION['unique_id'];
    $incoming_id = mysqli_real_escape_string($conn, $_POST['incoming_id']);
    $message = mysqli_real_escape_string($conn, $_POST['message']);
    
    if (!empty($message)) {
        // Insert the message into the database, with read_status set to 0 (unread)
        $sql = mysqli_query($conn, "INSERT INTO messages (incoming_msg_id, outgoing_msg_id, msg, read_status)
                                    VALUES ({$incoming_id}, {$outgoing_id}, '{$message}', 0)") or die(mysqli_error($conn));
        
        // You can also add any other necessary actions here, like triggering notifications.
    }
} else {
    header("location: ../login.php");
}
?>
