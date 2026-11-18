# Docker MySQL for Raspberry Pi (ARM64) - Updated to MySQL 8.4 LTS
# Based on official MySQL image with ARM64 support
# Minimal CVEs: Uses official image with regular security updates

FROM mysql:8.4

# Maintainer
LABEL maintainer="Charles Silva <suporte@charlessilva.com.br>"
LABEL description="MySQL 8.4 for Raspberry Pi (ARM64) - Official image with security updates"
LABEL version="8.4"

# The official MySQL image already includes:
# - Proper mysql user/group setup
# - Secure default configuration
# - Health checks
# - Proper entrypoint with database initialization
# - Support for MYSQL_ROOT_PASSWORD, MYSQL_DATABASE, MYSQL_USER, MYSQL_PASSWORD
# - SSL/TLS support
# - ARM64 architecture support

# Expose MySQL port
EXPOSE 3306 33060

# Use official entrypoint and cmd
# ENTRYPOINT ["docker-entrypoint.sh"]
# CMD ["mysqld"]