class Author
  include Mongoid::Document
  field :title, type: String
  field :name, type: String
  embedded_in :post, inverse_of: :authors
end
