# Badminton League – Ruby on Rails Application

A simple Ruby on Rails web application to manage a badminton league.
It allows users to manage players, record match results with scores, and view a leaderboard ranked by wins.

## Demo Video

[Demo Video](./simplescreenrecorder-2025-12-23_17.25.09.mkv)


## Features
### Core Features

- Add and remove players
- Record matches between players
- Store match scores (winner & loser)
- Automatically track wins and losses
- Display leaderboard sorted by wins

## Tech Stack

- Ruby 3.4.3
- Rails 8.1.1
- HTML / ERB – Views


## Setup Instructions

1. Clone Repository

```bash
git clone https://github.com/your-username/badminton_league.git
cd badminton_league
```

2. Install dependencies

``` bash
bundle install
```


3. Setup database

``` bash
rails db:create
rails db:migrate

```


4. Run the Rails server

``` bash
rails s
```
Open http://localhost:3000 in your browser.



## Testing 

RSpec is used for testing models and requests.

```bash 
bundle exec rspec 
or 
bundle exec rspec --format documentation
```

### Rspec Results 

```bash


LeaderboardController
  GET #index
    returns a successful response
    assigns @players sorted by wins descending
    includes wins_count in the player records

MatchesController
  GET #new
    renders new match page
  POST #create
    creates a match with valid data
    does not create match when players are same

PlayersController
  GET #index
    returns success
  POST #create
    creates a player
    does not create invalid player
  DELETE #destroy
    deletes player

Match
  validations
    is valid with valid attributes
    is invalid without scores
    is invalid with negative scores
  players must be different
    is invalid when winner and loser are the same
  winner score validation
    is invalid when winner score is equal to loser score
    is invalid when winner score is less than loser score
    is valid when winner score is higher
    skips validation when scores are nil

Player
  validations
    is valid with name and email
    is invalid without a name
    is invalid without an email
    is invalid with duplicate name
    is invalid with duplicate email
  #wins_count
    returns correct number of wins
    returns zero if no wins
  #losses_count
    returns correct number of losses
    returns zero if no losses
```
