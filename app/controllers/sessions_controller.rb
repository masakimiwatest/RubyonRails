class SessionsController < ApplicationController
  
  def new
  end
  
    def create
      user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          log_in user
          redirect_to user
        else
          msg = "ログインに失敗しました,メールアドレスまたはパスワードが正しくありません"
          msg = msg.gsub(",","<br>")
          flash.now[:danger] = msg.html_safe
          render 'new'
        end
    end
  
    def destroy
      log_out if logged_in?
      redirect_to users_path
    end

end