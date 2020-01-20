class UserCreator
  include Interactor

  def call
    client = ReqResClient.new
    client.create(
      {
        first_name: context.first_name,
        last_name: context.last_name,
        email: context.email
      }
    )
    context.success?
  end
end
