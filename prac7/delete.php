<?php

require_once('connect.php');

$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
  $sql = "DELETE FROM todos WHERE id = $id";

  if (mysqli_query($conn, $sql)) {
    header('Location: index.php');
  } else {
    echo "Error: Could not delete todo";
  }

  mysqli_close($conn);
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Delete Todo</title>
</head>
<body>
  <h1>Delete Todo</h1>
  <?php if ($id): ?>
    <p>Are you sure you want to delete this todo?</p>
    <a href="?id=<?php echo $id; ?>&confirm=1">Yes</a>
    <a href="index.php">No</a>
  <?php else: ?>
    <p>Todo not found.</p>
  <?php endif; ?>

  <?php
  if (isset($_GET['confirm'])) {
    $sql = "DELETE FROM todos WHERE id = $id";
    mysqli_query($conn, $sql);
    header('Location: index.php');
    exit();
  }
  ?>
</body>
</html>
