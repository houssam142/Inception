This project has been created as part of the 42 curriculum by <login1>.*

## Description

Inception is a system administration and DevOps-oriented project focused on containerization using Docker. The objective is to design and deploy a small infrastructure composed of multiple services, each running in its own container and orchestrated using Docker Compose.

The project enforces strict constraints: each service must be isolated, properly configured, and communicate through a Docker network. The infrastructure typically includes:

* NGINX (reverse proxy with TLS)
* WordPress (application layer)
* MariaDB (database)

The goal is to understand how modern applications are deployed in production using container-based architectures, emphasizing reproducibility, isolation, and scalability.

---

## Instructions

### Prerequisites

* Docker
* Docker Compose

### Setup

# Clone the repository
git clone <repository_url>
cd inception

# Before you running the infrastructure, put this in an .env file
```
# ======================
# Domain Configuration
# ======================
DOMAIN_NAME=hounejja.42.fr

# ======================
# Database Configuration
# ======================
DB_DATABASE=wordpress
DB_USER=hounejja
DB_PASSWORD=your_db_password
DB_ROOT_PASSWORD=your_db_root_password
DB_HOST=mariadb

# ======================
# FTP Server
# ======================
FTP_USER=hounejja
FTP_PASS=your_ftp_password

# ======================
# WordPress Admin Configuration
# ======================
WP_ADMIN=hounejja
WP_ADMIN_PASSWORD=your_admin_password
WP_ADMIN_EMAIL=houssamounejar@gmail.com

# ======================
# WordPress User
# ======================
WP_USER=user2
WP_USER_PASSWORD=your_user_password
WP_USER_EMAIL=hello@gmail.com
```
# one step before running
```
mkdir -p secrets
echo "db_password_here" > secrets/db_password.txt
echo "db_root_password" > secrets/db_root_password.txt
printf "admin_user=hounejja\nadmin_password=1234\nadmin_email=houssamounejar@gmail.com\nuser_pass=1111\nftp_pass=1234\n" > secrets/credentials.txt

### Build and Run
make up

### Access Services

* WordPress: [https://hounejja.42.fr](https://hounejja.42.fr)
* NGINX: handles incoming HTTPS requests

### Stop the Project

make down

## Docker Architecture & Design Choices

### Why Docker?

Docker provides lightweight virtualization through containers. Unlike traditional virtual machines, containers share the host kernel, making them faster to start, less resource-intensive, and easier to reproduce.

### Services Breakdown

* **NGINX**: Acts as a reverse proxy and handles HTTPS with TLS certificates.
* **WordPress**: PHP-based CMS served via PHP-FPM.
* **MariaDB**: Relational database storing WordPress data.

Each service runs in its own container to ensure modularity and separation of concerns.

## Technical Comparisons

### Virtual Machines vs Docker

| Virtual Machines     | Docker                  |
| -------------------- | ----------------------- |
| Full OS per instance | Shared host kernel      |
| Heavy resource usage | Lightweight             |
| Slow boot time       | Fast startup            |
| Strong isolation     | Process-level isolation |

Docker is preferred here for efficiency and ease of deployment.

### Secrets vs Environment Variables

| Secrets                                 | Environment Variables  |
| --------------------------------------- | ---------------------- |
| Secure storage                          | Plain text             |
| Not exposed in container runtime easily | Accessible via `env`   |
| Designed for sensitive data             | Used for configuration |

Secrets should be used for passwords, keys, and certificates, while environment variables are better suited for non-sensitive configuration.

---

### Docker Network vs Host Network

| Docker Network                       | Host Network         |
| ------------------------------------ | -------------------- |
| Isolated network layer               | Uses host networking |
| Container-to-container communication | No isolation         |
| DNS-based service discovery          | Manual configuration |

Docker networks provide better isolation and internal service discovery.

### Docker Volumes vs Bind Mounts

| Volumes                    | Bind Mounts               |
| -------------------------- | ------------------------- |
| Managed by Docker          | Managed by host           |
| Stored in Docker directory | Direct filesystem mapping |
| Better portability         | More control              |

Volumes are preferred for persistent data, while bind mounts are useful during development.

## Resources

### Documentation

* Docker Official Documentation: [https://docs.docker.com/](https://docs.docker.com/)
* Docker Compose Documentation: [https://docs.docker.com/compose/](https://docs.docker.com/compose/)
* NGINX Documentation: [https://nginx.org/en/docs/](https://nginx.org/en/docs/)
* WordPress Documentation: [https://wordpress.org/documentation/](https://wordpress.org/documentation/)
* MariaDB Documentation: [https://mariadb.org/documentation/](https://mariadb.org/documentation/)

### AI Usage

AI tools were used as a support resource during the project. They helped clarify Docker concepts, troubleshoot configuration issues, and compare different approaches (such as volumes vs bind mounts or networks vs host networking). 

All configurations and implementations were written, tested, and adapted manually to ensure full understanding of the system.
