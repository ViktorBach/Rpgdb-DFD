
-- Stored Procedures

-- Procedure 1 - Leveling up a character
DELIMITER //

CREATE PROCEDURE LevelUpCharacter(IN p_character_id INT)
BEGIN
    UPDATE `character`
    SET 
        level = level + 1,
        hp = hp + 50,
        mana = mana + 25
    WHERE id = p_character_id;
END //

DELIMITER ;

CALL LevelUpCharacter(1);


-- Procedure 2 - Add item to characters inventory
DELIMITER //

CREATE PROCEDURE AddItemToInventory(IN p_character_id INT, IN p_item_id INT)
BEGIN
    DECLARE v_inventory_id INT;

    SELECT inventory_id INTO v_inventory_id
    FROM `character`
    WHERE id = p_character_id;

    INSERT INTO inventory_has_item (inventory_id, item_id)
    VALUES (v_inventory_id, p_item_id);
END //

DELIMITER ;

CALL AddItemToInventory(1, 3);


SHOW PROCEDURE STATUS WHERE Db = 'rpg_database';


-- DROP PROCEDURE IF EXISTS LevelUpCharacter