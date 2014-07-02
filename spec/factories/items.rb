# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    description "MyString"
    unit_cost "MyString"
    quantity "MyString"
    discount "MyString"
    invoice_id 1
  end
end
