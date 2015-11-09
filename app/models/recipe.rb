class Recipe < ActiveRecord::Base
	belongs_to :chef
  has_many :likes, dependent: :destroy
  has_many :styles, through: :recipe_styles
  has_many :recipe_styles, dependent: :destroy
  has_many :reviews, through: :recipe_reviews
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients



	validates :name, presence: true, length:{minimum: 6,maximum: 100}
	validates :summary, presence: true, length:{minimum: 6,maximum: 300}
	validates :description, presence: true, length:{minimum: 20,maximum: 500}
    validate :picture_size
   mount_uploader :picture, PictureUploader
   
 def thumbs_up_total
  self.likes.where(like: true).size
  end
  
 def thumbs_down_total
  self.likes.where(like: false).size
  end



  private
  def picture_size
  	if picture.size > 5.megabytes
  		errors.add(:picture, "should be less than 5mbs")
  	end
  end

end
