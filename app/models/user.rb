class User < ApplicationRecord

  #atachar uma imagem de perfil
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # retirar a herança de colunas para poder nomear uma coluna como type
  self.inheritance_column = nil
end
