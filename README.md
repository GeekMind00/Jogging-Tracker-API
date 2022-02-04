# Jogging Tracker API

## About The Project
> Jogging-Tracker-API is a RESTful API that tracks jogging times of users.

## Functionality requirements:
- Authentication: Create account / login / logout.
- When logged in, a user can view, edit and delete entered `jogging times`.
- Implement three roles with different permission levels: a regular `user` would only be able to CRUD on their owned records, a `moderator` would be able to CRUD users, and an `admin` would be able to CRUD all records and users.
- Each time entry when entered has a date, distance, and time.
- Filter by dates from-to.
- Report on average speed & distance per week.
## Built with
- Main project [RoR](https://rubyonrails.org/)
- Authentication [Devise](https://github.com/heartcombo/devise) 
- Authorization [Pundit](https://github.com/varvet/pundit)

## Getting Started

> This is an list of needed instructions to set up your project locally, to get a local copy up and running follow these instructions.

## Installation

**_Clone the repository_**

```sh
git clone git@github.com:GeekMind00/Jogging-Tracker-API.git
```

**_Navigate to repository directory_**

```sh
$ cd Jogging-Tracker-API
```  
## Project Setup

**Install all gems**:

```console
$ bundle install
```

**Update the database with new data model**:

```console
$ rails db:migrate
```



**Start the web server on `http://localhost:3000` by default**:

```console
$ rails server
```

## Usage

| HTTP verbs | Paths  | Used for |
| ---------- | ------ | --------:|
| POST | /signup| Create a user|
| POST | /login   | Authenticate a user |
| DELETE | /logout  | Terminate a user's session |
| GET | /users    | List all users|
| GET | /users/:id | Show a single user |
| POST | /users | Create a user |
| PUT | /users/:id | Update a user |
| DELETE | /users/:id  | Delete a user |
| GET | /jogging_records?from=date&to=date    | List all jogging records|
| GET | /jogging_records/:id | Show a single jogging record |
| POST | /jogging_records | Create a jogging_record |
| PUT | /jogging_records/:id | Update a jogging record |
| DELETE | /jogging_records/:id  | Delete a jogging record |
| GET | /weekly_report | Show weekly report of jogging records |

## Postman Use Case Examples
[JoggingTracker-API Collection](https://www.postman.com/lunar-water-612381/workspace/joggingtracker-api-public/collection/13922421-2fc1443c-88d9-4f8b-a2c3-ec7dd62ee4b3)





# Jogging-Tracker-API
