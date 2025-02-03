<?php 
session_start();
if (isset($_SESSION['unique_id'])) {
    include_once "config.php";
    $outgoing_id = $_SESSION['unique_id'];
    $incoming_id = mysqli_real_escape_string($conn, $_POST['incoming_id']);
    $output = "";

    // Get the role of the logged-in user
    $role_query = mysqli_query($conn, "SELECT role FROM users WHERE unique_id = {$outgoing_id}");
    $user_data = mysqli_fetch_assoc($role_query);
    $role = $user_data['role'];

    if ($role === 'admin') {
        // Admins can see all messages between themselves and any user
        $sql = "SELECT * FROM messages 
                LEFT JOIN users ON users.unique_id = messages.outgoing_msg_id
                WHERE (outgoing_msg_id = {$outgoing_id} AND incoming_msg_id = {$incoming_id}) 
                OR (outgoing_msg_id = {$incoming_id} AND incoming_msg_id = {$outgoing_id}) 
                ORDER BY msg_id";
    } else {
        // Regular users can see messages with admins and their own messages
        $sql = "SELECT * FROM messages 
                LEFT JOIN users ON users.unique_id = messages.outgoing_msg_id
                WHERE ((outgoing_msg_id = {$outgoing_id} AND incoming_msg_id = {$incoming_id}) 
                OR (outgoing_msg_id = {$incoming_id} AND incoming_msg_id = {$outgoing_id})) 
                AND (users.role = 'admin' OR outgoing_msg_id = {$outgoing_id})
                ORDER BY msg_id";
    }

    $query = mysqli_query($conn, $sql);
    if (mysqli_num_rows($query) > 0) {
        while ($row = mysqli_fetch_assoc($query)) {
            if ($row['outgoing_msg_id'] === $outgoing_id) {
                $output .= '<div class="chat outgoing">
                            <div class="details">
                                <p>' . $row['msg'] . '</p>
                            </div>
                            </div>';
            } else {
                $output .= '<div class="chat incoming">
                            <img src="php/images/' . $row['img'] . '" alt="">
                            <div class="details">
                                <p>' . $row['msg'] . '</p>
                            </div>
                            </div>';
            }
        }
    } else {
        $output .= '<div class="text">No messages are available. Once you send a message, they will appear here.</div>';
    }

    echo $output;
} else {
    header("location: ../login.php");
}
?>
