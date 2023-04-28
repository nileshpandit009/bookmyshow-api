class Screen < ApplicationRecord
  has_one :show
  belongs_to :theater
end
