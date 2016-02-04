require 'set'

class Map < ActiveRecord::Base
  before_validation :create_code, on: :create

  CODE_CHARS = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
  CODE_LENGTH = 4

  private

  def create_code
    20.times do
      self.code = generate_code
      return if self.class.where(code: self.code).empty?
    end
    raise "Couldn't find a unique room number :( We're running out of search space, better optimize"
  end

  def generate_code
    CODE_CHARS.shuffle.take(CODE_LENGTH).join
  end
end
