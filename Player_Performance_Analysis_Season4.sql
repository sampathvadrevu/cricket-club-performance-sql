-- Using Project DataBase
USE Sunils11_Season4;
GO

--- Creating the Players_info Table
CREATE TABLE Players_info (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(50),
    player_role VARCHAR(50),
    player_opt VARCHAR(5)
);

--- Creating the Fielding_stats Table
CREATE TABLE Fielding_stats (
    player_id INT,
    total_dismissals INT
);

--- Creating the Batting_stats Table
CREATE TABLE Batting_stats(
    player_id INT,
    total_runs INT,
    balls_played INT,
    no_of_innings INT,
    not_outs INT,
    hundreds_scored INT,
    fifties_scored INT,
    sixs_hit INT,
    fours_hit INT,
    high_score INT
);

--- Creating the Bowling_stats Table
CREATE TABLE Bowling_stats(
    player_id INT,
    total_wickets INT,
    balls_bowled INT,
    runs_given INT,
    no_of_innings INT,
    five_wicket_haul INT,
    three_wicket_haul INT,
    dots_bowled INT,
    maidens_bowled INT,
    highest_wickets INT
);

--- Inserting data into Players_info Table
INSERT INTO Players_info
VALUES
(401,'Deepak', 'Batsmen', 'Yes'),
(402,'Rajeev','Batsmen','No'),
(403,'Rahul','Batsmen','No'),
(404,'Munesh','Batsmen','No'),
(405,'Pavan','Batsmen','No'),
(406,'Akash','Batsmen','No'),
(407,'Chandu','Batsmen','Yes'),
(408,'Jaspal','Batsmen','No'),
(409,'Abhinav','Batsmen','Yes'),
(410,'Jayakumar','Batsmen','No'),
(411,'Pranay','Batsmen','Yes'),
(412,'Dinesh','Batsmen','No'),
(413,'Gangadhar','Batsmen','No'),
(414,'Pandu','Batsmen','Yes'),
(415,'Jagadesh VRO','Batsmen','No'),
(416,'Hari Prasad','Batsmen','No'),
(417,'Naveen','Batsmen','No'),
(418,'Venky CH','Batsmen','Yes'),
(419,'PD','Batsmen','Yes'),
(420,'Ganga Yadav','Batsmen','No'),
(421,'Dasari','Batsmen','No'),
(422,'Santosh M','All-Rounder','No'),
(423,'Mahesh G','All-Rounder','Yes'),
(424,'Prudhvi','All-Rounder','Yes'),
(425,'Rambabu','All-Rounder','No'),
(426,'Prasanna','All-Rounder','No'),
(427,'Gowtham','Bowler','Yes'),
(428,'Arun','Bowler','No'),
(429,'Raghu','Bowler','Yes'),
(430,'Raju','Bowler','Yes'),
(431,'Suresh','Bowler','Yes'),
(432,'Sampath','Bowler','No'),
(433,'Sunil','Bowler','Yes'),
(434,'Santosh P','Bowler','Yes'),
(435,'Achari','Bowler','Yes'),
(436,'Uma','Bowler','No');

--- Inserting Data into Fielding_stats Table
INSERT INTO Fielding_stats
VALUES
(409, 48),
(418, 14),
(425,13),
(401, 12),
(429, 11),
(410, 9),
(423, 9),
(424, 9),
(419, 8),
(403, 7),
(430, 7),
(431, 7),
(432, 7),
(434, 6),
(411, 5),
(422, 5),
(435, 5),
(433, 4),
(402, 3),
(407, 3),
(408, 3),
(406, 2),
(412, 2),
(414, 2),
(417, 2),
(427, 2),
(405, 1),
(413, 1),
(420, 1),
(428, 1);

