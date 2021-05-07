class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :publisher_id, :description, :trailer
end
