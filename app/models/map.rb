require 'set'

class Map < ActiveRecord::Base
  has_many :tiles, -> { order 'x_coord ASC, y_coord ASC' }, dependent: :destroy, autosave: true
  validates_associated :tiles
  before_validation :create_code, :generate_tiles, on: :create

  CODE_CHARS = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z).freeze
  CODE_LENGTH = 4
  MAP_DIM_SIZE = 8

  def find_tile_at(x: 0, y: 0)
    tiles.find_by(x_coord: x, y_coord: y)
  end

  private

  def create_code
    20.times do
      self.code = generate_code
      return if self.class.where(code: self.code).empty?
    end
    raise "Couldn't find a unique room number :( We're running out of search space, better optimize"
  end

  def generate_tiles
    (0...MAP_DIM_SIZE).each do |y|
      (0...MAP_DIM_SIZE).each do |x|
        self.tiles.build(x_coord: x, y_coord: y)
      end
    end
  end

  def generate_code
    CODE_CHARS.shuffle.take(CODE_LENGTH).join
  end
end
