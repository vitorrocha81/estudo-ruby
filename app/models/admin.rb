class Admin < ActiveRecord::Base

	enum role: [:full_access, :restricted_acess, :bills]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


 def role_type
 	 case self.role
	 	 when "full_access"
	 	 	'Acesso completo'
	 	 when "restricted_acess"
	 	 	'Restrito'
	 	 when "bills"
	 	 	'Financeiro'
 	 end
 end        

end
