Feature: Busca de reservas
  As a Usuario do sistema
  I want to buscar uma reserva pelo CPF do cliente
  So that eu visualize as reservas entre as datas que eu desejar

  Scenario: Buscar reservas com CPF que tem reserva
    Given eu estou na tela de busca de reservas
    And existe um quarto cadastrado com numero 1
    And e existe reservas cadastradas para um cliente com CPF "03135892751"
    When eu informo o CPF "03135892751" e clico em Buscar
    Then o sistema deve retornar as reservas encontradas na lista de resultados

  Scenario: Buscar reservas com CPF de um cliente que nao existe
    Given nao existe um cliente cadastrado com CPF "03135892751"
    And eu estou na tela de busca de reservas
    When eu informo o CPF "03135892751" e clico em Buscar
    Then o sistema deve mostrar que nenhuma reserva encontrada para o CPF

  Scenario: Buscar reservas com um CPF invalido
    Given eu estou na tela de busca de reservas
    When eu informo o CPF "AAAAAAAAAAA" e clico em Buscar
    Then o sistema deve mostrar que nenhuma reserva encontrada para o CPF

  Scenario: Buscar reservas de um cpf e filtrar por data
    Given eu estou na tela de busca de reservas
    And existe um quarto cadastrado com numero 1
    And e existe reservas cadastradas para um cliente com CPF "03135892751"
    When eu informo o CPF "03135892751" e clico em Buscar
    And eu informo a data de incio "01-03-2023" e de fim "01-12-2023" e clico em Filtrar
    Then o sistema deve retornar as reservas encontradas na lista de resultados

  Scenario: Buscar reservas de um cpf com reserva existente mas sem reserva no periodo informado
    Given eu estou na tela de busca de reservas
    And existe um quarto cadastrado com numero 1
    And e existe reservas cadastradas para um cliente com CPF "03135892751" com data de incio "10-01-2023" e de fim "01-01-2023"
    When eu informo o CPF "03135892751" e clico em Buscar
    And eu informo a data de incio "01-03-2023" e de fim "01-12-2023" e clico em Filtrar
    Then o sistema deve mostrar que nenhuma reserva encontrada para o CPF naquele periodo informado




