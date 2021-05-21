<br />

<p align="center">
  <img alt="Logo" src="./.github/logo.png" width="120px" />
</p>

<h1 align="center" style="text-align: center;">DailyMeal</h1>

<p align="center">
	<a href="https://github.com/LuizFerK">
		<img alt="Author" src="https://img.shields.io/badge/author-Luiz%20Fernando-ED3F46?style=flat" />
	</a>
	<a href="#">
		<img alt="Languages" src="https://img.shields.io/github/languages/count/LuizFerK/DailyMeal?color=ED3F46&style=flat" />
	</a>
	<a href="hhttps://github.com/LuizFerK/DailyMeal/stargazers">
		<img alt="Stars" src="https://img.shields.io/github/stars/LuizFerK/DailyMeal?color=ED3F46&style=flat" />
	</a>
	<a href="https://github.com/LuizFerK/DailyMeal/network/members">
		<img alt="Forks" src="https://img.shields.io/github/forks/LuizFerK/DailyMeal?color=ED3F46&style=flat" />
	</a>
	<a href="https://github.com/LuizFerK/DailyMeal/graphs/contributors">
		<img alt="Contributors" src="https://img.shields.io/github/contributors/LuizFerK/DailyMeal?color=ED3F46&style=flat" />
	</a>
  <a href="https://codecov.io/gh/LuizFerK/DailyMeal">
  <img src="https://codecov.io/gh/LuizFerK/DailyMeal/branch/main/graph/badge.svg?token=8XFXDOIH5R"/>
</a>
</p>

<p align="center">
	<b>Keep on track of what you're eating!</b><br />
	<span>Created with Elixir and Phoenix.</span><br />
	<sub>Made with ❤️</sub>
</p>

<br />

# :pushpin: Contents

