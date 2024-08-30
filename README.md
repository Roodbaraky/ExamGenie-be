# Math Education API

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
