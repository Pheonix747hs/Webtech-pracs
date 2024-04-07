<?php

require_once('connect.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $task = $_POST['task'];
  $sql = "INSERT INTO todos (task) VALUES ('$task')";

  if (mysqli_query($conn, $sql)) {
    header('Location: index.php');
  } else {
    echo "Error: Could not add todo";
  }

  mysqli_close($conn);
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Todo</title>
</head>
<body>
  <h1>Add New Todo</h1>
  <form action="" method="post">
    <label for="task">Task:</label>
    <input type="text" name="task" id="task" required>
    <br>
    <button type="submit">Add Todo</button>
  </form>
</body>
</html>
