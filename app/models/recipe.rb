class Recipe < ActiveRecord::Base
	belongs_to :chef
	validates :name, presence: true, length:{minimum: 6,maximum: 100}
	validates :summary, presence: true, length:{minimum: 6,maximum: 300}
	validates :description, presence: true, length:{minimum: 20,maximum: 500}
    validate :picture_size
   mount_uploader :picture, PictureUploader
   

  private
  def picture_size
  	if picture.size > 5.megabytes
  		errors.add(:picture, "should be less than 5mbs")
  	end
  end

end
