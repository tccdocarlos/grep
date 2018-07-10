FactoryBot.define do
  factory :bill_type do
    name "aluguel"
    description "uma conta que nao queriamos pagar"
    maturity Date.today + 2
    value 20
    house
    responsible
  end
end
