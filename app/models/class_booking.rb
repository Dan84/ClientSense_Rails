class ClassBooking < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise_class
  validates :user_id, presence: true
  validates :exercise_class_id, presence: true
end
