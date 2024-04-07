<?php

require_once('connect.php');

$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
  $sql = "SELECT * FROM todos WHERE id = $id";
  $result = mysqli_query($conn, $sql);

  if (mysqli_num_rows($result) == 1) {
    $todo = mysqli_fetch_assoc($result);
  } else {
    header('Location: index.php');
    exit();
  }
} else if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $task = $_POST['task'];
  $completed = isset($_POST['completed']) ? 1 : 0;

  $sql = "UPDATE todos SET task = '$task', completed = $completed WHERE id = $id";

  if (mysqli_query($conn, $sql)) {
    header('Location: index.php');
  } else {
    echo "Error: Could not update todo";
  }

  mysqli_close($conn);
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Update Todo</title>
</head>
<body>
  <h1>Update Todo</h1>
  <?php if (isset($todo)): ?>
  <form action="" method="post">
    <label for="task">Task:</label>
    <input type="text" name="task" id="task" value="<?php echo $todo['task']; ?>" required>
    <br>
    <label for="completed">Completed:</label>
    <input type="checkbox" name="completed" id="completed" <?php if ($todo['completed']) echo 'checked'; ?>>
    <br>
    <button type="submit">Update Todo</button>
  </form>
  <?php else: ?>
    <p>Todo not found.</p>
  <?php endif; ?>
</body>
</html>
