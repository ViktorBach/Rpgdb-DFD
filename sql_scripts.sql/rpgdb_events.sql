USE rpgdb;

-- Event (Make sure event scheduler is enabled
-- SET GLOBAL event_scheduler = ON;


-- Reset daily quests
CREATE EVENT IF NOT EXISTS reset_daily_quests
ON SCHEDULE EVERY 1 DAY
DO
  DELETE FROM character_has_quest;
