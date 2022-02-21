################################################################################
# The Parent Controller for Admin
#
# 19.09.2016  ZT
# 09.11.2016  back-update
# 14.01.2017  Pundit procedure
#             Flash handlig
# 18.08.2017  replace 'before_filter' with 'before_action'
# 27.10.2020  Ancestor Controller changed
# 15.11.2020  No classic autoloader: Zeitwerk only!
# 21.02.2022  Last update
################################################################################
class Admin::BaseController < ActionController::Base
  protect_from_forgery with: :exception

  include Zt    # Zeitwerk
  include Pundit
  include AdminAuthentication

  layout 'admin'

  before_action :set_locale
  before_action :check_login
  before_action :current_user
  after_action  :verify_authorized, except: :index
# after_action  :verify_policy_scoped, only: :index

  # Globally rescue Authorization Errors in a controller
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized  # permission denied

  add_flash_types :success, :info, :warning, :danger

  private

  def user_not_authorized
#   redirect_to(request.referrer || admin_root_path, alert: t('simple_form.alert.access_denied'))
    flash[:alert] = t('simple_form.alert.access_denied')
    redirect_to(request.referrer || admin_root_path)
  end
end
