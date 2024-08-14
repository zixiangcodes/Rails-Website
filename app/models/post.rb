class Post < ApplicationRecord
    has_one_attached :image
    
    validate :acceptable_image
  
    private
  
    def acceptable_image
      return unless image.attached?
  
      # Change this to your desired maximum file size (e.g., 5 megabytes)
      unless image.blob.byte_size <= 5.megabytes
        errors.add(:image, "is too big (maximum is 5 MB)")
      end
  
      acceptable_types = ["image/jpeg", "image/png"]
      unless acceptable_types.include?(image.content_type)
        errors.add(:image, "must be a JPEG or PNG")
      end
    end
  end