<?php
  // Capture form data submitted from the HTML form
  $name = $_POST['name'];
  $email = $_POST['email'];
  $guests = $_POST['guests'];
  $timeSlot = $_POST['timeSlot'];
  $phoneNumber = $_POST['phoneNumber'];

  // Email configuration (replace with your details)
  $recipientEmail = 'ojasvinborawke@gmail.com';
  $subject = 'Wasabi Table Booking Confirmation';

  // Construct email body message
  $body = "You have a new table booking at Wasabi!\n\n";
  $body .= "Name: $name\n";
  $body .= "Email: $email\n";
  $body .= "Phone Number: $phoneNumber\n";
  $body .= "Number of Guests: $guests\n";
  $body .= "Selected Time Slot: $timeSlot\n\n";
  $body .= "Please respond to this email to confirm your booking.\n";

  // Email headers
  $headers = "From: Wasabi Restaurant <noreply@wasabi.com>\n";
  $headers .= "Reply-To: $email\n";
  $headers .= "Content-Type: text/plain; charset=UTF-8\n";

  // Send email using PHP mail function
  if (mail($recipientEmail, $subject, $body, $headers)) {
    echo 'Your form has been submitted successfully! We will confirm your booking via email.';
  } else {
    echo 'There was an error sending the email. Please try again later.';
  }
?>
