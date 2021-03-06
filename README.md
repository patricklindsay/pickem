# World Cup 2018 - Pick em!

This application allows a user to pick what they think the score was for any World Cup 2018 match. Each time they pick right they earn points.

Demo Application - https://pickem-worldcup.herokuapp.com/

## Installation

1. Run `bundle install`
2. Run `yarn install`
3. Run `rails db:setup`
4. Start the server (`rails s`) and visit your localhost (`http://localhost:3000`)
5. Win!

## Features
* Imports & stores all teams, stadiums & matches from the 2018 World Cup (using included JSON files)
* Autogenerates a user guess and increments the user score based on the accuracy of the guess
* Keep track of score and games(guesses) played based on the session ID
* Match display page changes based on whether a guess has already been made for that match
* Match list page updates based on which games have and haven't been previously guesed
* Test coverage for MatchesController & Importers
* Basic styling using Bootstrap

## Potential Future Features
* Allow user to actually make the selection - currently this is autogenerated (50/50 chance of it being correct) - this could be handled using a cocoon and/or a stimulus controller for handling interaction
* Import accurate player information - this is currently generated using the Faker gem
* Provide player bios, avatars and statistics
* Allow user to remove previously selected players
* Provie different ways of finding matches such as what group stage it was, search or filtering by team
* Provide additional points when the correct players are chosen for each of the goals
* Provide user account creation & management

## Technical Debt
* Improve performance - Implement fragment caching
* Add a presentation/decorator layer to cleanup UI
* Add more test coverage including specs for GuessesController & different MatchesController scenarios
* Create Factory Bot factories for all models

## Stack
* Heroku - PaaS
* Ruby on Rails - Web Framework
* PostgreSQL- DB
* Bootstrap - UI framework
* HAML - HTML abstraction markup language
* Rspec - Testing framework
* Faker - Content generation - currently used for random player names
* Rollbar - Error tracking
* Scout - Performance monitoring
* Rack Mini Profiler - Performance monitoring
* Redis - This would be used for caching
* Hotwire - This would be used for potential future features such as player/guess picking
* Delayed Job - This would be used for background jobs
