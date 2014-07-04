class Invoice < ActiveRecord::Base

  belongs_to :client
  has_many :items, :dependent => :destroy

  accepts_nested_attributes_for :items, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true

end
