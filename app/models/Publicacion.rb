class Publicacion < ApplicationRecord
    has_one_attached :imagen

    validates :titulo, presence: true 
    validates :descripcion, presence: true 
    belongs_to :category
    
    def self.search(query)
        where("titulo LIKE ? OR descripcion LIKE ?", "%#{query}%", "%#{query}%")
    end
end

