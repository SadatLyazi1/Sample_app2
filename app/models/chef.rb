class Chef < ActiveRecord::Base
	has_many :recipes
	has_many :reviews, through: :recipe_reviews
	has_many :likes, dependent: :destroy

	#email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+ \z/i
	validates :name, presence: true, length:{minimum: 6,maximum: 100}
	validates :email, presence: true, length:{maximum: 100}, 
	           uniqueness:{case_sensitive: false}

   
	validates :password, presence: true, length:{minimum: 6,maximum: 100}
	has_secure_password
end
