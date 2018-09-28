class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def welcome_email(rent)
    @rent = rent
    @book = rent.book
    mail(to: rent.user.email, subject: 'Welcome to My Awesome Site') do |format|
      format.html { render 'welcome_email' }
    end
  end
end
