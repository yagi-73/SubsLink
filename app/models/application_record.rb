class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def get_image(weight, height)
    unless self.image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    self.image.variant(resize_to_fill: [weight, height]).processed
  end
end
