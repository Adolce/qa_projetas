# encoding utf-8
# language: en

Feature: Automação Teste Back-End

@success
Scenario: Get CEP valido

When client requests GET /addresses
Then the response should be JSON:
""[
  {"cep": "0436806",
  "tipoDeLogradouro":"Rua",
  "logradouro":"Doutor Djalma Pinheiro Franco",
  "bairro":"Vila Santa Catarina",
  "cidade":"São Paulo",
  "estado":"SP"}
]
""



@fail
Scenario: Get CEP invalido
When client requests GET /noaddresses
Then the response should be XML:
""[
  <Error>
      <Message>Endereço não encontrado!</Message>
  </Error>
]
""
|noaddresses| addresses|
|01111000   | 04368006 |
|00011011   | 69082700 |
