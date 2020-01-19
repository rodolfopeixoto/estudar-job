class ReqResClient
  
  attr_reader :params

  URL_BASE = 'https://reqres.in'
  
  def initialize(params)
    @params = params
  end

  def create
    response = connect_api.post('/api/users', params.to_json)
    create_user?(response)
  end

  def create_user?(response)
    return true if response.status.eql? 201
    false
  end

  private

  def connect_api
    ConnectionApi.call(URL_BASE)
  end
end
