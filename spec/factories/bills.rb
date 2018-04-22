FactoryBot.define do
  factory :bill do
    name "aluguel"
    description "uma conta que nao queriamos pagar"
    sporadic false
    maturity Date.today + 2
    active true
    house
    responsible
  end
end