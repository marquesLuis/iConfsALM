module SingupHelper
  def resource_name
    :registry
  end

  def resource
    @resource ||= Registry.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:registry]
  end
end
