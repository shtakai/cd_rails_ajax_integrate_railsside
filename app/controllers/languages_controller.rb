class LanguagesController < ApplicationController
  # TODO: Use this with ENV['XXXXX']
  @@TARGET_URL = 'http://localhost:3001'

  def index
  end

  def vote
    agent = Mechanize.new
    agent.user_agent = "Mac Safari"
    response = agent.post @@TARGET_URL, { name: params[:name]}
    logger.debug response.body
    render json: response.body
  end
end
