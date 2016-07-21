class Piece < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { large: "600x600>", medium: "300X300", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
