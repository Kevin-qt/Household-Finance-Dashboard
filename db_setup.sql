CREATE DATABASE HouseholdFinance;
USE HouseholdFinance;

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255),
    Password VARCHAR(255),
    Email VARCHAR(255)
);

CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(255)
);

CREATE TABLE Accounts (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    AccountName VARCHAR(255),
    Balance DECIMAL(10,2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    CategoryID INT,
    Description VARCHAR(255),
    Amount DECIMAL(12,2),
    TransactionDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);