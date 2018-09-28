class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def welcome_email(rent)
    @rent = rent
    mail(to: 'lala@wolox.com.ar', subject: 'Welcome to My Awesome Site') do |format|
      format.html { render 'welcome_email' }
    end
  end
end
