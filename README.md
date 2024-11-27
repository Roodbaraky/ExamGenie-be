# ExamGenie API

## Overview

This project is a backend API for a ExamGenie, a learning aid for generating bespoke revision materials specific to a scheme of work. It provides endpoints for managing questions, schemes of work (SoW), classes, and tags. The API is built with Express.js and TypeScript, using Supabase / PostgreSQL as the database.

## Features

- Question management (CRUD operations)
- Scheme of Work (SoW) management
- Class management
- Tag management
- User authentication and authorization
- Error handling middleware


## Getting Started

### Prerequisites

- Node.js (v14 or later)
- npm
- Supabase account and project

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/Roodbaraky/ExamGenie-be
   cd ExamGenie-be
   ```

2. Install dependencies:
   ```
   npm install
   ```

3. Set up environment variables:
   Create a `.env` file in the root directory and add the following:
   ```
   SUPABASE_URL=your_supabase_project_url
   SUPABASE_KEY=your_supabase_anon_key
   SUPABASE_SERVICE_KEY=your_supabase_service_key
   PORT=3000
   ```

4. Start the development server:
   ```
   npm run dev
   ```

## API Documentation

<!--  -->

## Project Structure

- `src/`: Source code
  - `controllers/`: Request handlers
  - `models/`: Data models and database operations
  - `middleware/`: Custom middleware (error handling, authentication)
  - `types/`: TypeScript type definitions
  - `utils/`: Utility functions
  - `database/`: Database client and seed data
- `__tests__/`: Test files

## Main Endpoints

- `/questions`: Manage questions
- `/sow`: Manage Schemes of Work
- `/classes`: Manage classes
- `/tags`: Manage tags
- `/weeks`: Get weeks for a class

## Authentication

The API uses JWT for authentication. Include the JWT token in the Authorization header for protected routes.

## Error Handling

The API includes centralized error handling middleware that provides consistent error responses with appropriate HTTP status codes.

## Testing

At the moment, tests are incomplete. Please refrain from running the existing tests as they will cause the database and storage buckets to be wiped clean, resulting in a loss of uploaded data.

## 

## A note to the next dev

This project was developed as a rapid prototype to present the concept to the exam board. It is not built with inherent scalability in mind, but I am more than happy to work with you to get it there.

I have included a Postgres dump file """database_dump.sql""", as I understand, this can be imported to reproduce and populate the tables according to the schema in Supabase, but if there are any issues I'm happy to migrate the Supabase project to your organisation. This may be necessary for the storage buckets which hold question and answer data, I am unsure.

Some aims I have for the project in the future, which you can treat as suggestions:
- I believe this back-end repo is mostly replacable with database functions, which you can use the Supabase client to invoke via *.rpc()*. It may actually be possible to have this be a standalone front-end application and use Supabase's REST API to fill in the gaps where postgres functions don't cut it.
- The previous allows you to mitigate latency / costs from hosting the API separately, which was and continues to be an issue for me.
- Rebuild this with OOP. Currently, it's very loosely built with functional programming and I undoubtedly violate these principles throughout. As I learn more about OOP in Java, I see how much better I could have structured my methods for unit testing, and integration testing without side-effects - I had real trouble mocking the Supabase client using Jest, what worked for some tests seemed to make real calls to the database in others.
- Rebuild with / retrofit TDD: I raced to complete this as a prototype and with the little testing I did do, I noticed glaring refactoring opportunities which improved the code dramatically. I think the result would be much more performant and much fewer lines of much more readable code.

