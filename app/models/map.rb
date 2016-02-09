require 'set'

class Map < ActiveRecord::Base
  has_many :tiles, dependent: :destroy
  before_validation :create_code, :generate_tiles, on: :create

  CODE_CHARS = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
  CODE_LENGTH = 4
  MAP_DIM_SIZE = 8

  private

  def create_code
    20.times do
      self.code = generate_code
      return if self.class.where(code: self.code).empty?
    end
    raise "Couldn't find a unique room number :( We're running out of search space, better optimize"
  end

  def generate_tiles
    tiles_attrs = []
    (0...MAP_DIM_SIZE).each do |y|
      (0...MAP_DIM_SIZE).each do |x|
        tiles_attrs << {x_coord: x, y_coord: y, map_id: self.id}
      end
    end
    self.tiles = Tile.create(tiles_attrs)
  end

  def generate_code
    CODE_CHARS.shuffle.take(CODE_LENGTH).join
  end
end
