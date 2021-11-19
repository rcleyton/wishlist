# Wishlist

Clonar o repositório
```
git clone git@github.com:rcleyton/wishlist.git
```
Acesse o repositório
```
cd wishlist
```
Criando os serviços
```
docker-compose up -d
```
Propagando o banco e executando as migrations
```
docker-compose exec app bundle exec rake db:setup db:migrate
```
Para criar um novo usuário de um POST na rota **/api/v1/users** com os paramêtros:
```
  {
    name: "John Doe",
    email: "john@doe.com",
    password: "12345678",
    password_confirmation: "12345678"
  } 
```
Retorno com status **:created** e **body**:
```
  {
    "name": "John Doe",
    "email": "john@doe.com",
    "favorite": null
  }
```
Para rodar o teste
```
docker-compose exec app rspec ./spec/feature/user_spec.rb
```