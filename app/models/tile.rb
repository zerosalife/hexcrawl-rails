class Tile < ActiveRecord::Base
  belongs_to :map
  validates :x_coord, presence: true
  validates :y_coord, presence: true

  before_validation :roll, on: :create

  # TODO: move into a presenter, maybe?
  def coords_string
    "%02d%02d" % [x_coord, y_coord]
  end

  def roll(node = "")
    if node.present?
      if TileData.valid_keys.include?(node)
        self.data[node] = TileData.sample(node)
      end
    else
      self.data = TileData.sample_all
    end
  end
  alias_method :reroll, :roll
end
