class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  embeds_many :comments
  embeds_many :authors
  field :title, type: String
  field :body, type: String
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :authors
end
