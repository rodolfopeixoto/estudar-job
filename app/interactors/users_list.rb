class UsersList

  include Interactor

  CURRENT_PAGE = '1'

  UserList = Logger.new(Rails.root.join('log', 'user_list.log'))
  UserList.datetime_format = '%Y-%m-%d %H:%M:%S'

  def call
    current_page = context.current_page || CURRENT_PAGE
    req_res_client = ReqResClient.new
    users = req_res_client.users(page: current_page)
    if users.present?
      context.get = users['data']
      context.page = users['page']
      context.per_page = users['per_page']
      context.total_pages = users['total_pages']
      context.total = users['total']
      context.success?
    else
      context.fail!(message: 'There are no users in this list')
      UserList.error('Message: There are no users in this list')
    end
  end
end
