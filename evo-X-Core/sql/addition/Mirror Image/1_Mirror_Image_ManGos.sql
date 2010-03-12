-- Mirror Immage Summon

UPDATE creature_template SET speed = 1.5, modelid_A = 11686, modelid_H = 11686, AIName = 'EventAI', ScriptName = '' WHERE entry = 31216;
 
-- -- Mirror Immage EventAI
DELETE FROM creature_ai_scripts WHERE creature_id = 31216;
INSERT INTO creature_ai_scripts VALUES
(3121601,31216,4,0,100,6, 0,0,0,0, 29,10,0,0, 20,0,0,0, 0,0,0,0, 'Mirror Immage - ranged movement when in combat'),
(3121602,31216,0,0,100,7, 1000,2000,4000,5000, 11,59638,1,0, 0,0,0,0, 0,0,0,0, 'Mirror Immage - frostbolt');