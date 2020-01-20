class UserValidator
  include Interactor

  attr_reader :first_name, :last_name, :email

  UserValidatorError = Logger.new(Rails.root.join('log', 'user_validator_error.log'))
  UserValidatorError.datetime_format = '%Y-%m-%d %H:%M:%S'

  INITIAL_PAGE = 2

  def call
    @first_name = context.first_name
    @last_name = context.last_name
    @email = context.email
    if invalid?
      context.fail!(message: 'There is already a registered user')
    else
      context.success?
    end
  end

  def invalid?
    field_empty? || user_present?
  end

  private

  def user_present?
    users_interactor = UsersList.call
    total_pages = users_interactor.total_pages
    users = users_interactor.get | search_all_users(total_pages)
    users.flatten.map { |user| user_field_eql?(user) }.include?(true)
  end

  def user_field_eql?(user)
    email_eql?(user) || (first_name_eql?(user) && last_name_eql?(user))
  end

  def search_all_users(total_pages)
    (INITIAL_PAGE..total_pages).collect do |page|
      UsersList.call(current_page: page).get
    end
  end

  def field_empty?
    first_name.blank? || last_name.blank? || email.blank?
  end

  def email_eql?(user)
    user['email'].parameterize.eql? email.parameterize
  end

  def first_name_eql?(user)
    user['first_name'].parameterize.eql? first_name.parameterize
  end

  def last_name_eql?(user)
    user['last_name'].parameterize.eql? last_name.parameterize
  end
end
