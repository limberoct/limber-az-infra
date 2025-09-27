FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Create Django project
RUN django-admin startproject helloworld .

# Copy custom settings
COPY settings.py helloworld/settings.py
COPY urls.py helloworld/urls.py
COPY views.py helloworld/views.py

# Collect static files
RUN python manage.py collectstatic --noinput

EXPOSE 8000

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "helloworld.wsgi:application"]