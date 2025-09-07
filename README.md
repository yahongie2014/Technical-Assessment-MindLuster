# 👨&zwj;💻 Technical-Assessment-MindLuster ([Link](https://www.notion.so/Full-Stack-Developer-Assessment-Task-23024253613480749effdc8ed8efe2ee))

# 1.Backend

```cmd
composer create-project laravel/laravel MindLuster
```

```cmd
php artisan make:model -m Task
```

```cmd
php artisan migrate
```

```cmd
php artisan db:seed
```

```composer
composer require laravel/breeze && composer require nunomaduro/collision
```

```cmd
php artisan vendor:publish && php artisan breeze:install
```

```cmd
  php artisan route:list

  GET|HEAD        / .............................. generated::zIKde3qMuMYJtul8
  POST            api/auth/login ................. generated::jN2jPrHfY0Hk0GsR
  POST            api/auth/logout ................ generated::DBVILOPutwY82zBh
  GET|HEAD        api/tasks ............... tasks.index › TaskController@index
  POST            api/tasks ............... tasks.store › TaskController@store
  GET|HEAD        api/tasks/create ...... tasks.create › TaskController@create
  GET|HEAD        api/tasks/{task} .......... tasks.show › TaskController@show
  PUT|PATCH       api/tasks/{task} ...... tasks.update › TaskController@update
  DELETE          api/tasks/{task} .... tasks.destroy › TaskController@destroy
  GET|HEAD        api/tasks/{task}/edit ..... tasks.edit › TaskController@edit
```

```cmd
php artisan serve
```

Will Debloy on ([Offline](http://localhost:8000)) or ([online](https://task.fadaa-marketing.com/request-docs/))

```Demo auth :post | endpoint :  api/auth/login
{
    "email": "demo@example.com",
    "password": "password"
}
```

```Demo Product :post | endpoint : api/tasks  | edit-endpoint: api/tasks/46
{
    "title": "test task create",
    "column": "in_progress", // 'todo', 'in_progress', 'done'
    "priority": 2
}
```

## ERD Design

![alt text](https://raw.githubusercontent.com/yahongie2014/Technical-Assessment-MindLuster/refs/heads/main/TASK%20DIAGRAM.png)

## 2.FrontEnd

```cmd
npx create-react-app frontend
```

## list of packages

```
    "@hello-pangea/dnd": "^18.0.1"
    "@mui/icons-material": "^6.1.3"
    "@mui/material": "^6.1.3"
    "@tanstack/react-query": "^5.51.15"
    "axios": "^1.7.4"
    "vitejs/plugin-react"
```

# create Vite Config

`````cmd
cp .env.example .env
````

````change ENV > parmmaters
VITE_API_URL=https://localhost:8000
VITE_API_PREFIX=/api
`````

# Deploy By Vercel Git Hook

[VERCEL Online !](https://technical-assessment-mind-luster.vercel.app/)

## 3.SQL Queries

### 1️⃣ Retrieve tasks for a specific user and column

```sql
SELECT *
FROM tasks
WHERE `user_id` = 1
  AND `column` = "in_progress"
ORDER BY created_at DESC;
```

---

### 2️⃣ Count tasks in each column

```sql
SELECT `column`, COUNT(*) AS total_tasks
FROM tasks
GROUP BY `column`;
```

(For a specific user only 👇)

```sql
SELECT `column`, COUNT(*) AS total_tasks
FROM tasks
WHERE user_id = 1
GROUP BY `column`;
```

---

### 3️⃣ List all tasks with related user info (JOIN)

```sql
SELECT
    tasks.id,
    tasks.title,
    tasks.description,
    tasks.column,
    tasks.priority,
    tasks.due_date,
    users.id AS user_id,
    users.name AS user_name,
    users.email AS user_email
FROM tasks
INNER JOIN users ON users.id = tasks.user_id
ORDER BY tasks.created_at DESC;
```

## Authors

[Website](https://www.coder79.me/)
| [Linkedin](https://www.linkedin.com/in/devahmedsaeed/)
| [Youtube](https://www.youtube.com/AhmedSaeedcoder79/)
