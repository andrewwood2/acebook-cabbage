# AceBook

[![Build Status](https://travis-ci.org/andrewwood2/acebook-gazelle.svg?branch=master)](https://travis-ci.org/andrewwood2/acebook-gazelle)

Acebook is a basic clone of a well known social media app. There are three repos to this project.  
[Full stack Rails app](https://github.com/andrewwood2/acebook-gazelle)  
[Back end Rails API](https://github.com/andrewwood2/acebook-be)  
[Front end React app](https://github.com/andrewwood2/acebook-fe)  

We first built Acebook as a full stack Rails app, before splitting it into front end and back end.  

This is the full stack Rails app.

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Features
* Sign up
* Log in/out
* Posts feed
* New posts
* Comments on posts
* Like posts
* Profile pages
* Changing profile pictures
* Friendships
* Hashtags

## Technologies used:

* This is a Ruby on Rails app.
* Testing done by RSpec and Capybara.
* ORM is ActiveRecord and the database is PostgreSQL.
* Travis CI is used for continuous integration.
* Linting by rubocop.

## Goals

Primary goal:
Develop good team-working processes.

Secondary goals:
Be able to build and explain what's happening in a rails app.
Understanding and implementing deployment on Heroku.
Understanding databases and ORMs.
Continuous integration, via Travis CI.

Strategies:
Code quality over features.
Equal contribution.
Making sure every issue has it's own branch.
Clear commit messages and pull requests.
Rotate leading stand-ups.
Popcorn size tickets.
Regular pair rotation.

## Wireframes

Sign up and Log in:

![Alt text](/wireframes/Signup-login.png)

Timeline:

![Alt text](/wireframes/Timeline.png)

Profile:

![Alt text](/wireframes/Profile.png)

Create post:

![Alt text](/wireframes/Write-post.png)

## User Stories

```
As a user
So that I can join the latest social media platform Acebook
I want to be able to sign up

As a user
So that I make personal posts
I want to be able to sign in to Acebook

As a user
So that I can project my thoughts to the world
I would like to create a post

As a user
So that I can see the most up to date news from my friends
I would like to see posts displayed in reverse chronological order

As a fickle user
So that I can edit my opinions
I would like to be able to edit a post

As a post-first-think-later type of user
So that I can remove all evidence of my most embarrassing posts
I would like to be able to delete a post

As a user
So that I can enter discourse with other Acebook users
I want to be able to comment on posts

As a user
So that I can publicly show my approval
I want to be able to like a post

As a voyeuristic user
So that I can stalk other users
I want to be able to add friends

As a user
So that I can cut ties with my enemies
I want to be able to unfriend another user

As a user
So that I start global movements
I want to be able to add hashtags to my posts

As a user
So that I can keep up with the latest trends
I want to see a list of trending hashtags

As a user
So that I can keep up with the latests trends
I want to see a list of trending hashtags

As a user
So that I see a personalised view of a user
I want to view a user's profile page

As a photogenic user
So that I can show my face to the world
I want to add a profile picture

As a user
So that I can alter my online appearance
I want to be able to update my profile picture
```
