class Backoffice::AdminsController < BackofficeController
	before_action :set_admin, only: [:edit, :update, :destroy]

  def index
  	@admins = Admin.all
  end

  def new
  	@admin = Admin.new
  end

  def create
  	@admin = Admin.new(admin_params)
  	if @admin.save
  		redirect_to  backoffice_admins_path, notice: "Usuário (#{@admin.email}) criado com sucesso"
  	else
  		render :new
  	end
  end

  def edit
  end

  def destroy
    @adm = @admin.email
    @admin.destroy
    redirect_to backoffice_admins_path, notice: " #{@adm} deletado com sucesso"
  end

  def update
  	passwd = params[:admin][:password]
  	passwd_confirmation = params[:admin][:password_confirmation]

  	if passwd.blank? && passwd_confirmation.blank?
  		params[:admin].delete(:password)
  		params[:admin].delete(:password_confirmation)
  	end	

  	if @admin.update(admin_params)
  		redirect_to  backoffice_admins_path, notice: "Usuário (#{@admin.email}) atualizada com sucesso"
  	else
  		render :edit
  	end
  end

  def set_admin
  	@admin = Admin.find(params[:id])
  end

  	# private methods 
   private

   def admin_params
   		params.require(:admin).permit(:email, :password, :password_confirmation)
   end
end

