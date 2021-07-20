class Item < ApplicationRecord
  belongs_to :collection
  has_many :transactions

  # validates :name, presence: true, uniqueness: true
  # validates :species, presence: true, inclusion: { in: %w(normal, fire, water, grass, flying, fighting, poison, electric, ground, rock, psychic, ice, bug, ghost, steel, dragon, dark, fairy)}
  # validates :img_url, presence: true
  # validates :description, presence: true, length: { minimum: 10 }
  # validates :price, presence: true
end
