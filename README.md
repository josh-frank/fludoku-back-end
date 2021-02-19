<h1 style="text-align: center"> Fludoku </h1>

<p align="center">
<img src="public/Fludoku.gif" alt="Fludoku Animation" >
</p>

## Table of Contents

* [Introduction](#introduction)
* [Running the App](#running-the-app)
* [API Endpoints](#api-endpoints)
  * [Login User](#login-user)
  * [Get User Info](#user-by-id)
  * [Update User](#update-user)
  * [New Game](#new-game)
  * [Update Game](#update-board)
  * [Load Game](#load-game)
  * [Delete Game](#delete-game)
  * [Create UserBoard](#create-user-board)
  * [Update UserBoard](#update-user-board)
* [Entity Relationship Diagram](#entity-relationship-diagram)
* [Contributing](#contributing)
  * [Known Issues](#known-issues)
  * [Contributors](#contributors)
 
### Introduction 
Fludoku was written as a phase 3 project in the Flatiron School Software Engineering program as a Single-page Web-app with a Ruby on Rails API backend. The frontend Javascript interace can be found at [Fludoku-front-end](https://github.com/josh-frank/fludoku-front-end/issues) on GitHub.

Fludoku uses a backtracking algorithm to generate randomized Sudoku games of a difficulty specified by the user. Information about how this algorithm functions can be found in this blog post: ["Generating & Solving Sudoku using Backtracking"](https://dev.to/dsasse07/generating-solving-sudoku-in-js-ruby-with-backtracking-4hm)

## Running the App
- Fork and clone this repo
- Fork and clone the [front-end repo](https://github.com/josh-frank/fludoku-front-end)
- `cd` into this back end directory
- Run `bundle install` to install required gems
- Run `rails db:create` to initialize a PostgreSQL if this is the first time running the app.
- Run `rails db:migrate` to build the database schema
- Run `rails db:seed` to initialize the seed data if desired (not necessary)
- Run `rails s` to start the API server on `http://localhost:3000`
- Once the server has been started and is running on http://localhost:3000, `cd` into the cloned front-end directory.
- Open `index.html` by running `open index.html` in the terminal, or other preferred method.

## API Endpoints
  * Login User <a id="login-user"></a>
    * GET to http://localhost/login?name=NAME
    * Return JSON response with Users name, points, and array of UserBoards. 
    * Ex:
    ```
    { "id": 1,
      "name": "Danny",
      "points": 7589,
      "user_boards": [
                      {
                        "id": 1,
                        "board_id": 1,
                        "difficulty": 10,
                        "board_name": "Lets Win",
                        "solved": true,
                        "failed": true
                      },
                      {
                        "id": 33,
                        "board_id": 33,
                        "difficulty": 3,
                        "board_name": "I won!",
                        "solved": true,
                        "failed": false
                      }
                    ]
    } 
    ```

[Back to Top](#table-of-contents)

  * GET User info by ID <a id="user-by-id"></a>
    * GET to http://localhost/users/:id
    * Return JSON response with Users name, points, and array of UserBoards. Used to load games when already logged in. Same response format as above.
  * Update User info <a id="update-user"></a>
    * PATCH to http://localhost/users/:id
    * Accepts JSON string to update users `points` on board save
  * Create new Board <a id="new-game"></a>
    * POST to http://localhost/boards
    * Accepts JSON string with board data to create new record
      * 
      ```
        newBoardData = {
                board_name: boardName,
                starting_board: startingBoard,
                board_in_progress: startingBoard,
                solved_board: solvedBoard,
                removed_values: removedVals,
                difficulty: holes
              }
      ```
  * Update Game <a id="update-board"></a>
    * PATCH to http://localhost/boards/:id
    * Update `board_name` and/or `board_in_progress`

[Back to Top](#table-of-contents)

  * Load Existing Game <a id="load-game"></a>
    * GET to http://localhost/boards/:id
    * ```
      {
        "id": 2,
        "board_name": "take 2",
        "starting_board": [
                  [5,3,2,4,7,6,8,9,1],
                  [0,1,9,0,2,5,6,7,0],
                  [7,6,0,9,8,1,2,5,3],
                  [3,7,5,6,1,0,9,4,8],
                  [6,4,8,7,5,0,0,1,2],
                  [1,9,2,8,3,4,7,6,5],
                  [4,0,1,2,6,7,5,8,9],
                  [9,8,6,5,4,3,1,0,7],
                  [2,5,7,1,0,8,4,3,6]
                  ],
        "solved_board": [
                  [5,2,3,4,7,6,8,9,1],
                  [8,1,9,3,2,5,6,7,4],
                  [7,6,4,9,8,1,2,5,3],
                  [3,7,5,6,1,2,9,4,8],
                  [6,4,8,7,5,9,3,1,2],
                  [1,9,2,8,3,4,7,6,5],
                  [4,3,1,2,6,7,5,8,9],
                  [9,8,6,5,4,3,1,2,7],
                  [2,5,7,1,9,8,4,3,6]
                  ],
        "board_in_progress": [
                  [5,2,3,4,7,6,8,9,1],
                  [8,1,9,3,2,5,6,7,4],
                  [7,6,4,9,8,1,2,5,3],
                  [3,7,5,6,1,2,9,4,8],
                  [6,4,8,7,5,9,3,1,2],
                  [1,9,2,8,3,4,7,6,5],
                  [4,3,1,2,6,7,5,8,9],
                  [9,8,6,5,4,3,1,2,7],
                  [2,5,7,1,9,8,4,3,6]
                  ],
        "difficulty": 10,
        "removed_values": [
                  { "val": 3, "colIndex": 1, "rowIndex": 6 },
                  { "val": 3, "colIndex": 6, "rowIndex": 4 },
                  { "val": 4, "colIndex": 2, "rowIndex": 2 },
                  { "val": 3, "colIndex": 3, "rowIndex": 1 },
                  { "val": 2, "colIndex": 7, "rowIndex": 7 },
                  { "val": 4, "colIndex": 8, "rowIndex": 1 },
                  { "val": 8, "colIndex": 0, "rowIndex": 1 },
                  { "val": 2, "colIndex": 5, "rowIndex": 3 },
                  { "val": 9, "colIndex": 4, "rowIndex": 8 },
                  { "val": 9, "colIndex": 5, "rowIndex": 4 }
                  ]
      }

[Back to Top](#table-of-contents)

  * Delete Game <a id="delete-game"></a>
    * DELETE to http://localhost/boards/:id
    * Delete game record and associated UserBoard
  
  * Create UserBoard <a id="create-user-board"></a>
    * POST to http://localhost/user_boards/
    * Accepts JSON string of `user_id` and `board_id`
  * Update UserBoard <a id="update-user-board"></a>
    * PATCH to http://localhost/user_boards/:id

[Back to Top](#table-of-contents)

## Entity Relationship Diagram

User --< UserBoards  >-- Boards

- A User has a:
  - name
  - points
  - has many UserBoards
  - has many Boards through UserBoards
- A UserBoard has a:
  - user_id
  - board_id
  - solved (boolean)
  - failed (boolean)
  - belongs to User
  - belongs to Board
- A Board has a:
  - board_name
  - difficulty (number of holes)
  - starting_board (Original 9x9 board matrix)
  - board_in_progress (9x9 Matrix with user input)
  - solved_board 
  - removed_values 
    - Array of objects containing values with their coordinates that were removed from the solved_board to obtain the starting_board
  - has many UserBoards
  - has many Users through UserBoards

[Back to Top](#table-of-contents)

## Contributing
Pull requests are welcome. Please make sure that your PR is <a href="https://www.netlify.com/blog/2020/03/31/how-to-scope-down-prs/">well-scoped</a>. For major changes, please open an issue first to discuss what you would like to change.

### Known issues
* <a href="https://github.com/josh-frank/fludoku-back-end/issues">Visit Issues Section</a>

[Back to Top](#table-of-contents)

### Contributors
<table>
  <tr>
    <td align="center"><a href="https://github.com/dsasse07"><img src="https://avatars1.githubusercontent.com/u/72173601?s=400&u=57e4654c70d63d16bc5b84e2878d97f770672715&v=4" width="200px;" alt="Daniel Sasse"/><br /><sub><b>Daniel Sasse</b></sub></a><br />
    <td></td>
    <td align="center"><a href="https://github.com/josh-frank"><img src="https://avatars.githubusercontent.com/u/72422394?s=460&u=3b8dbdcda36d483426a2e794107f1f704b1592e8&v=4" width="200px;" alt="Josh Frank"/><br /><sub><b>Josh Frank</b></sub></a><br />
    </tr>