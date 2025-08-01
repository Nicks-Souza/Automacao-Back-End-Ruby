Dado('que o usuario consulte informacoes de um funcionario') do
@getlist = Employee_Requests.new
@assert = Assertions.new
end

Quando('ele realizar a pesquisa') do
    @list_employees = @getlist.find_employee
end

Entao('uma lista de funcionarios deve retornar') do
 @assert.request_success(@list_employees.code, @list_employees.msg)
end


Dado('que o usuario cadastre um novo funcionario') do
    @create = Employee_Requests.new
    @assert = Assertions.new
end

Quando('ele enviar as informacoes do funcionario') do
   @create_employee = @create.create_employee(DATABASE[:name][:name6], DATABASE[:salary][:salary6], DATABASE[:age][:age6])
    puts @create_employee
end

Entao('esse funcionario sera cadastrado') do
@assert.request_success(@create_employee.code, @create_employee.msg)
expect(@create_employee["status"]).to eql 'success'
expect(@create_employee["message"]).to eql 'Successfully! Record has been added.'
expect(@create_employee['data']["employee_name"]).to eql DATABASE[:name][:name6]
expect(@create_employee['data']["employee_salary"]).to eql (DATABASE[:salary][:salary6])
expect(@create_employee['data']["employee_age"]).to eql (DATABASE[:age][:age6])
end



Dado('que o usuario altere uma informacao de funcionario') do
  @request = Employee_Requests.new
  @assert = Assertions.new
end

Quando('ele enviar as novas informacoes') do
  @update_employee = @request.update_employee(@request.find_employee['data'][0]['id'], 'Alberto', 200, 30)
  puts @update_employee
end

  Entao('as informacoes serao alteradas') do
@assert.request_success(@update_employee.code, @update_employee.msg)
    expect(@update_employee["status"]).to eql 'success'
    expect(@update_employee["message"]).to eql 'Successfully! Record has been updated.' 
    expect(@update_employee['data']["employee_name"]).to eql 'Alberto'
    expect(@update_employee['data']["employee_salary"]).to eql (200)
    expect(@update_employee['data']["employee_age"]).to eql (30)
  end

Dado('que o usuario queira deletar um funcionario') do
 @request = Employee_Requests.new
 @assert = Assertions.new
end

Quando('ele enviar a identificacao unica') do
    @delete_employee = @request.delete_employee(@request.find_employee['data'][0]['id'])
end

Entao('esse funcionario sera deletado do sistema') do
    @assert.request_success(@delete_employee.code, @delete_employee.msg)
    expect(@delete_employee["status"]).to eql 'success'
    expect(@delete_employee["data"]).to eql '1'
    expect(@delete_employee["message"]).to eql 'Successfully! Record has been deleted'
end