CREATE VIEW bi_table AS
SELECT transactions.TransactionID, accounts.AccountName, categories.CategoryName, transactions.Description, transactions.Amount, transactions.TransactionDate
FROM ((transactions
INNER JOIN categories ON transactions.CategoryID=categories.CategoryID)
INNER JOIN accounts ON transactions.UserID=accounts.UserID)
ORDER BY transactions.TransactionID;