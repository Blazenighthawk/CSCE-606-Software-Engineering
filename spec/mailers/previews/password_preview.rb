# Preview all emails at http://localhost:3000/rails/mailers/password
class PasswordPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/password/reset
  def reset
    # assigns a token with a purpose and expiry time
    @token = params[:user].signed_id(purpose: 'password_reset', expires_in: 15.minutes)
    # sends email
    mail to: params[:user].email
  end

end
