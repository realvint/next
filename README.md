# NEXT.REMOSOFT.RU

CRM система на Ruby on Rails

## В проекте используется:
* Ruby 3.2.2
* Rails 7.0.4
* PostgreSQL 14.6
* Redis
* Node JS 16
* Yarn 1.22

## Проект запускается на поддомене!
### Внесите запись в `/etc/hosts` на локальной машине
```
127.0.0.1 next.remosoft.local
```

## Запуск проекта по классике
1. Настроить локальное окружение (Ruby etc.)
2. Скачать или склонировать репозиторий
3. Запустить bundler и yarn для установки нужных гемов и зависимостей

```bash
$ bundle install
$ yarn
```
4. Создаём `.env` файл по примеру `.env.example`
```bash
$ cp .env.example .env
```
При необходимости запустить локально PostgreSQL и Redis можно используя [Докер](https://docker.com)

Команды `docker` можно использовать без `sudo`

Для этого необходимо добавить пользователя в группу `docker`
```sh
$ sudo usermod -aG docker username
```
Убедитесь, что вы используете [Docker Compose V2](https://docs.docker.com/compose/#compose-v2-and-the-new-docker-compose-command)
```
% docker compose version
Docker Compose version v2.3.3
```

(`service.yml` настроен для запуска PostgreSQL)
```bash
$ docker compose -f services.yml up -d
```
5. Создать и настроить базу данных для проекта
```bash
$ rails db:prepare
```
6. Запустить проект
```bash
$ bin/dev
```

### Проект доступен по ссылке http://next.remosoft.local:3000/