module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
#ここでcurrent_userを作る
    self.current_user = user
  end

  def signed_in?
#これは、current_userが作られて無い場合、falseを返す
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
 #この時点で、ユーザはサインインできていて、self.current_userの
 #情報を@current_userにインスタンスしている
  end

  def current_user
#cookies[:remember_token]をチェックして、値があればそれを@current_user
#に入れる
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
