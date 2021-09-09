class PlatformController < ApplicationController
  before_action :authenticate_host!
  layout 'platform'
end