--- Inserting data into Batting_stats
INSERT INTO Batting_stats
VALUES
(401, 1245, 1096, 19, 2, 4, 6, 18, 160, 211),
(402, 131, 163, 7, 1, 0, 1, 5, 10, 50),
(403, 417, 324, 21, 0, 0, 3, 18, 48, 63),
(404, 402, 341, 21, 0, 0, 2, 22, 41, 100),
(405, 121, 146, 6, 0, 0, 1, 2, 10, 61),
(406, 72, 54, 3, 0, 0, 0, 4, 7, 45),
(407, 935, 914, 29, 1, 1,7, 31, 103, 130),
(408, 42, 71, 3, 1, 0, 0, 0, 5, 16),
(409, 1093, 1395, 28, 7, 2, 8, 6, 102, 132),
(410, 265, 262, 7, 3, 0, 3, 7, 27, 67),
(411, 428, 324, 16, 0, 1, 2, 14, 52, 104),
(412, 53, 59, 2, 0, 0, 0, 1, 8, 38),
(413, 108, 144, 7, 0, 0, 0, 2, 13, 38),
(414, 451, 533, 21, 1, 0, 2, 3, 66, 90),
(415, 19, 11, 1, 0, 0, 0, 1, 2, 19),
(416, 79, 101, 7, 0, 0, 0, 1, 8, 30),
(417, 26, 38, 3, 0, 0, 0, 1, 2, 17),
(418, 221, 343, 19, 0, 0, 1, 3, 25, 54),
(419, 470, 522, 27, 1, 0, 3, 7, 64, 61),
(420, 204, 156, 7, 0, 1, 0, 21, 11, 124),
(421, 13, 13, 1, 0, 0, 0, 0, 3, 13),
(422, 135, 158, 10, 0, 0, 0, 1, 15, 24),
(423, 227, 190, 11, 3, 0, 1, 8, 27, 59),
(424, 201, 228, 16, 5, 0, 0, 1, 15, 32),
(425, 195, 205, 14, 1, 0, 1, 10, 15, 71),
(426, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(427, 63, 103, 8, 1, 0, 0, 0, 5, 22),
(428, 9, 10, 2, 1, 0, 0, 0, 1, 8),
(429, 85, 124, 16, 8, 0, 0, 0, 8, 17),
(430, 184, 291, 25, 6, 0, 0, 0, 21, 37),
(431, 139, 190, 18, 8, 0, 0, 3, 12, 24),
(432, 31, 36, 6, 1, 0, 0, 1, 2, 17),
(433, 81, 72, 7, 2, 0, 0, 1, 11, 34),
(434, 43, 153, 10, 5, 0, 0, 0, 5, 19),
(435, 342, 490, 27, 3, 0, 2, 6, 36, 66),
(436, 26, 32, 4, 0, 0, 0, 1, 4, 22);

--- Inserting data into Bowling_stats
INSERT INTO Bowling_stats
values
(402, 1, 24, 26, 1, 0, 0, 11, 0, 1),
(408, 0, 30, 50, 1, 0, 0, 7, 0, 0),
(411, 1, 18, 15, 1, 0, 0, 10, 0, 1),
(414, 5, 78, 81, 3, 0, 0, 39, 0, 2),
(418, 0, 24, 49, 1, 0, 0, 8, 0, 0),
(420, 0, 18, 21, 2, 0, 0, 3, 0, 0),
(422, 15, 239, 320, 9, 1, 2, 111, 1, 5),
(423, 16, 270, 163, 11, 0, 2, 184, 7, 3),
(424, 34, 731, 779, 27, 0, 4, 425, 3, 3),
(425, 18, 396, 329, 18, 0, 1, 250, 5, 3),
(427, 16, 409, 429, 15, 0, 2, 206, 1, 4),
(428, 5, 214, 248, 7, 0, 0, 115, 0, 2),
(429, 42, 954, 924, 26, 1, 5, 544, 9, 6),
(430, 34, 992, 1202, 33, 0, 5, 476, 1, 4),
(431, 20, 852, 984, 23, 0, 1, 359, 2, 4),
(432, 19, 363, 410, 13, 0, 3, 201, 3, 3),
(433, 44, 1359, 1614, 34, 2, 2, 610, 2, 6),
(434, 53, 1381, 1369, 33, 0, 7, 713, 6, 4),
(435, 31, 1029, 1027, 31, 0, 4, 536, 5, 3),
(436, 10, 270, 293, 6, 0, 1, 119, 0, 4);

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
