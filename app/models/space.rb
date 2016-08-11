class Space
  include DataMapper::Resource

  property :id, Serial
  property :space_name, String
  property :description, String
  property :price, Float
  property :date_from, String

  belongs_to :user

end
