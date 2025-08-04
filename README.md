# News Aggregator App

Este é um agregador de notícias desenvolvido com Ruby on Rails, onde os usuários podem pesquisar artigos, salvar os que desejam ler mais tarde e visualizar suas listas de leitura. O aplicativo utiliza APIs públicas para recuperar as notícias e um sistema de autenticação baseado em Devise para gerenciar os usuários.

## Funcionalidades

- **Autenticação de Usuário**: Os usuários podem se cadastrar, fazer login e logout.
- **Busca de Notícias**: Os usuários podem buscar por artigos de notícias usando uma palavra-chave através de uma API externa (como NewsAPI).
- **Lista de Leitura**: Os usuários podem salvar artigos para ler depois e visualizar sua lista de artigos salvos.
- **Frontend Simples**: Utiliza Tailwind CSS para estilização e uma interface limpa e responsiva.
- **Deploy no Render**: A aplicação está configurada para ser hospedada no Render.

## Tecnologias Utilizadas

- **Ruby on Rails**: Framework web utilizado para desenvolver a aplicação.
- **PostgreSQL**: Banco de dados relacional utilizado para armazenar dados.
- **Devise**: Gem para autenticação de usuários.
- **Tailwind CSS**: Framework CSS para design responsivo e simples.
- **NewsAPI**: API pública para buscar artigos de notícias.
- **Render**: Plataforma para hospedagem e deploy da aplicação.

## Pré-requisitos

**Antes de rodar o projeto, você precisará dos seguintes itens instalados:**

