# Smart Bit

> Sistema de gestão de acadêmias 

## Pré-requisitos

1. [Git](https://git-scm.com/) `git version 2.34.1`
2. [Nodejs](https://nodejs.org/en/) `v20.14.0`
   *    NPM `10.8.1`
   *    Yarn `1.22.22` (para habilitar ele no `corepack enable`)
3. [Python](https://www.python.org/) `Python 3.10.12`
4. [Robot Framework](https://robotframework.org/) `Robot Framework 7.0 (Python 3.10.12 on linux)`
5. [Library Browser](https://github.com/MarketSquare/robotframework-browser)
6. [Docker](https://www.docker.com/) `version 24.0.5, build 24.0.5-0ubuntu1~22.04.1`

## Configurações iniciais

1. Primeiro devemos criar o ambiente virtual:

```bash
# Linux
python3 -m venv venv

# Windows
python -m venv venv  
```

2. Após a criação do venv vamos ativa-lo:

```bash
# Linux
source venv/bin/activate

# Windows
venv\Scripts\Activate
```

> OBS.: Se o comando `venv\Scripts\Activate` não funcionar no Windows, usar o comando `.\venv\Scripts\activate` Caso algum comando retorne um erro de permissão execute o código e tente novamente: `Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned`

## Configura do Database 

Criar um arquivo na raiz do projeto `docker-compose.yaml` com o código:

```yaml
version: '3'

services:
  db:
    image: postgres
    environment:
      POSTGRES_PASSWORD: "QAx@123"
    ports:
      - "5432:5432"
    networks:
      - smartbit-network
      
  pgadmin:
    image: dpage/pgadmin4
    environment:
      PGADMIN_DEFAULT_EMAIL: "admin@smartbit.com"
      PGADMIN_DEFAULT_PASSWORD: "QAx@123"
    ports:
      - "15432:80"
    depends_on:
      - db
    networks:
      - smartbit-network

networks: 
  smartbit-network:
```

Depois executar o comando

```bash
docker-compose up -d
```

Configurando corretamente no Portal do AdminPostgres, no terminal da API executar o comando:

```bash
./setup.sh
```

> Esse comando irá realizar a população inicial do banco de dodos