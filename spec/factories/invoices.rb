# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invoice do
    invoice_number "MyString"
    amount "MyString"
    date_sent "MyString"
    date_due "MyString"
    client_id 1
  end
end
