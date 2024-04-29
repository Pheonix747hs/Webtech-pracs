-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2024 at 04:42 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wasabi`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(5,2) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `name`, `description`, `price`, `image_url`) VALUES
(1, 'Caesar Salad', 'Fresh romaine lettuce, crunchy croutons, and savory parmesan cheese come together in our classic Caesar salad. Served with our signature Caesar dressing.', 250.00, 'assets/menu0.jpeg'),
(2, 'Chicken and Corn Ramen', 'Experience the rich flavors of our hearty ramen featuring succulent chicken pieces and sweet corn kernels. A comforting and satisfying choice.', 300.00, 'assets/menu4.jpeg'),
(3, 'Tomato Soup', 'Our classic tomato soup is a warm and delightful blend of ripe tomatoes, aromatic herbs, and served with crisp croutons on top. Perfect for a cozy day.', 150.00, 'assets/menu5.jpeg'),
(4, 'Feta Salad', 'Enjoy a refreshing mix of crisp mixed greens topped with creamy feta cheese and drizzled with our balsamic vinaigrette. A delightful salad for a light and tasty meal.', 220.00, 'assets/menu6.jpeg'),
(5, 'Cookies', 'Treat yourself to our selection of assorted cookies, including chocolate chip, oatmeal, and more. Each bite is a perfect balance of sweetness and crunch.', 80.00, 'assets/menu7.jpeg'),
(6, 'Strawberry Crepes', 'Indulge in thin and delicate crepes filled with fresh strawberries, creating a delightful blend of textures and flavors. A sweet option for any time of day.', 200.00, 'assets/menu8.jpeg'),
(7, 'Fruit Toasts', 'Our fruit toasts feature a medley of fresh, seasonal fruits piled high on perfectly toasted bread. A vibrant and tasty choice for a light breakfast or snack.', 180.00, 'assets/menu9.jpeg'),
(8, 'Plum Cake with Strawberries', 'Dive into the moist goodness of our plum cake, generously garnished with fresh strawberries. A delightful dessert to satisfy your sweet tooth.', 280.00, 'assets/menu10.jpeg'),
(9, 'Peach Iced Tea', 'Quench your thirst with our refreshing iced tea infused with the sweet and mellow flavor of juicy peaches. A cool and revitalizing beverage.', 120.00, 'assets/menu11.jpeg'),
(10, 'Strawberry Cheesecake', 'Experience pure indulgence with our creamy cheesecake topped with a luscious layer of fresh strawberry compote. A perfect ending to your meal.', 250.00, 'assets/menu13.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
