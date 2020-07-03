class Api::V1::BaseApiController < ApplicationController
  # current_user のダミーコード
  def current_user
    @current_user ||= User.first
  end
end
