class Tile < ActiveRecord::Base
  belongs_to :map
  validates :map, presence: true
  validates :x_coord, presence: true
  validates :y_coord, presence: true
end
