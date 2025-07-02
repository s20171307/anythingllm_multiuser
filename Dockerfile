# Use an official Node.js image for building the frontend
FROM node:18 AS frontend-build
WORKDIR /app
COPY . .
# Install frontend dependencies and build (adjust path if needed)
RUN cd frontend && npm install && npm run build

# Use an official Python image for the backend
FROM python:3.10-slim AS backend
WORKDIR /app
# Install backend dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
# Copy backend and built frontend
COPY . .
COPY --from=frontend-build /app/frontend/build ./frontend/build
# Expose port (adjust if needed)
EXPOSE 3001
# Start the backend server (adjust command as per official guide)
CMD ["python", "main.py"] 