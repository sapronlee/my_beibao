# coding : utf-8
class Admins::RegistrationsController < Devise::RegistrationsController
  # 模版
  layout 'admin'
  
  def update
    if params[resource_name][:password].blank?
      params[resource_name].delete(:password) 
      params[resource_name].delete(:password_confirmation)
    end
    
    if resource.update_attributes(params[resource_name])
      set_flash_message :notice, :updated
      sign_in resource_name, resource, :bypass => true
      redirect_to after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      render_with_scope :edit
    end
  end
end
