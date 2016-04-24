class SubscribersController < ApplicationController

  def create
    @subscriber = Subscriber.new(subscriber_params)
    respond_to do |format|
      if @subscriber.save
        flash[:notice] = 'Thank you! You will soon receive an email with our catalogue.'
        format.html { redirect_to root_path}
        format.json { head :no_content }
      else
        flash[:error] = @subscriber.errors.full_messages
        format.html { redirect_to root_path  }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:first_name, :last_name, :phone_number, :email)
  end
end
