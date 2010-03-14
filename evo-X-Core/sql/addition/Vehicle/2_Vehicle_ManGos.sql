REPLACE INTO `vehicle_data` VALUES
(68, 24, 52435, 52576, 52588, 0, 0, 0, 0, 0, 0, 0, 0),
(106, 4, 50896, 0, 50652, 0, 0, 0, 0, 0, 0, 0, 0),
(116, 5, 51362, 51421, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(117, 4, 50652, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(135, 12, 52362, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(156, 24, 53114, 0, 53110, 0, 0, 0, 0, 0, 0, 0, 0),
(200, 30, 52362, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(210, 166, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(349, 24, 62544, 62575, 62960, 62552, 64077, 62863, 0, 0, 0, 0, 62853);

UPDATE creature_template SET maxhealth = 133525, minhealth = 133525, maxmana = 51360, minmana = 51360 WHERE entry = 28670;
UPDATE creature_template SET maxhealth = 50000, minhealth = 50000 WHERE entry = 28094;
UPDATE creature_template SET maxhealth = 75000, minhealth = 75000 WHERE entry IN (28312, 32627);
UPDATE creature_template SET maxhealth = 50000, minhealth = 50000 WHERE entry IN (28319, 32629);

UPDATE creature_template SET minlevel = 80, maxlevel = 80 WHERE entry IN (28312, 32627, 28319, 32629, 28094, 28670);

UPDATE creature_template SET speed = 2, InhabitType = 1 WHERE entry IN (28312, 32627, 28319, 32629, 28094, 29929, 28782);
UPDATE creature_template SET speed = 2.4, InhabitType = 3 WHERE entry IN (28670);
UPDATE creature_template SET mechanic_immune_mask = 652951551 WHERE entry IN (28670,28312,32627,28319,32629,28094,29929,28782);

DELETE FROM npc_spellclick_spells WHERE npc_entry in (28670, 28312, 32629, 28319, 32627, 28094, 29929);
INSERT INTO npc_spellclick_spells VALUES (28670, 52196, 0, 0, 0, 0),(28312, 60968, 0, 0, 0, 1),(32627, 60968, 0, 0, 0, 1),
(28319, 60968, 0, 0, 0, 1),(32629, 60968, 0, 0, 0, 1),(28094, 60968, 0, 0, 0, 1),(29929, 58961, 0, 0, 0, 1);

DELETE FROM creature_template_addon WHERE entry in (28670, 28312, 32629, 28319, 32627, 28094, 29929);
INSERT INTO creature_template_addon VALUES (28670, 0, 50331648, 1, 0, 1024, 156, NULL, '53112 0 53112 1'),
(28312, 0, 0, 0, 0, 0, 117, '28319 7', NULL),(32627, 0, 0, 0, 0, 0, 117, '32629 7', NULL),(28319, 0, 0, 0, 0, 0, 116, NULL, NULL),
(32629, 0, 0, 0, 0, 0, 116, NULL, NULL),(28094, 0, 0, 0, 0, 0, 106, NULL, NULL),(29929, 0, 0, 0, 0, 0, 210, NULL, NULL);

DELETE FROM vehicle_seat_data WHERE seat in (1643, 1648, 1649, 1650, 1652, 1554, 1556, 1557, 1986, 1987, 2144, 2181, 2182);
INSERT INTO vehicle_seat_data VALUES (1643, 3),(1648, 3),(1649, 2),(1650, 2),(1652, 4),
(1554, 3),(1556, 6),(1557, 6),(1986, 3),(1987, 8),(2144, 1),(2181, 1),(2182, 0);

/* Some quests
Argent tournament*/
UPDATE creature_template SET speed = '1.5', unit_flags = 8 WHERE entry IN (33842, 33843);
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id IN (33842, 33843));
DELETE FROM creature WHERE id IN (33844, 33845);
DELETE FROM vehicle_data WHERE entry = 349;
INSERT INTO `vehicle_data` VALUES (349, 24, 62544, 62575, 62960, 62552, 64077, 62863, 0, 0, 0, 0, 62853);
DELETE FROM vehicle_seat_data WHERE seat = 3129;
INSERT INTO `vehicle_seat_data` VALUES (3129, 1);
DELETE FROM npc_spellclick_spells WHERE npc_entry in (33842, 33843);
INSERT INTO `npc_spellclick_spells` VALUES (33842, 63791, 13829, 1, 0, 3),(33842, 63791, 13839, 1, 0, 3),
(33842, 63791, 13838, 1, 0, 3),(33843, 63792, 13828, 1, 0, 3),(33843, 63792, 13837, 1, 0, 3),(33843, 63792, 13835, 1, 0, 3);
DELETE FROM creature_template_addon WHERE entry IN (33842, 33843);
INSERT INTO creature_template_addon VALUES (33842, 0, 0, 2049, 0, 0, 349, '', ''),(33843, 0, 0, 2049, 0, 0, 349, '', '');
UPDATE `creature_template_addon` SET `auras` = '' WHERE `entry` = 33243;
UPDATE `creature_addon` SET `auras` = '' WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (33243));
UPDATE quest_template SET ReqCreatureOrGOId2 = 33272, ReqCreatureOrGOCount2 = 2, ReqSpellCast2 = 62960 WHERE entry IN (13837, 13839);
UPDATE quest_template SET ReqCreatureOrGOId2 = 33243, ReqCreatureOrGOCount2 = 2, ReqSpellCast2 = 62575 WHERE entry IN (13835, 13838);
UPDATE quest_template SET ReqCreatureOrGOId2 = 33229, ReqCreatureOrGOCount2 = 5, ReqSpellCast2 = 62544 WHERE entry IN (13828, 13829);

/*Quest Into the Realm of Shadows (12687)*/
UPDATE creature_template SET faction_A = 2082, faction_H = 2082, unit_flags = 0 WHERE entry = 28782;
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id = 28782);
DELETE FROM vehicle_data WHERE entry = 135;
INSERT INTO vehicle_data VALUES (135, 12, 52362, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM vehicle_seat_data WHERE seat = 1871;
INSERT INTO vehicle_seat_data VALUES (1871, 1);
DELETE FROM npc_spellclick_spells WHERE npc_entry in (28782);
INSERT INTO npc_spellclick_spells VALUES (28782, 52350, 12687, 1, 12687, 3);
DELETE FROM creature_template_addon WHERE entry IN (28782);
INSERT INTO creature_template_addon VALUES (28782, 0, 0, 1, 0, 0, 135, '', '');

/*Quest Grand Theft Palomino (12680)*/
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id IN (28605, 28606, 28607));
DELETE FROM spell_script_target WHERE entry = 52264;
INSERT INTO spell_script_target VALUES (52264, 1, 28653);
DELETE FROM vehicle_data WHERE entry = 123;
INSERT INTO vehicle_data VALUES (123, 12, 52264, 52268, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM vehicle_seat_data WHERE seat = 1782;
INSERT INTO vehicle_seat_data VALUES (1782, 1);
DELETE FROM npc_spellclick_spells WHERE npc_entry in (28605, 28606, 28607);
INSERT INTO npc_spellclick_spells VALUES (28605, 52263, 12680, 1, 12680, 3),(28606, 52263, 12680, 1, 12680, 3),(28607, 52263, 12680, 1, 12680, 3);
DELETE FROM creature_template_addon WHERE entry IN (28605, 28606, 28607);
INSERT INTO creature_template_addon VALUES (28605, 0, 0, 1, 0, 0, 123, '', ''),(28606, 0, 0, 1, 0, 0, 123, '', ''),(28607, 0, 0, 1, 0, 0, 123, '', '');

/*Quest Going Bearback*/
DELETE FROM npc_spellclick_spells WHERE npc_entry in (29598);
INSERT INTO npc_spellclick_spells VALUES (29598, 54908, 12851, 1, 12851, 1);
DELETE FROM creature_template_addon WHERE entry = 29598;
INSERT INTO creature_template_addon VALUES (29598, 0, 0, 1, 0, 0, 308, '', '');
DELETE FROM vehicle_data WHERE entry = 308;
INSERT INTO `vehicle_data` VALUES (308, 24, 54897, 54907, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (2699, 3);

/*Massacre At Light's Point*/
UPDATE `creature_template` SET `unit_flags` = 772 WHERE `entry` IN (28833, 28887);
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id IN (28887, 28833));
DELETE FROM vehicle_data WHERE entry = 68;
INSERT INTO `vehicle_data` VALUES (68, 24, 52435, 52576, 52588, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM vehicle_seat_data WHERE seat = 1301;
INSERT INTO `vehicle_seat_data` VALUES (1301, 3);
DELETE FROM npc_spellclick_spells WHERE npc_entry in (28833, 28887);
INSERT INTO `npc_spellclick_spells` VALUES (28833, 52447, 12701, 1, 12701, 1),(28887, 52447, 12701, 1, 12701, 1);
DELETE FROM creature_template_addon WHERE entry IN (28887, 28833);
INSERT INTO creature_template_addon VALUES (28887, 0, 0, 2049, 0, 0, 68, '', ''),(28833, 0, 0, 2049, 0, 0, 68, '', '');


DELETE FROM npc_spellclick_spells WHERE npc_entry in (32633, 32640, 31857, 33062, 33109, 33060);
/*Traveler's Tundra Mammoth */
REPLACE INTO npc_spellclick_spells VALUES (32633, 61424, 0, 0, 0, 0),(32640, 61424, 0, 0, 0, 0);
REPLACE INTO creature_template_addon VALUES (32633, 0, 0, 0, 0, 0, 312, NULL, NULL),(32640, 0, 0, 0, 0, 0, 312, NULL, NULL);
REPLACE INTO vehicle_data VALUES (312, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

/* Grand Ice Mammoth */
REPLACE INTO npc_spellclick_spells VALUES (31857, 61424, 0, 0, 0, 0);
REPLACE INTO creature_template_addon VALUES (31857, 0, 0, 0, 0, 0, 312, NULL, NULL);
REPLACE INTO vehicle_seat_data VALUES (2764, 3),(2765, 2);

/* Salvaged Chopper */
REPLACE INTO npc_spellclick_spells VALUES (33062, 52196, 0, 0, 0, 0);
REPLACE INTO creature_template_addon VALUES (33062, 0, 0, 0, 0, 0, 335, NULL, NULL);
REPLACE INTO vehicle_data VALUES (335, 12, 62974, 62286, 62299, 64660, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (3005, 3),(3004, 2);

/* Salvaged Demolisher */
REPLACE INTO npc_spellclick_spells VALUES (33109, 52196, 0, 0, 0, 0);
REPLACE INTO creature_template_addon VALUES (33109, 0, 0, 0, 0, 0, 338, NULL, NULL);
REPLACE INTO vehicle_data VALUES (338, 12, 62306, 62490, 62308, 62324, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (3011, 1);

/* Salvaged Siege Engine */
REPLACE INTO npc_spellclick_spells VALUES (33060, 52196, 0, 0, 0, 0);
REPLACE INTO creature_template_addon VALUES (33060, 0, 0, 0, 0, 0, 336, NULL, NULL);
REPLACE INTO vehicle_data VALUES (336, 12, 62345, 62522, 62346, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO vehicle_seat_data VALUES (3006, 1);
UPDATE `creature` SET `spawntimesecs` = 1800 WHERE `id` IN (33109, 33060, 33062);
