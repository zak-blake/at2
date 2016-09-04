class User < ApplicationRecord
  has_many :albums
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { large: "1485x765>", thumb: "300X300>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
