class Publisher < ApplicationRecord
  has_many :games

  def search_by_name (arg_name)
    id = Publisher.where(["LOWER('name') = ?", arg_name])
    if id == nil
      return 0
    else
      return id.id
    end
  end

  def oi
    print ("oi")
  end
end
