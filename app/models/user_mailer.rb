class UserMailer < ActionMailer::Base
  

  def contactnow(email_params, sent_at = Time.now)
      subject "[wedidit.us] contact - " << email_params[:subject]
      recipients "wedidit@mugasha.com"
      from email_params[:address]
      sent_on sent_at
      body :message => email_params[:body], :sender_name => email_params[:name]
  end

end
