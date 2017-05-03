class Admin < ActiveRecord::Base

	enum role: [:full_access, :restricted_acess, :bills]

	scope :with_full_access, -> { where(role: 'full_access' )}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
