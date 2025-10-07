USE rpgdb;

-- Trigger

-- Automatically log a new transaction
-- Create a log table first
CREATE TABLE IF NOT EXISTS transaction_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    transaction_id INT,
    log_message VARCHAR(255),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER after_transaction_insert
AFTER INSERT ON `transaction`
FOR EACH ROW
BEGIN
    INSERT INTO transaction_log (user_id, transaction_id, log_message)
    VALUES (NEW.user_id, NEW.id, CONCAT('User ', NEW.user_id, ' made a purchase.'));
END //

DELIMITER ;


