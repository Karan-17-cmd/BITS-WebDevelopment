CREATE DATABASE feedback_platform;

USE feedback_platform;

-- Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    password_hash VARCHAR(255),
    role ENUM('host', 'participant'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Events Table
CREATE TABLE events (
    id INT AUTO_INCREMENT PRIMARY KEY,
    host_id INT,
    name VARCHAR(255),
    date DATE,
    time TIME,
    location VARCHAR(255),
    description TEXT,
    FOREIGN KEY (host_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Threads Table
CREATE TABLE threads (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT,
    title VARCHAR(255),
    FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE
);

-- Feedback Table
CREATE TABLE feedback (
    id INT AUTO_INCREMENT PRIMARY KEY,
    thread_id INT,
    user_id INT NULL,
    content TEXT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    anonymous BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (thread_id) REFERENCES threads(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);
7