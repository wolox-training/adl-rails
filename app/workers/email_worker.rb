class EmailWorker
  include Sidekiq::Worker

  def perform(rent_id)
    rent = Rent.find(rent_id)
    I18n.locale = rent.user.locale
    UserMailer.welcome_email(rent).deliver
  end
end
