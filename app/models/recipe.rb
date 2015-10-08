class Recipe < ActiveRecord::Base
	belongs_to :chef
	validates :name, presence: true, length:{minimum: 6,maximum: 100}
	validates :summary, presence: true, length:{minimum: 20,maximum: 300}
	validates :description, presence: true, length:{minimum: 20,maximum: 500}
end
