FROM php:7.4-apache

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update \
  # Composer インストール
  # && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  # && php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  # && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
  # && php -r "unlink('composer-setup.php');" \
  # インストールした Composer のバージョン表示（確認用、省略可）
  # && composer -v | grep "Composer version" \
  # vim （省略可）
  && apt-get install -y vim \
  # unzip コマンド (composer create-project で必要)
  && apt-get install -y unzip \
  # PHP の intl 拡張 (CakePHP 4 で必要)
  && apt-get install -y libicu-dev \
  && docker-php-ext-install intl \
  # PDO MySQL 拡張
  && apt-get install -y libpq-dev \
  && docker-php-ext-install pdo_pgsql \
  # mod_rewrite 有効化
  && a2enmod rewrite
