<?php
// Connect to MySQL
$conn = new mysqli("localhost", "your_username", "your_password", "feedback_platform");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle Create Event
if ($_POST['action'] == 'create_event') {
    $name = $_POST['eventName'];
    $date = $_POST['eventDate'];
    $time = $_POST['eventTime'];
    $location = $_POST['eventLocation'];
    $desc = $_POST['eventDesc'];

    $query = "INSERT INTO events (name, date, time, location, description, host_id) VALUES ('$name', '$date', '$time', '$location', '$desc', 1)";
    $conn->query($query);
    header("index.html");
}

// Handle Create Thread
if ($_POST['action'] == 'create_thread') {
    $title = $_POST['threadTitle'];
    $eventId = $_POST['eventId'];

    $query = "INSERT INTO threads (title, event_id) VALUES ('$title', '$eventId')";
    $conn->query($query);
    header("event.html?eventId=$eventId");
}

// Handle Submit Feedback
if ($_POST['action'] == 'submit_feedback') {
    $content = $_POST['feedbackContent'];
    $rating = $_POST['rating'];
    $anonymous = isset($_POST['anonymous']) ? 1 : 0;
    $threadId = $_POST['threadId'];

    $query = "INSERT INTO feedback (content, rating, anonymous, thread_id) VALUES ('$content', '$rating', '$anonymous', '$threadId')";
    $conn->query($query);
    header("event.html?eventId=1");
}

$conn->close();
?>
