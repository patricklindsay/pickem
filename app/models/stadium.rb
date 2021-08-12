class Stadium < ApplicationRecord
  self.table_name = "stadiums"

  validates :code, :name, :city, presence: true
end
