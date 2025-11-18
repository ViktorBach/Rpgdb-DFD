

-- List all users and their characters 
SELECT 
    u.username,
    c.character_name,
    c.level,
    c.hp,
    c.mana
FROM rpgdb.user u
JOIN rpgdb.character c ON u.id = c.user_id
ORDER BY u.username;


-- Show each characters inventory content
SELECT 
    c.character_name,
    i.name AS item_name,
    i.type,
    i.rarity,
    i.stats
FROM rpgdb.character c
JOIN rpgdb.inventory_has_item ii ON c.inventory_id = ii.inventory_id
JOIN rpgdb.item i ON ii.item_id = i.id
ORDER BY c.character_name;


-- Display each character and their learned skills
SELECT 
    c.character_name,
    s.name AS skill_name,
    s.description,
    s.damage,
    s.healing
FROM rpgdb.character c
JOIN rpgdb.character_has_skills cs 
    ON c.id = cs.character_id AND c.inventory_id = cs.character_inventory_id
JOIN rpgdb.skills s ON cs.skills_id = s.id
ORDER BY c.character_name;


-- List all guilds and their members
SELECT 
    g.guild_name,
    c.character_name,
    c.level
FROM rpgdb.guild g
LEFT JOIN rpgdb.character c ON g.id = c.guild_id
ORDER BY g.guild_name;


-- Show all quests and which characters are on them
SELECT 
    q.title AS quest_title,
    q.description,
    c.character_name,
    n.name AS quest_giver
FROM rpgdb.quest q
JOIN rpgdb.character_has_quest cq 
    ON q.id = cq.quest_id
JOIN rpgdb.character c 
    ON cq.character_id = c.id AND cq.character_inventory_id = c.inventory_id
JOIN rpgdb.npc n 
    ON q.npc_id = n.id
ORDER BY c.character_name;


-- List all NPC's and the quests they offer
SELECT 
    n.name AS npc_name,
    n.role,
    q.title AS quest_title,
    q.reward_xp,
    q.reward_money
FROM rpgdb.npc n
LEFT JOIN rpgdb.quest q ON n.id = q.npc_id
ORDER BY n.name;

-- Show battle history of each character
SELECT 
    c.character_name,
    b.id AS battle_id,
    b.outcome,
    b.xp,
    b.money
FROM rpgdb.character c
JOIN rpgdb.character_has_battle cb 
    ON c.id = cb.character_id AND c.inventory_id = cb.character_inventory_id
JOIN rpgdb.battle b ON cb.battle_id = b.id
ORDER BY c.character_name;


-- Show user transaction history
SELECT 
    u.username,
    t.id AS transaction_id,
    t.quantity,
    t.cost
FROM rpgdb.user u
JOIN rpgdb.transaction t ON u.id = t.user_id
ORDER BY u.username;


-- Combine everything
SELECT 
    u.username,
    c.character_name,
    g.guild_name,
    s.name AS skill_name,
    q.title AS active_quest,
    i.name AS inventory_item,
    b.outcome AS last_battle
FROM rpgdb.user u
JOIN rpgdb.character c ON u.id = c.user_id
LEFT JOIN rpgdb.guild g ON c.guild_id = g.id
LEFT JOIN rpgdb.character_has_skills cs 
    ON c.id = cs.character_id AND c.inventory_id = cs.character_inventory_id
LEFT JOIN rpgdb.skills s ON cs.skills_id = s.id
LEFT JOIN rpgdb.character_has_quest cq 
    ON c.id = cq.character_id AND c.inventory_id = cq.character_inventory_id
LEFT JOIN rpgdb.quest q ON cq.quest_id = q.id
LEFT JOIN rpgdb.inventory_has_item ii ON c.inventory_id = ii.inventory_id
LEFT JOIN rpgdb.item i ON ii.item_id = i.id
LEFT JOIN rpgdb.character_has_battle cb 
    ON c.id = cb.character_id AND c.inventory_id = cb.character_inventory_id
LEFT JOIN rpgdb.battle b ON cb.battle_id = b.id
ORDER BY u.username, c.character_name;
