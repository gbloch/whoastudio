class Admin < ActiveRecord::Base
  has_many :posts

  devise :database_authenticatable, :recoverable, :registerable, :rememberable, 
         :timeoutable, :validatable

  def active_for_authentication?
    super && approved
  end

  def inactive_message
    if !approved
      :not_approved
    end
  end
end
