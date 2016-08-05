class Piece < ApplicationRecord
  belongs_to :album

  has_attached_file :image, styles: { large: "600x600", medium: "300X300", thumb: "100x100", grid_view: "750x450#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
