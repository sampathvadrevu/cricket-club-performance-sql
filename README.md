# Player Performance & Team Selection Analysis – Season 4

SQL-based cricket player performance and team selection analysis.

---

## Overview
This project analyzes season-level cricket player performance data using SQL to
support objective, data-driven team selection decisions.

The analysis evaluates batting efficiency, bowling efficiency, all-rounder
contribution, and overall player value, with fair comparisons made within
player roles.

---

## Business Problem
A cricket club wants to evaluate player performance for Season 4 in order to:
- Identify top-performing batters, bowlers, and all-rounders
- Compare players fairly within their respective roles
- Support data-driven team selection and incentive decisions
- Gain structured insights from season-level aggregated statistics

---

## Dataset
The dataset consists of season-level aggregated cricket statistics and includes:
- Player master data (player role, opt-in status)
- Batting performance metrics
- Bowling performance metrics
- Fielding contribution metrics

The data is structured to reflect real-world sports analytics use cases while
remaining suitable for SQL-based analysis.

---

## Project Structure

The project follows a simple and clear SQL analytics workflow:

- **01_schema.sql** – Database schema definition  
- **02_data_insertion.sql** – Initial season-level data insertion  
- **03_player_performance_analysis.sql** – Business-driven performance analysis  
- **04_post_match_stat_update.sql** – Template for incremental post-match stat updates  
- **README.md** – Project documentation  

---

## File Descriptions

### `01_schema.sql`
Defines the database schema, including:
- Player master table
- Batting statistics table
- Bowling statistics table
- Fielding statistics table

This file establishes the structural foundation required for all analysis.

---

### `02_data_insertion.sql`
Populates the database tables with initial season-level aggregated player statistics.

Includes:
- Player information
- Batting performance data
- Bowling performance data
- Fielding contribution data

This script is intended to be run once during initial setup.

---

### `03_player_performance_analysis.sql`
Contains the complete business-driven SQL analysis, including:
- Baseline player dataset
- Batting efficiency analysis (runs per innings)
- Bowling efficiency analysis (wickets per innings)
- Identification of impactful all-rounders
- Overall player value calculation
- Role-based player ranking using window functions

This file represents the core analytical logic of the project.

---

### `04_post_match_stat_update.sql`
Provides a **transactional update template** for incrementally updating
season-level player statistics after each match.

Key characteristics:
- One match is handled within a single transaction
- Only players who participated in the match are updated
- Only relevant stats (batting, bowling, fielding) are incremented
- Derived metrics are intentionally excluded from manual updates

This file is designed as a reusable reference script and is executed
only when post-match updates are required.

---

## Execution Order
To reproduce the analysis from scratch, execute the SQL files in the following order:
1. `01_schema.sql`
2. `02_data_insertion.sql`
3. `03_player_performance_analysis.sql`

`04_post_match_stat_update.sql` is executed **only after matches are played**
to incrementally update season statistics.

---

## SQL Concepts Used
- INNER and LEFT JOINs
- Common Table Expressions (CTEs)
- Window Functions (`DENSE_RANK`)
- Derived metrics and calculations
- NULL handling and safe arithmetic operations
- Role-based partitioning for fair comparison
- Transactions (`BEGIN TRANSACTION`, `COMMIT`, `ROLLBACK`)

---

## Tableau Dashboard (Visualization Layer)

The insights from the SQL-based cricket performance analysis are visualized using Tableau Public.

**Dashboard Highlights:**
- Batting efficiency (Runs per Innings)
- Bowling efficiency (Wickets per Innings)
- Fielding impact (Total Dismissals)
- Key performance indicators (KPIs):
  - Highest individual score
  - Highest wickets taken
  - Most hundreds
  - Most five-wicket hauls
- Role-based filtering (Batsman, Bowler, All-Rounder)

🔗 **Tableau Public Dashboard Link:**  
https://public.tableau.com/views/CricketClubPerformanceAnalysis/Dashboard1


---


## Tools
- SQL Server
- VS Code
- Tableau Public


---

## Author
Sai Sampath Vadrevu
