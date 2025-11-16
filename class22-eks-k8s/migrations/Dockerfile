# Use Python 3.12 slim image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies including PostgreSQL client, build tools
RUN apt-get update && apt-get install -y \
    postgresql-client \
    libpq-dev \
    gcc \
    python3-dev \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Fix line endings with sed (works even if dos2unix fails)
RUN sed -i 's/\r$//' migrate.sh && chmod +x migrate.sh

# Command to run the application
CMD ["/bin/bash", "/app/migrate.sh"]