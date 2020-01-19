class UserWorker
  include Sidekiq::Worker

  sidekiq_options queue: :user

  def perform(params)
    ReqResClient.new(params).create
  end
end
