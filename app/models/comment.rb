class Comment < ActiveRecord::Base
  belongs_to :article

  validates_presence_of :author_name, :email, :content, message: "Required"
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
