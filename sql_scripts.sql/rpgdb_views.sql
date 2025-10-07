USE rpgdb;

-- View

-- Show player overview
CREATE VIEW v_player_overview AS
SELECT 
    u.username,
    c.character_name,
    c.level,
    g.guild_name
FROM user u
JOIN `character` c ON u.id = c.user_id
JOIN guild g ON c.guild_id = g.id;
