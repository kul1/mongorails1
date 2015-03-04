class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  embeds_many :comments
  field :title, type: String
  field :body, type: String
end
