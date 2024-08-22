# Stage 1: Build the frontend using Vite
FROM node:18-alpine AS build-frontend

# Set working directory for frontend
WORKDIR /app/frontend

# Copy frontend package.json and package-lock.json (or yarn.lock)
COPY frontend/package*.json ./

# Install frontend dependencies
RUN npm install

# Copy the entire frontend source code
COPY frontend/ ./

# Build the frontend using Vite
RUN npm run build

# Stage 2: Setup the backend
FROM node:18-alpine AS build-backend

# Set working directory for backend
WORKDIR /app/backend

# Copy backend package.json and package-lock.json (or yarn.lock)
COPY backend/package*.json ./

# Install backend dependencies
RUN npm install

# Copy the entire backend source code
COPY backend/ ./

# Copy the built frontend files from the previous stage to the "public" directory
COPY --from=build-frontend /app/frontend/dist ./public

# Expose the backend port (adjust if needed)
EXPOSE 5000

# Set the command to start the backend
CMD ["npm", "start"]

