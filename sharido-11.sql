-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 27, 2024 at 02:46 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sharido`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`admin_id`, `username`, `password`) VALUES
(1, 'admin', '12345'),
(2, 'admin2', '7272');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(50, 1, 26, 14),
(54, 1, 30, 4),
(55, 1, 43, 5),
(63, 1, 27, 1),
(64, 1, 29, 1),
(65, 1, 31, 1);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `message`, `created_at`) VALUES
(1, 'hridoy', 'hridoymridha246@gmail.com', 'hi\r\n', '2024-11-21 05:35:59'),
(2, 'hridoy', 'hridoymridha246@gmail.com', 'hi how are you products are good\r\n', '2024-11-21 05:39:02'),
(3, 'hridoy', 'hello@gmail.com', 'such a nice product', '2024-11-22 01:47:38'),
(4, 'hridoy', 'hridoymridha246@gmail.com', 'goood', '2024-11-24 05:33:00'),
(5, 'admin', 'hello@gmail.com', 'good job', '2024-11-24 13:21:52'),
(6, 'hriooy', 'hridoymridha246@gmail.com', 'sobi valo', '2024-11-26 04:29:16');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `status` enum('pending','completed','cancelled') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `phone`, `shipping_address`, `product_id`, `quantity`, `total_price`, `order_date`, `status`) VALUES
(1, 1, '', '', '', 26, 8, 16000.00, '2024-11-25 14:36:19', 'pending'),
(2, 1, '', '', '', 27, 3, 1350.00, '2024-11-25 14:36:19', 'pending'),
(3, 1, '', '', '', 28, 1, 1300.00, '2024-11-25 14:36:19', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `name`, `description`, `price`, `image`, `stock`) VALUES
(26, 'Jewelry', 'Handmade Jewelry', 'Elegant pearl jewelry perfect for every occasion.', 2000.00, 'jew1.jpg', 45),
(27, 'Home Decor', 'Traditional Bangali Bucket', 'Beautiful handmade bucket for your plants.', 450.00, 'bu4.jpg', 50),
(28, 'Clothing', 'Traditional Saree', 'Authentic saree to embrace your cultural style.', 1700.00, 'shari2.jpeg', 30),
(29, 'Organic Products', 'Pure Organic Mehedi', 'Organic Mehedi for natural coloring.', 120.00, 'mehedi1.png', 200),
(30, 'Tote Bag', 'Handcrafted Tote Bag', 'Stylish tote bag for your daily needs.', 450.00, 'tote.webp', 80),
(31, 'Jewelry', 'Big Pearl Necklace', 'a touch of beauty', 2300.00, 'jew4.jpg', 10),
(32, 'Clothing', 'New Jamdani', 'new collection!!', 2232.00, 'shari3.jpeg', 8),
(34, 'Clothing', 'Dhakai Saree', 'new new new!!', 4323.00, 'share1.webp', 56),
(35, 'Clothing', 'Jamdani saree', 'new arrival!', 4533.00, 'shari4.jpeg', 5),
(36, 'Jewelry', 'Pearl Bracelets', 'new collection!!', 4533.00, 'jew5.jpg', 7),
(37, 'Clothing', 'Silk Saree', 'ne offer!!', 3242.00, 'shari6.jpeg', 4),
(38, 'Home decor', 'HandMade Bucket', 'new in market!!', 456.00, 'bu5.jpg', 5),
(39, 'Home decor', 'Traditional Bucket', 'new new new!!!', 522.00, 'bu1.jpg', 3),
(40, 'Tote Bag', 'New design  tote bags', 'new new new', 450.00, 'tote4.jpeg', 8),
(41, 'Organic Products', 'Othentic Mehedi', 'new in market!!!', 80.00, 'mehedi2.jpg', 5),
(42, 'Jewelry', 'Necklace With exclusive Pearl', 'New collections!!', 2000.00, 'jew3.jpg', 5),
(43, 'Tote Bag', 'New in Town', 'New collection', 500.00, 'tote3.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT 'default-profile.png',
  `joined_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `address`, `profile_picture`, `joined_date`) VALUES
(1, 'Hridoy', 'hridoymridha246@gmail.com', '$2y$10$Wdt2EgEYOGaw6lXJ2Iim4u2ParJrMc2Md0U0YZg6DCf9GirA14v8.', '01706727260', 'bashundhara,dhaka', 'default-profile.png', '2024-11-21 08:30:56'),
(2, 'Hridoy', 'hridoyhs369@gamil.com', '$2y$10$LA5YEqaS/SgODdSEihN0LuYfGa.3HB58JryfURjXkBes5N2.V6yB6', NULL, NULL, 'default-profile.png', '2024-11-21 08:55:37'),
(3, 'Hridoy', 'hr@gmail.com', '$2y$10$rlVKGQok5SbMTFHzvZmXHuC55/Tt3pASUAHIpCb6WTfD.owzqYF1m', NULL, NULL, 'default-profile.png', '2024-11-21 08:57:38'),
(4, 'Hridoy', 'hridoy@gmail.com', '$2y$10$RTW5FevMjIq5KcUvvcQDk.uHgkTRVRWY3bAnqFtRHcUJJLe58zDF6', NULL, NULL, 'default-profile.png', '2024-11-21 11:21:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `address` (`address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
