class Tile < ActiveRecord::Base
  belongs_to :map
  validates :x_coord, presence: true
  validates :y_coord, presence: true

  before_validation :generate_data, on: :create

  TILE_DATA = [
    {"biome":"desert", "loot":"2 gold", "encounter":"3 trolls"},
    {"biome": "mountain", "loot": "soykaf", "encounter": "2 raiders"},
    {"biome": "high plains", "loot": "scrap", "encounter": "2 raiders"},
    {"biome": "high plains", "loot": "2 ammo clips", "encounter": "3 ghouls"},
    {"biome": "high plains", "loot": "a tent", "encounter": "a glowing one and 3 ghouls"}
  ]

  # TODO: move into a presenter, maybe?
  def coords_string
    "%02d%02d" % [x_coord, y_coord]
  end

  def generate_data
    self.data = {}
  end

  def reroll(node)
    self.data = TILE_DATA.sample
  end
end
