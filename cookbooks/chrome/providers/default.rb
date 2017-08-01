def whyrun_supported?
  true
end

use_inline_resources

action :master_preferences do
  flavor = case node['platform']
           when 'windows'
             node['chrome']['master_preferences_windows']
           else
             node['chrome']['master_preferences_linux']
           end

  template flavor do
    source new_resource.template
    local new_resource.local
    cookbook new_resource.cookbook
    variables(
      parameters: new_resource.parameters
    )
  end
end
