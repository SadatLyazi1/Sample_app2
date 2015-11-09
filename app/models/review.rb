class Review < ActiveRecord::Base
  belongs_to :chef
  has_many :recipe_reviews
  belongs_to :review, through: :recipe_reviews

  validates :name, presence: true, length:{minimum: 6,maximum: 100}
  validates :body, presence: true, length:{minimum: 10,maximum: 500}
	
end
