class Chef < ActiveRecord::Base
	has_many :recipes
	validates :name, presence: true, length:{minimum: 6,maximum: 100}
	validates :email, presence: true, length:{minimum: 6,maximum: 100}
	validates :password, presence: true, length:{minimum: 6,maximum: 100}
end
