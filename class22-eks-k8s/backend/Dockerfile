# Use Python 3.12 slim image
FROM python:3.11-slim

# Set working directory
WORKDIR /

# Install system dependencies including PostgreSQL client, build tools, and dos2unix
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

COPY migrate.sh .

# Copy application code
COPY . .


# Expose port
EXPOSE 8000


# Command to run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "run:app"]