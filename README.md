# PHP Versions for CI/CD 🧪

![Last Commit](https://img.shields.io/github/last-commit/zanjire/php-for-cicd?style=flat-square)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/zanjire/php-for-cicd/main.yml?style=flat-square)
![Repo Size](https://img.shields.io/github/repo-size/zanjire/php-for-cicd?style=flat-square)
![Top Language](https://img.shields.io/github/languages/top/zanjire/php-for-cicd?style=flat-square)
![Forks](https://img.shields.io/github/forks/zanjire/php-for-cicd?style=social)
![Stars](https://img.shields.io/github/stars/zanjire/php-for-cicd?style=social)

---

## 📦 Supported PHP Versions & Packages

Each Dockerfile is optimized for minimal layers and tailored PHP configurations suitable for CI/CD and production environments.

### ✅ PHP 5.4

- **Base**: `debian:wheezy`
- **Installed Packages**:
  - `php5`, `php5-cli`, `php5-mysql`, `php5-curl`, `php5-gd`, `php5-mcrypt`, `php5-mbstring`
  - Utilities: `curl`, `tzdata`, `ca-certificates`, `supervisor`, `busybox`, `bash`
- **Features**:
  - Supervisor setup
  - Custom PHP config via `/conf/php/`
  - Clean apt cache after installation
- **CPU Platform Support**: 
  - `linux/amd64`
  - `linux/arm64`
- **PHP Extensions Installed**:
  - bcmath, calendar, curl, dom, exif, fileinfo, filter, ftp, gd, gethostbyaddr, iconv, imap, intl, json, mbstring, mcrypt, mysqlnd, openssl, pcre, PDO MySQL, pdo_pgsql, session, sockets, soap, sodium, spl, standard, tokenizer, xml, zip, zlib

---

### ✅ PHP 5.6

- **Base**: `debian:jessie`
- **Installed Packages**:
  - `php5.6`, `php5.6-cli`, `php5.6-mysql`, `php5.6-curl`, `php5.6-gd`, `php5.6-mcrypt`, `php5.6-mbstring`, `composer`
  - Tools: `curl`, `git`, `bash`, `tzdata`, `busybox`, `supervisor`
- **Features**:
  - Composer installation via `install.sh`
  - Custom Supervisor config and clean layers
- **CPU Platform Support**: 
  - `linux/amd64`
  - `linux/arm64`
- **PHP Extensions Installed**:
  - bcmath, calendar, dom, exif, fileinfo, filter, ftp, gd, gethostbyaddr, iconv, imap, intl, json, mbstring, mcrypt, mysqlnd, openssl, pcre, PDO MySQL, PDO PgSQL, session, sockets, soap, sodium, spl, standard, tokenizer, xml, zip, zlib

---

### ✅ PHP 8.2

- **Base**: `debian:bullseye`
- **Installed Packages**:
  - `php8.2`, `php8.2-cli`, `php8.2-common`, `php8.2-mysql`, `php8.2-curl`, `php8.2-gd`, `php8.2-mbstring`, `php8.2-xml`, `php8.2-bcmath`, `php8.2-intl`, `php8.2-soap`
  - Utilities: `composer`, `curl`, `git`, `bash`, `tzdata`, `busybox`, `supervisor`
- **Features**:
  - Advanced PHP configuration
  - Multi-layer optimization
  - Supervisor service control
- **CPU Platform Support**: 
  - `linux/amd64`
  - `linux/arm64`
- **PHP Extensions Installed**:
  - bcmath, calendar, dom, exif, fileinfo, filter, ftp, gd, gethostbyaddr, iconv, imap, intl, json, mbstring, mcrypt, mysqlnd, openssl, pcre, PDO MySQL, PDO PgSQL, session, sockets, soap, sodium, spl, standard, tokenizer, xml, zip, zlib
  - **New Features**: `json_validate` and `readonly classes`

---

### ✅ PHP 8.3

- **Base**: `debian:bullseye`
- **Installed Packages**:
  - Same as PHP 8.2 but updated for `php8.3`
- **Features**:
  - Support for new PHP 8.3 features like `json_validate` and `readonly classes`
  - Clean build stages and reusable scripts
- **CPU Platform Support**: 
  - `linux/amd64`
  - `linux/arm64`
- **PHP Extensions Installed**:
  - bcmath, calendar, dom, exif, fileinfo, filter, ftp, gd, gethostbyaddr, iconv, imap, intl, json, mbstring, pdo_mysql, PDO PgSQL, session, sockets, soap, sodium, spl, standard, tokenizer, xml, zip, zlib
  - **New Features**: `json_validate` and `readonly classes`

---

## 🚀 Usage

To build and run any version:

```bash
docker build -f Dockerfile.8.3 -t cicd-php:8.3 .
docker run --rm -it cicd-php:8.3 php -v
```

### 🔍 Development Timeline (Browsing Timeline)

<div style="text-align: center;">
  <img src="https://miro.com/app/board/o9J_kH-47jg=/b!rT1LWQZ5l2c2Mxk0Y6uF8A/image.png?amp=1" alt="Development Timeline"/>
</div>

The timeline above shows the significant updates and contributions to this project over time. For more detailed information, please refer to the [GitHub contributors](https://github.com/zanjire/php-for-cicd/graphs/contributors).

---

## 🤝 Contribute to This Project
Whether you’re fixing bugs, improving Docker efficiency, or adding support for more PHP versions — we’d love your contributions! You can fork this repo, create a pull request, or start a discussion in Issues.

Feel free to reach out via [YiiMan.ir](https://yiiman.ir) if you have any questions, ideas, or just want to say hi.