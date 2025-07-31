# language: pt

Funcionalidade: Pesquisar funcionários
 Para averiguar informacoes
 O usuário do sistema
 Deseja poder consultar informacoes dos funcionários

Cenario: Buscar informacoes de funcionario
 Dado que o usuario consulte informacoes de um funcionario
 Quando ele realizar a pesquisa
 Entao uma lista de funcionarios deve retornar
   
@cenario_dois
Cenario: Cadastrar funcionario
 Dado que o usuario cadastre um novo funcionario
 Quando ele enviar as informacoes do funcionario
 Entao esse funcionario sera cadastrado

@cenario_tres
Cenario: Alterar informacoes cadastrais
Dado que o usuario altere uma informacao de funcionario
Quando ele enviar as novas informacoes
Entao as informacoes serao alteradas