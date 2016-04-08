class TileData
  STATIC = {
    'biome' => [
      'desert',
      'mountain',
      'high plains'
    ],

    'loot' => [
      '2 gold',
      'soykaf',
      'scrap',
      '2 ammo clips',
      'a tent'
    ],

    'encounter' => [
      '3 trolls',
      '2 raiders',
      '2 raiders',
      '3 ghouls',
      'a glowing one and 3 ghouls'
    ]
  }

  ICON = {
    'desert' => 'tile-icons/cactus.svg',
    'mountain' => 'tile-icons/mountain-cave.svg',
    'high plains' => 'tile-icons/grass.svg'
  }


  def self.valid_keys
    STATIC.keys
  end

  def self.sample(key)
    STATIC[key].sample
  end

  def self.sample_all
    Hash[
      STATIC.map do |k, v|
        [k, v.sample]
      end
    ]
  end

  def self.tile_icon(key)
    ICON[key]
  end

end
