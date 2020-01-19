class UserCreator
  include Interactor

  def call
    params = context.params
    first_name = params[:first_name]
    last_name = params[:last_name]
    return false if first_name.blank? || last_name.blank?
    UserWorker.perform_async(params)
    true
  end
end
