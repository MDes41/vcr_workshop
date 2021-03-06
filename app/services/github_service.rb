class GithubService
	def initialize(token)
		@token = token
		@conn = Faraday.new(url: "https://api.github.com/" ) do |faraday|
			faraday.adapter Faraday.default_adapter
			faraday.params[:access_token] = token
		end
	end

	def repos
		response = conn.get("/user/repos")
		JSON.parse(response.body, symbolize_names: true)
	end

	private
		attr_reader :token, :conn
end