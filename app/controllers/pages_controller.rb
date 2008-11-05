class PagesController < ApplicationController
  def faq
  end

  def contact
  end
  
  def send_mail
      UserMailer.deliver_contactnow(params[:email])
      flash[:notice] = "Thanks for contacting us!"
      # render the default action
      redirect_to '/'
  end

  def feedback
  end

end
