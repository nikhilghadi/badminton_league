# badminton_league
Basic web application to manage a badminton league
# README

## Design Decisions

- Wins and losses are fetched from matches table to avoid data inconsistency.
- Leaderboard is implemented using a single SQL query to avoid N+1 issue.
- Hotwire (Turbo Frames & Streams) is used instead of custom JavaScript.
- Players cannot be deleted if they have participated in matches.
