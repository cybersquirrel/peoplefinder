module Admin
  class PasswordResetsController < AdminController
    skip_before_action :ensure_administrator

    def new
    end

    def create
      @password_reset = PasswordReset.new(email: params[:email])
      if @password_reset.save
        AdminUserMailer.password_reset(@password_reset).deliver
        redirect_to new_login_path, notice: 'Password reset link sent'
      else
        render :new
      end
    end
  end
end