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


Dado('que o usuario cadastre um novo funcionario') do
@post_url = 'https://dummy.restapiexample.com/api/v1/create'
end

Quando('ele enviar as informacoes do funcionario') do
    @create_employee = HTTParty.post(@post_url, :headers => {'Content-Type': 'application/json'}, body: {
     "id": 26,
            "employee_name": "Maravilha",
            "employee_salary": 12600,
            "employee_age": 25,
            "profile_image": ""
}.to_json)

puts @create_employee
end

Entao('esse funcionario sera cadastrado') do
expect(@create_employee.code).to eql (200)
expect(@create_employee.message).to eql 'OK'
expect(@create_employee["status"]).to eql 'success'
expect(@create_employee["message"]).to eql 'Successfully! Record has been added.'
expect(@create_employee.parsed_responde['data']["employee_name"]).to eql 'Maravilha'
expect(@create_employee.parsed_responde['data']["employee_salary"]).to eql (12600)
expect(@create_employee.parsed_responde['data']["employee_age"]).to eql (25)
end