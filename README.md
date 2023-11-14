# Target App - Avaliação

Este é um projeto desenvolvido como um teste para a empresa Target avaliar as competências de desenvolvimento com o framework Fluter.

### Para fazer o login use:

Usuário: target

Senha: 123456


![target_app](https://github.com/CheyenneSJ/target_challenge/assets/103771613/3d5e5092-cb17-455a-9f2c-3cf0a6008e5d)


# Objetivo:

O objetivo dessse desafio é criar uma aplicação que tenha uma tela de login, com autenticação de usuário e senha, navegando para a tela de captura de informações.
As infomações digitadas pelo usuário em um card, devem ser salvas, editadas e ter a opcão de excluir.Essas informações não podem ser perdidas ao fechar a aplicação.

## Instruções de execução:

Esse aplicativo foi criado usando o Flutter versão 3.13.9 Para executá-lo, você precisa ter o Flutter versão 3.0.0 ou superior e o dart versão 3.0.6 ou superior instalados. Clone esse repósitorio em sua máquina local. Certifique-se de ter o Flutter SDK instalado em sua máquina.

## Abrir o projeto e executar o comando:

flutter pub get

O MobX gera arquivos: arquivo.g.dart

Em caso de falta desses arquivos será necessário executar o seguinte comando no terminal:

dart run build_runner build

### Rodar aplicativo como usuário: 
Caso queira testar como usuário final ou QA, baixe e instale o arquivo abaixo em um dispositivo android.

Baixar o arquivo - https://drive.google.com/file/d/1ECrjxGW-tRe5MpHfzM4bhENO6m_noHME/view?usp=sharing

## Características Implementadas:

### MobX: 
Foi utilizado para o gerenciamento de estado e atualização da interface do usuário.

### Get It:
Biblioteca para injeção de dependências, para organizar e acessar serviços e instâncias de forma global em toda a aplicação.

### Shared Preferences:
Biblioteca para Flutter que facilita o armazenamento persistente de pequenos dados chave-valor no dispositivo. É usada para armazenar configurações do aplicativo e outras informações leves.

### ValidatorLess:
Biblioteca para validação de formulários em Flutter. Ela permite definir validadores de forma concisa e fácil, simplificando a validação de entrada do usuário em formulários.
