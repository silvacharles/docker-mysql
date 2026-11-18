# Docker MySQL for Raspberry Pi (ARM64)

![MySQL Logo](https://raw.githubusercontent.com/docker-library/docs/master/mysql/logo.png)

MySQL is the world's most popular open source database. With its proven performance, reliability, and ease-of-use, MySQL has become the leading database choice for web-based applications.

This image is based on the **official MySQL 8.4 LTS** Docker image with full **ARM64/Raspberry Pi support**.

## Features

- ✅ **MySQL 8.4 LTS** (Latest Long Term Support release)
- ✅ **ARM64/Raspberry Pi compatible** (native support in official image)
- ✅ **Minimal CVEs** - Official image receives regular security updates
- ✅ **Official MySQL Docker image** - Maintained by MySQL team
- ✅ **Secure defaults** - Includes proper user setup, SSL/TLS support
- ✅ **Health checks** - Built-in container health monitoring
- ✅ **Environment variable configuration** - Standard MySQL Docker variables

## Quick Start

```bash
# Run MySQL container
docker run --name mysql \
  -e MYSQL_ROOT_PASSWORD=senha \
  -d charlessilva/rpi-mysql:8.4

# Or with docker-compose
docker-compose up -d
```

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `MYSQL_ROOT_PASSWORD` | **Required** - Root user password | - |
| `MYSQL_DATABASE` | Database to create on startup | - |
| `MYSQL_USER` | User to create with access to MYSQL_DATABASE | - |
| `MYSQL_PASSWORD` | Password for MYSQL_USER | - |
| `MYSQL_ALLOW_EMPTY_PASSWORD` | Allow empty root password (not recommended) | `false` |
| `MYSQL_RANDOM_ROOT_PASSWORD` | Generate random root password | `false` |
| `MYSQL_ONETIME_PASSWORD` | Force root password change on first login | `false` |

## Usage Examples

### Basic Usage
```bash
docker run --name mysql \
  -e MYSQL_ROOT_PASSWORD=minhasenha \
  -d charlessilva/rpi-mysql:8.4
```

### With Custom Database and User
```bash
docker run --name mysql \
  -e MYSQL_ROOT_PASSWORD=rootpassword \
  -e MYSQL_DATABASE=meubanco \
  -e MYSQL_USER=meuusuario \
  -e MYSQL_PASSWORD=senhausuario \
  -d charlessilva/rpi-mysql:8.4
```

### With Persistent Data
```bash
docker run --name mysql \
  -e MYSQL_ROOT_PASSWORD=senha \
  -v mysql-data:/var/lib/mysql \
  -d charlessilva/rpi-mysql:8.4
```

### With Custom Configuration
```bash
docker run --name mysql \
  -e MYSQL_ROOT_PASSWORD=senha \
  -v ./my.cnf:/etc/mysql/conf.d/custom.cnf \
  -d charlessilva/rpi-mysql:8.4
```

### Connect from Another Container
```bash
# Start MySQL
docker run --name mysql \
  -e MYSQL_ROOT_PASSWORD=senha \
  -d charlessilva/rpi-mysql:8.4

# Connect from app container
docker run --name meu-app \
  --link mysql:mysql \
  -d minha-aplicacao
```

## Docker Compose Example

```yaml
version: '3.8'

services:
  mysql:
    image: charlessilva/rpi-mysql:8.4
    container_name: mysql
    environment:
      MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
      MYSQL_DATABASE: ${MYSQL_DATABASE}
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
    volumes:
      - mysql-data:/var/lib/mysql
      - ./config:/etc/mysql/conf.d
    ports:
      - "3306:3306"
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-h", "localhost"]
      interval: 10s
      timeout: 5s
      retries: 5

volumes:
  mysql-data:
```

## Ports

- **3306** - MySQL classic protocol
- **33060** - MySQL X Protocol (for MySQL Shell, connectors)

## Data Persistence

The MySQL data directory is `/var/lib/mysql`. Mount a volume to persist data:

```bash
docker run -v mysql-data:/var/lib/mysql ...
```

## Configuration

Add custom MySQL configuration by mounting a `.cnf` file to `/etc/mysql/conf.d/`:

```bash
docker run -v ./my-custom.cnf:/etc/mysql/conf.d/custom.cnf ...
```

## Security

This image uses the **official MySQL Docker image** which:
- Receives regular security patches
- Runs as non-root user (mysql)
- Includes SSL/TLS support
- Has secure default configuration
- Implements proper privilege separation

## Architecture Support

| Architecture | Supported |
|--------------|-----------|
| linux/amd64  | ✅ |
| linux/arm64  | ✅ (Raspberry Pi 4, 5, etc.) |
| linux/arm/v7 | ⚠️ Not officially supported by MySQL 8.4 |

## Version Tags

- `8.4`, `latest` - MySQL 8.4 LTS (recommended)
- `8.0` - MySQL 8.0 LTS (supported until 2026)

## License

The MIT License (MIT)

Copyright (c) 2017-2026 Charles Silva

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.