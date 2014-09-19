class RecipientsController < ApplicationController

  def index
  end

  def new
    user = User.find(session[:user_id])
    @recipient = user.recipients.new
    # @user.recipients << @recipient
  end

  def create
    @recipient = Recipient.create(recipient_params)
  end

  def recipient_params
    params.require(:recipient).permit(:name, :email)
  end
end
