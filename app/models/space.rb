class Space
  include DataMapper::Resource

  property :id, Serial
  property :space_name, String
  property :description, String
  property :price, Float
  property :date_from, Date
  property :date_to, Date

  belongs_to :user

end
