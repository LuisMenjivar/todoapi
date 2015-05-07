class Todo < ActiveRecord::Base
  belongs_to :user
  validates :description, length: { minimum: 5 }
  default_scope { order('updated_at ASC') }
end
