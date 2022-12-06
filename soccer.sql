DROP DATABASE IF EXISTS soccer_db;

CREATE DATABASE soccer_db;

\c

CREATE TABLE teams 
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL
);


CREATE TABLE referees 
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start_date TEXT NOT NULL,
    end_date TEXT NOT NULL
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    location TEXT NOT NULL,
    date TEXT NOT NULL,
    start_time TEXT NOT NULL,
    home_team_id INTEGER NOT NULL,
    away_team_id INTEGER NOT NULL,
    season_id INTEGER NOT NULL UNIQUE,
    head_referee_id INTEGER NOT NULL,
    assistant_referee_1_id INTEGER NOT NULL,
    assistant_referee_2_id INTEGER NOT NULL,
    FOREIGN KEY (home_team_id, away_team_id) REFERENCES teams (id),
    FOREIGN KEY (season_id) REFERENCES seasons (id),
    FOREIGN KEY (head_referee_id, assistant_referee_1_id, assistant_referee_2_id) REFERENCES referees (id),
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    birthday TEXT NOT NULL,
    height TEXT NOT NULL,
    current_team_id INTEGER NOT NULL,
    FOREIGN KEY (current_team_id) REFERENCES teams (id)
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER NOT NULL,
    match_id INTEGER NOT NULL,
    FOREIGN KEY (player_id) REFERENCES players (id),
    FOREIGN KEY (match_id) REFERENCES matches (id)
);

CREATE TABLE lineups
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER NOT NULL,
    match_id INTEGER NOT NULL,
    team_id INTEGER NOT NULL,
    FOREIGN KEY (team_id) REFERENCES teams (id),
    FOREIGN KEY (player_id) REFERENCES players (id),
    FOREIGN KEY (match_id) REFERENCES matches (id)
);

CREATE TABLE results
(
    id SERIAL PRIMARY KEY,
    match_id INTEGER NOT NULL,
    team_id INTEGER NOT NULL,
    FOREIGN KEY (match_id) REFERENCES matches (id),
    FOREIGN KEY (team_id) REFERENCES teams (id)
);