- [Ruby](https://www.ruby-lang.org/en/documentation/) (versão 3.2.3)
- [Rails](https://rubyonrails.org/) (versão 7.1)
- [PostgreSQL](https://www.postgresql.org/)
- [Yarn](https://yarnpkg.com/)
- [Docker](https://www.docker.com/) (se for usar Docker para desenvolvimento local)

## Como Configurar o Arquivo .env

- Crie um arquivo `.env` na raiz do projeto (se ele ainda não existir).
- Preencha as variáveis de ambiente com os valores apropriados, conforme o exemplo abaixo:

```bash
POSTGRES_USER=user
POSTGRES_PASSWORD=password
POSTGRES_DB=news_aggregator_development
POSTGRES_TEST_DB=news_aggregator_test
NEWS_API_KEY=83dec482cba044c3955096e7ab36ac63
```
## Caso necessário acesse o NewsAPI

https://newsapi.org/

Se for necessário, adquira uma key e substitua a NEWS_API_KEY acima.
## Instalar o Ruby (versão 3.2.3)

O Ruby é a linguagem utilizada pelo Rails, e é essencial para rodar a aplicação.
### Windows:

- 1 Acesse o RubyInstaller.

- 2 Baixe a versão Ruby+Devkit 3.2.3.

- 3 Execute o instalador e siga as instruções.

- 4 Após a instalação, abra o terminal e verifique a versão do Ruby:

```bash
ruby -v
```

**A saída deve ser:**

```bash
ruby 3.2.3p0 (2023-03-30 revision 76b17f3c78) [x64-mingw32]
```

### macOS:

- 1 Abra o terminal e instale o Homebrew, se ainda não tiver:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- 2 Instale o Ruby 3.2.3 com Homebrew:

```bash
brew install ruby@3.2
```

- 3 Verifique a instalação do Ruby:

```bash
    ruby -v
```

### Linux (Ubuntu/Debian):

- 1 Execute o seguinte comando para instalar o Ruby:

```bash
sudo apt update
sudo apt install ruby-full
```

- 2 Verifique a versão do Ruby:

```bash
    ruby -v
```

## Instalar o Rails (versão 7.1)

O Rails é o framework utilizado para a aplicação. Você precisa instalar a versão 7.1.

- 1 Instale o Rails com o Ruby:

```bash
gem install rails -v 7.1
```

- 2 Verifique a instalação do Rails:

```bash
rails -v
```

**A saída deve ser:**

```bash
    Rails 7.1.x
```

## Instalar o PostgreSQL (versão 15)

O PostgreSQL é o banco de dados utilizado pela aplicação. Precisamos da versão 15.
### Windows:

- 1 Baixe o instalador do PostgreSQL aqui.

- 2 Execute o instalador e siga as instruções.

- 3 Durante a instalação, anote a senha configurada para o superusuário postgres.

### macOS (com Homebrew):

- 1 Instale o PostgreSQL:

```bash
brew install postgresql@15
```

- 2 Verifique a versão:

```bash
psql --version
```

**A saída deve ser algo como:**

```bash
    psql (PostgreSQL) 15.x
```

### Linux (Ubuntu/Debian):

- 1 Instale o PostgreSQL versão 15:

```bash
sudo apt update
sudo apt install postgresql-15
```

- 2 Verifique a versão:

```bash
    psql --version
```

## Instalar o Yarn (versão 1.22.x)

O Yarn é o gerenciador de pacotes JavaScript necessário para o gerenciamento de dependências do frontend.
### Windows:

- 1 Baixe o Yarn aqui.

- 2 Siga as instruções do instalador.

### macOS (com Homebrew):

- 1 Instale o Yarn:

```bash
brew install yarn
```

- 2 Verifique a versão:

```bash
    yarn -v
```

### Linux (Ubuntu/Debian):

- 1 Instale o Yarn:

```bash
sudo apt update
sudo apt install yarn
```

- 2 Verifique a versão:

```bash
    yarn -v
```

## Instalar o Docker (opcional, mas recomendado)

O Docker é uma ótima maneira de rodar o projeto em um ambiente isolado e garantir que todos os desenvolvedores tenham a mesma configuração.

- 1 Baixe o Docker Desktop para Windows ou macOS aqui.

- 2 No Linux, siga as instruções de instalação aqui.

- 3 Verifique a instalação do Docker:

```bash
    docker --version
    docker-compose --version
```

## Clonar o Repositório

Agora, que todas as dependências estão instaladas, clone o repositório do projeto:

```bash
git clone https://github.com/uLemos/CodeChallengeRoR.git
cd CodeChallengeRoR
```

### Após clonar o repositório, você pode rodar o script `setup.sh` para garantir que todas as permissões e configurações estejam corretas. Isso garante que a aplicação tenha permissão para criar arquivos temporários necessários para o servidor Rails.

**Rode o script de configuração:**

```bash
./configure_permissions.sh
```

**Rode o script de compilação de assets:**

```bash
./setup.sh
```

## Configuração do Docker (opcional)

Se você decidir usar Docker, basta rodar o comando abaixo para criar os containers necessários:

```bash
docker-compose up
```

Esse comando irá configurar automaticamente o banco de dados e rodar a aplicação. A aplicação estará acessível em http://localhost:3000.
## Configuração Manual sem Docker

Caso prefira rodar a aplicação localmente sem Docker:

    Instalar as dependências com Bundler:

    No diretório do projeto, instale as dependências do Ruby com:

```bash
bundle install
```

Instalar as dependências do frontend com Yarn:

```bash
yarn install
```

Configurar o banco de dados:

Crie o banco de dados e rode as migrações:

```bash
rails db:create
rails db:migrate
```

Iniciar o Servidor:

Para rodar a aplicação localmente, use o comando:

```bash
    rails s
```

### A aplicação estará acessível em http://localhost:3000.


### **4. Adicionar ao `.gitignore`**

### Certifique-se de que a pasta **`tmp`** e **`server.pid`** estão no **`.gitignore`** para garantir que as variáveis específicas do ambiente local não sejam versionadas e enviadas para o repositório:

```bash
# .gitignore
/tmp
/tmp/*
/tmp/pids/*
```

## Configuração de Credenciais

As credenciais (como chaves de API e senhas) são armazenadas no arquivo config/credentials.yml.enc, que é criptografado. Para editar as credenciais, use o seguinte comando:

```bash
EDITOR="vim" rails credentials:edit
```

Lembre-se de que a chave mestra master.key deve ser mantida em segredo. Você pode configurá-la como uma variável de ambiente no seu ambiente de produção, como no Render.

Lembre-se de que a chave mestra master.key deve ser mantida em segredo. Você pode configurá-la como uma variável de ambiente em seu ambiente de produção, como no Render.
Deploy

O aplicativo está configurado para deploy automático no Render. Ele utiliza o Docker para a construção da imagem e o GitHub Actions para os processos de CI/CD. Para configurar o deploy:

    Certifique-se de que as credenciais no Render estão configuradas corretamente.

    O Render usará o Dockerfile localizado na raiz do projeto para construir a imagem.

    Ao fazer push para a branch main ou dev, o Render irá automaticamente iniciar o processo de deploy e migrar o banco de dados.

Testes

A aplicação usa RSpec para testes automatizados. Para rodar os testes, use o seguinte comando:

```bash
  bundle exec rspec
```

## Contribuindo

Sinta-se à vontade para contribuir para o projeto! Se você tiver alguma sugestão ou correção, basta fazer um fork do repositório, criar uma branch com sua alteração, e submeter um pull request.

    Fork o projeto.

    Crie uma nova branch (git checkout -b minha-nova-feature).

    Faça suas alterações e commite (git commit -am 'Adicionando nova feature').

    Push para sua branch (git push origin minha-nova-feature).

    Abra um Pull Request.

## Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais informações.

Obrigado por testar o projeto! Se tiver qualquer dúvida, sinta-se à vontade para abrir uma issue ou enviar uma mensagem. 😊


### Explicação do conteúdo:

- **Descrição do projeto**: A primeira parte do `README` descreve brevemente o que a aplicação faz.
- **Tecnologias**: Aqui são listadas as tecnologias utilizadas, como Ruby on Rails, PostgreSQL, Devise, etc.
- **Pré-requisitos**: Especifica as ferramentas que precisam estar instaladas para rodar o projeto.
- **Como rodar localmente**: Passo a passo para rodar a aplicação em ambiente de desenvolvimento.
- **Configuração de credenciais**: Como acessar e editar as credenciais com `rails credentials:edit`.
- **Deploy**: Instruções sobre como o deploy é feito, no caso usando o Render.
- **Testes**: Como rodar os testes automatizados usando RSpec.
- **Contribuindo**: Instruções sobre como contribuir para o projeto.
- **Licença**: Detalhes sobre a licença do projeto (MIT).

**Certifique-se de revisar e ajustar conforme necessário.**
