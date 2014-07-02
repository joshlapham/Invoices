class Invoice < ActiveRecord::Base

  belongs_to :client
  has_many :items

end
