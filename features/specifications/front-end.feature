# encoding utf-8
# language: en

Feature: Automação Teste Front-End

@Scenario: Pagina Inicial para login valido

Given que acesso a url de login
When preencho os campos obrigatorios de usuario e senha
And clico no botao login
Then sou redirecionada para pagina de area segura
When eu clico no botao logout
Then eu devo ser desconectada e redirecionada a pagina de logout


@Scenario: Pagina Inicial para login invalido

Given que acesso a url de login
When preencho os campos obrigatorios de usuario e senha invalidos
And clico no botao login
Then nao sou redirecionada para proxima pagina e vejo a mensagem de erro

