# QueueOverflow - A replica of StackOverflow

## Usage

- Can directly access the website link : [QueueOverflow](https://berk-overflow.herokuapp.com/)
- In order to play with the code clone this repo to your local system

## Installation

Prior to run this project on the local server one must install following dependencies inside the root directory of the project:
```sh
$ bundle install
$ yarn
```

Note : Database used in the project is postgres. So, one must install postgres prior running this project

- creating and migrating database
```sh
$ rake db:create
$ rake db:migrate
```

- Hosting a local server
```sh
$ rails server
```