FROM n8nio/n8n:latest

USER root

# Install Python, pip, and required build libraries
RUN apk add --no-cache \
    python3 \
    py3-pip \
    build-base \
    libffi-dev \
    musl-dev \
    openssl-dev \
    bash \
    curl \
    git \
    linux-headers \
    gcompat \
    zlib-dev \
    jpeg-dev \
    freetype-dev \
    lcms2-dev \
    openjpeg-dev \
    tiff-dev \
    tk-dev \
    tcl-dev \
    harfbuzz-dev \
    fribidi-dev \
    cairo-dev \
    pango-dev \
    libxml2-dev \
    libxslt-dev

# Copy your scraper folder
COPY ./forex_factory_calendar_news_scraper /home/n8n/forex_scraper

# Install Python dependencies
RUN pip3 install --no-cache-dir -r /home/n8n/forex_scraper/requirements.txt

USER node