- [Features](#rocket-features)
- [Installation](#wrench-installation)
- [Getting started](#bulb-getting-started)
- [Endpoints](#triangular_flag_on_post-endpoints)
- [Techs](#fire-techs)
- [Issues](#bug-issues)
- [License](#book-license)

# :rocket: Features

- Create, delete, and updates users
- Register your daily dishes to keep a continuous record
- Delete, update and see all your meals

# :wrench: Installation

### Required :warning:
- Elixir
- Erlang
- Phoenix
- Postgres database

### SSH

SSH URLs provide access to a Git repository via SSH, a secure protocol. If you have an SSH key registered in your GitHub account, clone the project using this command:

```git clone git@github.com:LuizFerK/DailyMeal.git```

### HTTPS

In case you don't have an SSH key on your GitHub account, you can clone the project using the HTTPS URL, run this command:

```git clone https://github.com/LuizFerK/DailyMeal.git```

**Both of these commands will generate a folder called DailyMeal, with all the project**

# :bulb: Getting started

1. Run ```mix deps.get``` to install the dependencies
2. Create a postgres database named ```dailymeal```
3. On the ```config/dev.exs``` and ```config/test.exs``` files, change your postgres **user** and **password**
4. Run ```mix ecto.migrate``` to run the migrations to your database
5. Run ```mix phx.server``` to start the server on port 4000

# :triangular_flag_on_post: Endpoints

> If you use Insomnia as your HTTP API requester, you can use the [Insomnia DailyMeal Collection](https://github.com/LuizFerK/DailyMeal/blob/main/.github/insomnia.json) to set up your requests as fast as possible!

### Users

* :green_circle: Create - POST `http://localhost:4000/api/users`

	* Request
	
		```json
		{
		  "name": "John Doe",
		  "cpf": "12345678900",
		  "email": "johndoe@example.com"
		}
		```
	* Response - 201 Created
	
		```json
		{
  		  "id": "7d994a36-845a-4181-a313-d60ad66d4d72",
  		  "name": "John Doe",
  		  "cpf": "12345678900",
  		  "email": "johndoe@example.com"
		}
		```
* :red_circle: Delete - DELETE `http://localhost:4000/api/users/<user_id>` Response - 204 No Content

* :purple_circle: Get - GET `http://localhost:4000/api/users/<user_id>`

	* Response - 200 Ok
	
		```json
		{
  		  "id": "7d994a36-845a-4181-a313-d60ad66d4d72",
  		  "name": "John Doe",
  		  "cpf": "12345678900",
  		  "email": "johndoe@example.com"
		}
		```

* :yellow_circle: Update - PUT `http://localhost:4000/api/users/<user_id>`

	* Request:
	
		```json
		{
		  "name": "Jane Doe",
		  "cpf": "12345678901",
		  "email": "janedoe@example.com"
		}
		```
	* Response - 200 Ok
	
		```json
		{
  		  "id": "7d994a36-845a-4181-a313-d60ad66d4d72",
  		  "name": "Jane Doe",
  		  "cpf": "12345678901",
  		  "email": "janedoe@example.com"
		}
		```

* :white_circle: Get Meals - Get `http://localhost:4000/api/users/meals/<user_id>`

	* Response - 200 Ok
	
		```json
		[
  		  {
		    "id": "a204acbb-797e-4d43-9b62-1551e3021ce9",
		    "descricao": "Pizza",
		    "data": "2021-05-02T23:31:39",
		    "calorias": 1500,
		    "user_id": "7d994a36-845a-4181-a313-d60ad66d4d72"
  		  },
  		  {
		    "id": "be56cbe8-0878-410b-bb69-d0649948f6c6",
		    "descricao": "Salad",
		    "data": "2021-05-02T23:32:51",
		    "calorias": 1000,
		    "user_id": "7d994a36-845a-4181-a313-d60ad66d4d72"
  		  }
		]
		```

### Meals

* :green_circle: Create - POST `http://localhost:4000/api/meals`

	* Request
	
		```json
		{
		  "user_id": "7d994a36-845a-4181-a313-d60ad66d4d72",
		  "descricao": "Pizza",
		  "data": "2021-05-21T16:49:46",
		  "calorias": 1500
		}
		```
	* Response - 201 Created
	
		```json
		{
  		  "id": "a204acbb-797e-4d43-9b62-1551e3021ce9",
  		  "descricao": "Pizza",
  		  "data": "2021-05-21T16:49:46",
  		  "calorias": 1500,
  		  "user_id": "7d994a36-845a-4181-a313-d60ad66d4d72"
		}
		```
* :red_circle: Delete - DELETE `http://localhost:4000/api/meals/<meal_id>` Response - 204 No Content

* :purple_circle: Get - GET `http://localhost:4000/api/meals/<meal_id>`

	* Response - 200 Ok
	
		```json
		{
  		  "id": "a204acbb-797e-4d43-9b62-1551e3021ce9",
  		  "descricao": "Pizza",
  		  "data": "2021-05-21T16:49:46",
  		  "calorias": 1500,
  		  "user_id": "7d994a36-845a-4181-a313-d60ad66d4d72"
		}
		```

* :yellow_circle: Update - PUT `http://localhost:4000/api/meals/<meal_id>`

	* Request:
	
		```json
		{
		  "user_id": "7d994a36-845a-4181-a313-d60ad66d4d72",
		  "descricao": "Hotdog",
		  "data": "2021-05-21T17:49:46",
		  "calorias": 1000
		}
		```
	* Response - 200 Ok
	
		```json
		{
  		  "id": "a204acbb-797e-4d43-9b62-1551e3021ce9",
  		  "descricao": "Hotdog",
  		  "data": "2021-05-21T17:49:46",
  		  "calorias": 1000,
  		  "user_id": "7d994a36-845a-4181-a313-d60ad66d4d72"
		}
		```

# :fire: Techs

### Elixir (language)

### Phoenix (web framework)
- Ecto

# :bug: Issues

Find a bug or error on the project? Please, feel free to send me the issue on the [DailyMeal issues area](https://github.com/LuizFerK/DailyMeal/issues), with a title and a description of your found!

If you know the origin of the error and know how to resolve it, please, send me a pull request, I will love to review it!

# :book: License

Released in 2020.

This project is under the [MIT license](https://github.com/LuizFerK/DailyMeal/blob/main/LICENSE).

<p align="center">
	< keep coding /> :rocket: :heart:
</p>
