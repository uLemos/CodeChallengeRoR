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

Antes de rodar o projeto, você precisará dos seguintes itens instalados:

- [Ruby](https://www.ruby-lang.org/en/documentation/) (versão 3.2.3)
- [Rails](https://rubyonrails.org/) (versão 7.1)
- [PostgreSQL](https://www.postgresql.org/)
- [Yarn](https://yarnpkg.com/)
- [Docker](https://www.docker.com/) (se for usar Docker para desenvolvimento local)

## Como Rodar Localmente

1. **Clone o repositório**:

   ```bash
   git clone https://github.com/uLemos/CodeChallengeRoR.git
   cd CodeChallengeRoR
   ```

Instale as dependências:

Se você está utilizando Docker, você pode rodar os containers com o comando:

```bash
  docker-compose up
```

Se preferir rodar sem Docker, instale as dependências normalmente:

```bash
  gem install bundler
  bundle install
  yarn install
```

Configure o Banco de Dados:

Configure as variáveis de ambiente necessárias (caso use Docker, isso pode já estar configurado). Para configurar localmente:

```bash
  export DATABASE_URL=postgres://username:password@localhost:5432/news_aggregator_development
```
Em seguida, crie e migre o banco de dados:

```bash
  rails db:create
  rails db:migrate
```


Inicie o Servidor:

Para rodar o servidor Rails localmente, use o comando:

```bash
  rails s
```

O aplicativo estará disponível em http://localhost:3000.

Como Configurar as Credenciais

As credenciais (como chaves de API e senhas) são armazenadas no arquivo config/credentials.yml.enc, que é criptografado. Você pode acessar e editar as credenciais com o seguinte comando:

```bash
  EDITOR="vim" rails credentials:edit
```

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

Contribuindo

Sinta-se à vontade para contribuir para o projeto! Se você tiver alguma sugestão ou correção, basta fazer um fork do repositório, criar uma branch com sua alteração, e submeter um pull request.

    Fork o projeto.

    Crie uma nova branch (git checkout -b minha-nova-feature).

    Faça suas alterações e commite (git commit -am 'Adicionando nova feature').

    Push para sua branch (git push origin minha-nova-feature).

    Abra um Pull Request.

Licença

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

Certifique-se de revisar e ajustar conforme necessário.