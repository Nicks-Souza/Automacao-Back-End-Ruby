Dado('que o usuario consulte informacoes de um funcionario') do
@get_url = 'https://dummy.restapiexample.com/api/v1/employees'
end

Quando('ele realizar a pesquisa') do
 @list_employees = HTTParty.get(@get_url)
end

Entao('uma lista de funcionarios deve retornar') do
 expect(@list_employees.code).to eql 200
 expect(@list_employees.message).to eql 'OK'
end
