class ReqResClient
  URL_BASE = 'https://reqres.in'.freeze

  ReqResLogger = Logger.new(Rails.root.join('log', 'req_res_error.log'))
  ReqResLogger.datetime_format = '%Y-%m-%d %H:%M:%S'

  def users(page: '2')
    response = connect_api.get("/api/users?page=#{page}")

    return JSON.parse(response.body) if response.status.eql? 200

    ReqResLogger.error("Get Users: Status: #{response.status} | body: #{response.body}")
  end

  def create(params)
    response = connect_api.post('/api/users', params.to_json)
    created?(response)
  end

  def created?(response)
    return true if response.status.eql? 201

    ReqResLogger.error("Create: Status: #{response.status} | body: #{response.body}")
    false
  end

  private

  def connect_api
    ConnectionApi.call(URL_BASE)
  end
end
