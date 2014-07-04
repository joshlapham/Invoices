class Invoice < ActiveRecord::Base

  belongs_to :client
  has_many :items, :dependent => :destroy

  accepts_nested_attributes_for :items, allow_destroy: true

  # def self.build
  #   invoice = self.new
  #   invoice.items.build
  # end

end
