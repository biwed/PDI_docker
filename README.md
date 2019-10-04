# Docker DPI 7.1, 8.2, 8.3

Docker PDI 7.1, 8.2, 8.3  сделаны для интеграции с git репозитариями:
  - Может подключаться к git репозитарию.
  - Идентифицировать kjb и ktr.
  - Производить из запуск трансформации или задания.
# Сборка docker
```sh
git clone https://github.com/biwed/PDI_docker.git
docker-compose build 
```

# Строка запуска 
```sh
docker run pdi_docker https://github.com/biwed/pdi_trick.git clone_row_on_pdi  clone_row_on_pdi.ktr
```
# Технические характеристики
- openjdk-8-jdk
- PDI CE 8.3.0.0-371, PDI CE 8.2.0.0-342, PDI CE 7.1.0.0-12
