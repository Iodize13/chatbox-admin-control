<?php
session_start();
if (isset($_SESSION['unique_id'])) {
    include_once "config.php";
    $outgoing_id = $_SESSION['unique_id'];

    // Get the role of the logged-in user
    $role_query = mysqli_query($conn, "SELECT role FROM users WHERE unique_id = {$outgoing_id}");
    $user_data = mysqli_fetch_assoc($role_query);
    $role = $user_data['role'];

    // Function to fetch the latest message for a user
    function get_latest_message($conn, $outgoing_id, $user_id) {
        $sql2 = "SELECT * FROM messages WHERE (incoming_msg_id = {$user_id} OR outgoing_msg_id = {$user_id}) 
                AND (outgoing_msg_id = {$outgoing_id} OR incoming_msg_id = {$outgoing_id}) ORDER BY msg_id DESC LIMIT 1";
        $query2 = mysqli_query($conn, $sql2);
        $row2 = mysqli_fetch_assoc($query2);
        if (mysqli_num_rows($query2) > 0) {
            $result = $row2['msg'];
        } else {
            $result = "No message available";
        }
    	// Use mb_substr for multi-byte character support (Thai, Chinese, Japanese, etc.)
    	return (mb_strlen($result, 'UTF-8') > 28) ? mb_substr($result, 0, 28, 'UTF-8') . '...' : $result;
    }

    // Display chats based on role
    $output = '';
    if ($role === 'admin') {
        $query = mysqli_query($conn, "SELECT * FROM users WHERE role != 'admin'");
        while($row = mysqli_fetch_assoc($query)) {
            $msg = get_latest_message($conn, $outgoing_id, $row['unique_id']);
            $you = (isset($row2['outgoing_msg_id']) && $outgoing_id == $row2['outgoing_msg_id']) ? "You: " : "";
            $offline = ($row['status'] == "Offline now") ? "offline" : "";
            $hid_me = ($outgoing_id == $row['unique_id']) ? "hide" : "";

            $output .= '<a href="chat.php?user_id='. $row['unique_id'] .'">
                        <div class="content">
                            <img src="php/images/'. htmlspecialchars($row['img']) .'" alt="">
                            <div class="details">
                                <span>'. htmlspecialchars($row['fname']) . " " . htmlspecialchars($row['lname']) .'</span>
                                <p>'. $you . htmlspecialchars($msg) .'</p>
                            </div>
                        </div>
                        <div class="status-dot '. $offline .'"><i class="fas fa-circle"></i></div>
                    </a>';
        }
    } else {
        $query = mysqli_query($conn, "SELECT * FROM users WHERE role = 'admin'");
        while($row = mysqli_fetch_assoc($query)) {
            $msg = get_latest_message($conn, $outgoing_id, $row['unique_id']);
            $you = (isset($row2['outgoing_msg_id']) && $outgoing_id == $row2['outgoing_msg_id']) ? "You: " : "";
            $offline = ($row['status'] == "Offline now") ? "offline" : "";
            $hid_me = ($outgoing_id == $row['unique_id']) ? "hide" : "";

            $output .= '<a href="chat.php?user_id='. $row['unique_id'] .'">
                        <div class="content">
                            <img src="php/images/'. htmlspecialchars($row['img']) .'" alt="">
                            <div class="details">
                                <span>'. htmlspecialchars($row['fname']) . " " . htmlspecialchars($row['lname']) .'</span>
                                <p>'. $you . htmlspecialchars($msg) .'</p>
                            </div>
                        </div>
                        <div class="status-dot '. $offline .'"><i class="fas fa-circle"></i></div>
                    </a>';
        }
    }
} else {
    header("location: ../login.php");
}
?>
