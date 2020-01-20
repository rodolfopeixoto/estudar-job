class UserWorker
  include Sidekiq::Worker
  sidekiq_options queue: :user


  def perform(params)
    user_creator = PlaceUserCreator.call(params)
    raise user_creator.message unless user_creator.success?
  end
end
