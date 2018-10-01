class EmailWorker
  include Sidekiq::Worker

  def perform(rent_array)
    I18n.locale = rent_array[1].to_sym
    rent = Rent.find(rent_array[0])
    UserMailer.welcome_email(rent).deliver
  end
end
