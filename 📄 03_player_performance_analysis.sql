/* =========================================================
   BUSINESS PROBLEM:
   Player Performance & Team Selection Analysis – Season 4

   OBJECTIVE:
   Analyze season-level player performance to support
   team selection, role-based comparison, and identification
   of top contributors using batting and bowling metrics.
   ========================================================= */

/* --------------------------------------------------------------------------------
   STEP 1: Player Master Dataset
   Purpose: Establish the baseline player list with role and opt-in status to 
   understand the team composition before analysis.
   ------------------------------------------------------------------------------- */
SELECT
    player_id,
    player_name,
    player_role,
    player_opt
FROM Players_info;

/* -----------------------------------------------------------------------------------------
   STEP 2: Batting Performance Overview
   Purpose: Combine player attributes with batting statistics to evaluate season-level batting 
   contribution in context of role and opt-in participation.
   ------------------------------------------------------------------------------------------ */
SELECT
    i.player_id,
    i.player_name,
    i.player_role,
    i.player_opt,
    bat.total_runs,
    bat.no_of_innings
FROM Players_info i
JOIN Batting_stats bat
    ON i.player_id = bat.player_id;

/* ------------------------------------------------------------------------------------------
   STEP 3: Batting Efficiency Analysis
   Purpose: Identify the most efficient batters based on runs scored per innings, highlighting
   consistency rather than aggregate volume alone.
   ----------------------------------------------------------------------------------------- */
SELECT
    i.player_id,
    i.player_name,
    i.player_role,
    ROUND(CAST(bat.total_runs AS FLOAT) / NULLIF(bat.no_of_innings, 0),2) AS runs_per_innings
FROM Players_info i
JOIN Batting_stats bat
    ON i.player_id = bat.player_id
ORDER BY runs_per_innings DESC;

/* -----------------------------------------------------------------------------------------------
   STEP 4: All-Rounder Impact Identification
   Purpose: Identify players who contribute significantly in both batting and bowling, 
   supporting selection decisions for all-rounder roles.
   ----------------------------------------------------------------------------------------------- */
WITH Player_Performance AS (
    SELECT
        i.player_id,
        i.player_name,
        bat.total_runs,
        bowl.total_wickets
    FROM Players_info i
    JOIN Batting_stats bat
        ON i.player_id = bat.player_id
    JOIN Bowling_stats bowl
        ON i.player_id = bowl.player_id
)
SELECT
    player_name,
    player_id,
    total_runs,
    total_wickets
FROM Player_Performance
WHERE total_runs >= 200
  AND total_wickets >= 8
  ORDER BY total_wickets DESC;

/* --------------------------------------------------------------------------------------------------
   STEP 5: Bowling Efficiency & Role-Based Ranking
   Purpose: Rank bowlers based on wickets taken per innings within their respective roles to 
   identify the most effective bowling contributors.
   --------------------------------------------------------------------------------------------------- */
SELECT
    i.player_name,
    i.player_role,
    Round(CAST(bowl.total_wickets AS FLOAT) / NULLIF(bowl.no_of_innings, 0),2) AS wickets_per_innings,
    DENSE_RANK() OVER (
        PARTITION BY i.player_role
        ORDER BY CAST(bowl.total_wickets AS FLOAT) / NULLIF(bowl.no_of_innings, 0) DESC
    ) AS bowling_role_rank
FROM Players_info i
JOIN Bowling_stats bowl
    ON i.player_id = bowl.player_id;


/* ------------------------------------------------------------------------------------------------------
   FINAL STEP: Overall Player Value & Role-Based Ranking
   Purpose: Combine batting and bowling efficiency metrics to derive an overall contribution score
   and rank players fairly within each role for team selection and performance evaluation.
   ------------------------------------------------------------------------------------------------------ */
WITH Batting_Performance AS (
    SELECT
        i.player_id,
        i.player_name,
        i.player_role,
        CAST(bat.total_runs AS FLOAT) / NULLIF(bat.no_of_innings, 0) AS runs_per_innings
    FROM Players_info i
    JOIN Batting_stats bat
        ON i.player_id = bat.player_id
),
Bowling_Performance AS (
    SELECT
        i.player_id,
        CAST(bowl.total_wickets AS FLOAT) / NULLIF(bowl.no_of_innings, 0) AS wickets_per_innings
    FROM Players_info i
    JOIN Bowling_stats bowl
        ON i.player_id = bowl.player_id
)
SELECT
    b.player_name,
    b.player_role,
    ROUND(b.runs_per_innings, 2) AS runs_per_innings,
    ROUND(ISNULL(w.wickets_per_innings, 0), 2) AS wickets_per_innings,
    ROUND(
        b.runs_per_innings + ISNULL(w.wickets_per_innings, 0),
        2
    ) AS overall_value_score,
    DENSE_RANK() OVER (
        PARTITION BY b.player_role
        ORDER BY b.runs_per_innings + ISNULL(w.wickets_per_innings, 0) DESC
    ) AS role_rank
FROM Batting_Performance b
LEFT JOIN Bowling_Performance w
    ON b.player_id = w.player_id
ORDER BY b.player_role, role_rank;
