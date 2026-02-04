-- Using Project DataBase
CREATE DATABASE Sunils11_Season4;
Go
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