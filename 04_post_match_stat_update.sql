/* =========================================================
   INCREMENTAL PLAYER STATS UPDATE (POST-MATCH)
   ---------------------------------------------------------
   CONTEXT:
   - This project maintains SEASON-LEVEL cumulative statistics
   - After each match, only players who participated are updated
   - Updates are incremental (total = total + match contribution)
   - There is NO match-level storage in this phase

   IMPORTANT RULES:
   1. Update ONLY the stats relevant to what the player actually did
      (bat / bowl / field)
   2. DO NOT update a table if the player did not perform that activity
   3. DO NOT update derived metrics (averages, strike rates, economy)
   4. Use TRANSACTIONS to avoid partial or inconsistent updates

   HOW TO USE:
   - Uncomment BEGIN TRANSACTION
   - Uncomment ONLY the required UPDATE statements
   - Verify results using SELECT
   - COMMIT if correct, ROLLBACK if not
   ========================================================= */

/*
BEGIN TRANSACTION;
*/

------------------------------------------------------------
-- BATTLING STATS UPDATE
-- Run this ONLY IF the player batted in the match
-- Example: runs, balls, fours, sixes, innings played
-- DO NOT run this block if the player did NOT bat
------------------------------------------------------------
/*
UPDATE Batting_stats
SET
    total_runs     = total_runs + 20,   -- runs scored in the match
    balls_played   = balls_played + 15, -- balls faced in the match
    no_of_innings  = no_of_innings + 1, -- increment only if player batted
    fours_hit      = fours_hit + 2,
    sixs_hit       = sixs_hit + 0,
    not_outs       = not_outs + 0        -- set to 1 if player remained not out
WHERE player_id = 432;                  -- Sampath
*/

------------------------------------------------------------
-- BOWLING STATS UPDATE
-- Run this ONLY IF the player bowled in the match
-- DO NOT run if the player did not bowl
------------------------------------------------------------
/*
UPDATE Bowling_stats
SET
    total_wickets   = total_wickets + 3,   -- wickets taken in the match
    balls_bowled    = balls_bowled + 24,  -- balls bowled
    runs_given      = runs_given + 18,    -- runs conceded
    no_of_innings   = no_of_innings + 1,  -- increment only if player bowled
    dots_bowled     = dots_bowled + 10,
    maidens_bowled  = maidens_bowled + 0
WHERE player_id = 432;
*/

------------------------------------------------------------
-- FIELDING STATS UPDATE
-- Run this ONLY IF the player contributed in the field
-- (catches, run-outs, stumpings, etc.)
------------------------------------------------------------
/*
UPDATE Fielding_stats
SET
    total_dismissals = total_dismissals + 2
WHERE player_id = 432;
*/

------------------------------------------------------------
-- VERIFICATION STEP (RECOMMENDED)
-- Always verify the updated values before committing
------------------------------------------------------------
/*
SELECT * FROM Batting_stats  WHERE player_id = 432;
SELECT * FROM Bowling_stats  WHERE player_id = 432;
SELECT * FROM Fielding_stats WHERE player_id = 432;
*/

------------------------------------------------------------
-- FINAL STEP
-- COMMIT if everything looks correct
-- ROLLBACK if any update is incorrect
------------------------------------------------------------
/*
COMMIT;
-- ROLLBACK;
*/

------------------------------------------------------------
-- NOTE:
-- A transaction does NOT require all three updates.
-- It safely groups ONLY the updates that are executed.
-- If a player only bowled, only the bowling (and fielding)
-- updates should be run inside the transaction.
------------------------------------------------------------


--============================================================================================================================


/* =========================================================
   EXAMPLE: MATCH UPDATE (REFERENCE ONLY – DO NOT RUN AS IS)
   ---------------------------------------------------------
   MATCH SCENARIO:
   Players who participated in the match:
   - Sampath (432): Bowled and fielded
   - Prudhvi (424): Batted and fielded
   - Raghu   (429): Bowled only
   - Sunil   (433): Bowled only

   KEY POINTS:
   - ONE match = ONE transaction
   - ONLY update stats relevant to what each player did
   - Players who did not bat/bowl/field are NOT updated
   - This example demonstrates correct transactional grouping
   ========================================================= */

/*
BEGIN TRANSACTION;
*/

------------------------------------------------------------
-- Sampath (player_id = 432)
-- Bowled and fielded (DID NOT BAT)
------------------------------------------------------------
/*
UPDATE Bowling_stats
SET
    total_wickets = total_wickets + 3,
    balls_bowled  = balls_bowled + 24,
    runs_given    = runs_given + 18,
    no_of_innings = no_of_innings + 1
WHERE player_id = 432;

UPDATE Fielding_stats
SET
    total_dismissals = total_dismissals + 2
WHERE player_id = 432;
*/

------------------------------------------------------------
-- Prudhvi (player_id = 424)
-- Batted and fielded
------------------------------------------------------------
/*
UPDATE Batting_stats
SET
    total_runs    = total_runs + 30,
    balls_played  = balls_played + 20,
    no_of_innings = no_of_innings + 1,
    fours_hit     = fours_hit + 2,
    sixs_hit      = sixs_hit + 1
WHERE player_id = 424;

UPDATE Fielding_stats
SET
    total_dismissals = total_dismissals + 3
WHERE player_id = 424;
*/

------------------------------------------------------------
-- Raghu (player_id = 429)
-- Bowled only
------------------------------------------------------------
/*
UPDATE Bowling_stats
SET
    total_wickets = total_wickets + 5,
    balls_bowled  = balls_bowled + 24,
    runs_given    = runs_given + 30,
    no_of_innings = no_of_innings + 1
WHERE player_id = 429;
*/

------------------------------------------------------------
-- Sunil (player_id = 433)
-- Bowled only
------------------------------------------------------------
/*
UPDATE Bowling_stats
SET
    total_wickets = total_wickets + 3,
    balls_bowled  = balls_bowled + 24,
    runs_given    = runs_given + 20,
    no_of_innings = no_of_innings + 1
WHERE player_id = 433;
*/

------------------------------------------------------------
-- FINAL STEP
-- COMMIT if all updates are correct
-- ROLLBACK if any issue is identified
------------------------------------------------------------
/*
COMMIT;
-- ROLLBACK;
*/

------------------------------------------------------------
-- NOTE:
-- This example is provided for clarity and learning.
-- Actual match updates should be carefully adjusted
-- based on real match statistics.
------------------------------------------------------------
