class RecipientsController < ApplicationController

  def index
  end

  def new
    user = User.find(session[:user_id])
    @recipient = user.recipients.new
    # @user.recipients << @recipient
  end

  def create
    @user = User.find(session[:user_id])
    @recipient = Recipient.create(recipient_params)
    @user.recipients << @recipient
    redirect_to @user
  end

  def recipient_params
    params.require(:recipient).permit(:name, :email)
  end
end
