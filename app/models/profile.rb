class Profile < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_attached_file :avatar, styles: { large: "600x600", medium: "300x300", thumb: "50x50#"},
  							:default_url => ":style/missing_avatar.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
