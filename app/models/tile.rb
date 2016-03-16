class Tile < ActiveRecord::Base
  belongs_to :map
  validates :x_coord, presence: true
  validates :y_coord, presence: true

  before_validation :roll, on: :create

  NEIGHBOR_DELTAS = [[-1, -1],
                     [0, -1],
                     [1, -1],
                     [-1, 0],
                     [1, 0],
                     [-1, 1],
                     [0, 1],
                     [1, 1]].freeze

  # TODO: move into a presenter, maybe?
  def coords_string
    "%02d%02d" % [x_coord, y_coord]
  end

  def tile_icon
    TileData.tile_icon data['biome']
  end

  def neighbors
    # Caching neighbors for now bc tiles can't move
    @cached_neighbors ||= NEIGHBOR_DELTAS.map do |x, y|
      map.find_tile_at(x: x + x_coord, y: y + y_coord)
    end.compact
  end

  def roll(node = '')
    if node.present?
      self.data[node] = TileData.sample(node) if TileData.valid_keys.include?(node)
    else
      self.data = TileData.sample_all
    end
  end
  alias reroll roll
end
