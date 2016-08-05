class Album < ApplicationRecord
  belongs_to :user
  has_many :pieces

  has_attached_file :image, styles: { large: "600x600>", medium: "300X300", show_album: "700x300#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
