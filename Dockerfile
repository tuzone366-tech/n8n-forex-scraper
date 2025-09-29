FROM n8nio/n8n:latest

USER root

# Install Python, pip, and build tools + system libraries
RUN apk add --no-cache \
    python3 \
    py3-pip \
    build-base \
    libffi-dev \
    musl-dev \
    openssl-dev \
    ca-certificates \
    bash \
    curl \
    git

# Upgrade pip, setuptools, wheel safely
RUN python3 -m ensurepip && \
    python3 -m pip install --upgrade pip setuptools wheel

# Copy your scraper folder
COPY ./forex_factory_calendar_news_scraper /home/n8n/forex_scraper

# Install Python dependencies
RUN pip3 install --no-cache-dir -r /home/n8n/forex_scraper/requirements.txt

# Switch back to n8n user
USER node
