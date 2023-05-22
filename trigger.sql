-- Trigger for updating Balance column in accounts table

DELIMITER //

CREATE TRIGGER update_balance
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    IF NEW.CategoryID = 1 THEN
        UPDATE accounts
        SET accounts.Balance = accounts.Balance + NEW.Amount
        WHERE accounts.UserID = NEW.UserID;
	ELSE
		UPDATE accounts
        SET accounts.Balance = accounts.Balance - NEW.Amount
        WHERE accounts.UserID = NEW.UserID;
    END IF;
END; //

DELIMITER ;
