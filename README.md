# 🚀 Technical Assessment - MindLuster

A full-stack application featuring a Laravel backend with a recruitment system and task management, paired with a React frontend implementing a Kanban board interface.

**Assessment Link**: [Full-Stack Developer Assessment Task](https://www.notion.so/Full-Stack-Developer-Assessment-Task-23024253613480749effdc8ed8efe2ee)

---

## 📋 Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Backend Setup](#backend-setup)
- [Frontend Setup](#frontend-setup)
- [API Documentation](#api-documentation)
- [Database Schema](#database-schema)
- [SQL Query Examples](#sql-query-examples)
- [Demo Credentials](#demo-credentials)
- [Deployment](#deployment)
- [Author](#author)

---

## ✨ Features

### Backend

- **Task Management**: Complete CRUD operations for tasks with status tracking
- **Recruitment System**: Job postings, candidate applications, and interview scheduling
- **Application Workflow**: State machine pattern for application stages
- **Authentication**: Laravel Breeze with Sanctum API tokens
- **API Documentation**: Integrated with Scribe/Request Docs

### Frontend

- **Kanban Board**: Drag-and-drop task management across columns
- **Real-time Updates**: React Query for optimistic updates
- **Search & Filter**: Quick task search functionality
- **Pagination**: Built-in pagination for task lists
- **Responsive Design**: Material-UI components for modern interface

---

## 🛠️ Tech Stack

### Backend

- **Framework**: Laravel 11.x
- **Authentication**: Laravel Breeze + Sanctum
- **Database**: MySQL/MariaDB
- **API**: RESTful API with Resource transformers

### Frontend

- **Framework**: React 18 + Vite
- **State Management**: TanStack React Query
- **UI Library**: Material-UI (MUI)
- **Drag & Drop**: @hello-pangea/dnd
- **HTTP Client**: Axios

---

## 🔧 Backend Setup

### Installation

1. **Create Laravel Project**

```bash
composer create-project laravel/laravel MindLuster
cd MindLuster
```

2. **Install Dependencies**

```bash
composer require laravel/breeze
composer require nunomaduro/collision
```

3. **Setup Breeze**

```bash
php artisan vendor:publish
php artisan breeze:install
```

4. **Configure Environment**

```bash
cp .env.example .env
```

Update `.env` with your database credentials:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=your_database_name
DB_USERNAME=your_username
DB_PASSWORD=your_password
```

5. **Run Migrations & Seed**

```bash
php artisan migrate --seed
```

6. **Start Development Server**

```bash
php artisan serve
```

The backend will be available at `http://localhost:8000`

### Available Routes

```bash
php artisan route:list
```

**Key API Endpoints:**

- `POST /api/auth/login` - User authentication
- `POST /api/auth/logout` - Logout (requires auth)
- `GET /api/tasks` - List all tasks (requires auth)
- `POST /api/tasks` - Create new task (requires auth)
- `PUT /api/tasks/{id}` - Update task (requires auth)
- `DELETE /api/tasks/{id}` - Delete task (requires auth)
- `GET /api/jobs` - List jobs
- `POST /api/application` - Submit application

---

## 🎨 Frontend Setup

### Installation

1. **Create Vite Project**

```bash
npm create vite@latest frontend
cd frontend
npm install
```

2. **Install Dependencies**

```bash
npm install @hello-pangea/dnd @mui/icons-material @mui/material @tanstack/react-query axios
```

3. **Configure Environment**

```bash
cp .env.example .env
```

Update `.env` with your API URL:

```env
VITE_API_URL=http://localhost:8000
VITE_API_PREFIX=/api
```

4. **Start Development Server**

```bash
npm run dev
```

The frontend will be available at `http://localhost:5173`

### Build for Production

```bash
npm run build
```

---

## 📡 API Documentation

### Authentication

**Login**

```http
POST /api/auth/login
Content-Type: application/json

{
  "email": "demo@example.com",
  "password": "password"
}
```

**Response:**

```json
{
  "token": "your-api-token",
  "user": {
    "id": 1,
    "name": "Demo User",
    "email": "demo@example.com"
  }
}
```

### Tasks

**Create Task**

```http
POST /api/tasks
Authorization: Bearer {token}
Content-Type: application/json

{
  "title": "Complete project documentation",
  "description": "Write comprehensive README",
  "column": "in_progress",
  "priority": 2
}
```

**Update Task**

```http
PUT /api/tasks/{id}
Authorization: Bearer {token}
Content-Type: application/json

{
  "title": "Updated task title",
  "column": "done",
  "priority": 1
}
```

### Applications

**Submit Application**

```http
POST /api/application
Content-Type: application/json

{
  "job_id": 1,
  "candidate": {
    "first_name": "John",
    "email": "john@example.com"
  }
}
```

---

## 💾 Database Schema

### ERD Diagram

![Database Schema](https://raw.githubusercontent.com/yahongie2014/Technical-Assessment-MindLuster/refs/heads/main/TASK%20DIAGRAM.png)

### Key Tables

- **users**: System users and recruiters
- **tasks**: Task management with columns (todo, in_progress, done)
- **jobs**: Job postings created by recruiters
- **candidates**: Job applicants
- **applications**: Job applications with stage tracking
- **application_stage_histories**: Audit trail for application stages
- **interviews**: Scheduled interviews for applications

---

## 🔍 SQL Query Examples

### 1. Retrieve Tasks for Specific User and Column

```sql
SELECT *
FROM tasks
WHERE user_id = 1
  AND `column` = 'in_progress'
ORDER BY created_at DESC;
```

### 2. Count Tasks in Each Column

**All Users:**

```sql
SELECT `column`, COUNT(*) AS total_tasks
FROM tasks
GROUP BY `column`;
```

**Specific User:**

```sql
SELECT `column`, COUNT(*) AS total_tasks
FROM tasks
WHERE user_id = 1
GROUP BY `column`;
```

### 3. List Tasks with User Information (JOIN)

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

---

## 🔐 Demo Credentials

### Web Login

- **Email**: `demo@example.com`
- **Password**: `password`

### API Testing

```json
{
  "email": "demo@example.com",
  "password": "password"
}
```

---

## 🌐 Deployment

### Backend

- **Production URL**: [Online Backend](https://task.fadaa-marketing.com)
- **API Documentation**: [PostMan Collection](https://documenter.getpostman.com/view/2836787/2sB3QMK8Z6)

### Frontend

- **Deployed on**: Vercel
- **Live Demo**: [Kanabn Dashboard](https://technical-assessment-mind-luster.vercel.app)

![Kanban Board Screenshot](https://raw.githubusercontent.com/yahongie2014/Technical-Assessment-MindLuster/refs/heads/main/kanban.png)

---

## 👨‍💻 Author

**Ahmed Saeed**

- 🌐 Website: [coder79.me](https://www.coder79.me/)
- 💼 LinkedIn: [devahmedsaeed](https://www.linkedin.com/in/devahmedsaeed/)
- 📺 YouTube: [AhmedSaeedcoder79](https://www.youtube.com/AhmedSaeedcoder79/)
- 📧 Email: contact@coder79.me

---

## 📝 License

This project is part of a technical assessment for MindLuster.

---

## 🙏 Acknowledgments

- Laravel Community for excellent documentation
- React and Vite teams for modern tooling
- Material-UI for beautiful components
- TanStack for React Query

---

**Note**: For detailed implementation specifics, please refer to the individual files in the repository.
