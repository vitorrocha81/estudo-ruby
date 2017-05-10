class Backoffice::AdminsController < BackofficeController
	before_action :set_admin, only: [:edit, :update, :destroy]

  after_action :verify_authorized, only: [:new, :edit, :destroy]
  after_action :verify_policy_scoped, only: :index
  # enum role: {:full_access, :restrisct_access}

  def index
  	@admins = policy_scope(Admin)
  end

  def new 
  	@admin = Admin.new
    authorize @admin
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
    authorize @admin
  end

  def destroy
    @adm = @admin.email
    @admin.destroy
    redirect_to backoffice_admins_path, notice: " #{@adm} deletado com sucesso"
    authorize @admin
  end

  def update
  	

  	if @admin.update(admin_params)
      AdminMailer.update_email(current_admin, @admin).deliver_now
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

    if password_blank?
      params[:admin].except!(:password, :password_confirmation)
    end 

    if @admin.blank?
      params.require(:admin).permit(:email, :password, :password_confirmation, :name, :role)
    else    
      params.require(:admin).permit(policy(@admin).permited_attributes)
    end
   end

    def password_blank?
      params[:admin][:password].blank? &&
      params[:admin][:password_confirmation].blank?
    end
end

