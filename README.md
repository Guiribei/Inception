<h1 align="center">
        Inception
</h1>

<p align="center">
    <img src="https://github.com/guiribei/guiribei/blob/main/42_badges/inceptione.png" />
</p>

## Summary
> <i>This project is a Dockerized WordPress infrastructure using three key components: Nginx, MariaDB, and WordPress itself. The containers are orchestrated using Docker Compose, based on custom Docker images built from Dockerfiles.</i>
> <i>The intention behind this project was to learn about Docker, containerization, and orchestration.</i>

## Features

The Nginx container serves as the web server and is exposed on port 443 using a self-signed TLS certificate. MariaDB is used as the database and is configured through a script during the build phase. WordPress is set up using WP CLI, also configured via a script during its build phase.

## Project Structure

```
srcs
├── docker-compose.yml
└── requirements
    ├── mariadb
    │   ├── Dockerfile
    |   ├── conf
    │   └── tools
    ├── nginx
    │   ├── Dockerfile
    │   └── conf
    └── wordpress
        ├── Dockerfile
        └── tools
```

## Prerequisites

1. Docker installed
2. Docker Compose installed

## Quick Start

1. Clone the repository:

    ```bash
    git clone https://github.com/Guiribei/Inception.git
    ```

2. Navigate to the project directory:

    ```bash
    cd Inception
    ```

3. Start the Docker Compose using Makefile:

    ```bash
    make
    ```

You can now access the WordPress website at `https://localhost`.

## Environment Variables

To configure your setup, you'll need to provide environment variables. You must create a `.env` file for that.

Here are the variables you may set:

- `DATABASE_USER`
- `DATABASE_USER_PASSWORD`
- `DATABASE_NAME`
- `DATABASE_ROOT_PASSWORD`
- `WP_ADMIN_USER`
- `WP_ADMIN_PASSWD`
- `WP_ADMIN_EMAIL`
- `WP_USER`
- `WP_USER_PASSWD`
- `WP_USER_EMAIL`
- `WP_URL`
- `WP_DB_HOST`
- `WP_TITLE`

## Volumes

The project uses two volumes:

- `db_data` for MariaDB, mounted at `/var/lib/mysql` in the container.
- `wp_data` for WordPress, mounted at `/var/www/wordpress` in the container.

## Networking

A custom bridge network (`mynetwork`) is used for communication between the containers.

## Customizing Docker Images

This project uses custom Docker images based on Alpine Linux:

1. **Nginx**: Located at `requirements/nginx/Dockerfile`.
2. **MariaDB**: Located at `requirements/mariadb/Dockerfile`.
3. **WordPress**: Located at `requirements/wordpress/Dockerfile`.

You can modify these Dockerfiles to suit your needs.
