class Genre < ApplicationRecord

  def find_by_name (arg_name)
    Genre.where(["LOWER('name') = ?", arg_name])
  end
end
