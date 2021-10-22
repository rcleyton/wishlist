class User < ApplicationRecord
  has_secure_password
  has_one :favorite
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
    length: { minimum: 6 },
    if: -> { new_record? || !password.nil? }

  def as_json(options={})
    super(
          only: [:id, :name, :email],
          include: { favorite: { only: :product_id } }
         )
  end
  
end
