class EmailWorker
  include Sidekiq::Worker

  def perform(rent_id)
    rent = Rent.find(rent_id)
    UserMailer.welcome_email(rent).deliver
  end
end
