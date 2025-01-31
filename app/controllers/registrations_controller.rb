class RegistrationsController < Devise::RegistrationsController

    def create
      build_resource(sign_up_params)
      resource.save
      sign_up(resource_name, resource) if resource.persisted?
  
      render json: resource.as_json(root: false, methods: :resume_url).except('updated_at')
    end
end