class Tile < ActiveRecord::Base
  belongs_to :map
  validates :map, presence: true
  validates :x_coord, presence: true
  validates :y_coord, presence: true

  def coords_string
    sprintf("%02d%02d", x_coord, y_coord)
  end
end
