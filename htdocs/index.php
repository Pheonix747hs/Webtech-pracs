<?php

require_once('connect.php');

$sql = "SELECT * FROM todos";
$result = mysqli_query($conn, $sql);

$todos = array();

if (mysqli_num_rows($result) > 0) {
  while ($row = mysqli_fetch_assoc($result)) {
    $todos[] = $row;
  }
}

mysqli_close($conn);

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Todo List</title>
  <style>
    table {
      border-collapse: collapse;
      width: 100%;
    }
    th, td {
      padding: 8px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    tr:hover {background-color: #f2f2f2;}
  </style>
</head>
<body>
  <h1>Todo List</h1>
  <table>
    <thead>
      <tr>
        <th>Task</th>
        <th>Status</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($todos as $todo): ?>
        <tr>
          <td><?php echo $todo['task']; ?></td>
          <td>
            <?php if ($todo['completed']): ?>
              Completed
            <?php else: ?>
              Pending
            <?php endif; ?>
          </td>
          <td>
            <a href="update.php?id=<?php echo $todo['id']; ?>">Edit</a>
            <a href="delete.php?id=<?php echo $todo['id']; ?>" onclick="return confirm('Are you sure you want to delete this todo?')">Delete</a>
          </td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
  <a href="create.php">Add New Todo</a>
</body>
</html>
