class Piece < ApplicationRecord
  belongs_to :album

  has_attached_file :image, styles: { full_size: "1782x918>", grid_view: "750x450#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
