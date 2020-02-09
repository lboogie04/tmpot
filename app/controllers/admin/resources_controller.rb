class Admin::ResourcesController < Admin::AdminController

  def index
    @resources = Resource.all
  end

  def create
    resource = Resource.create! resource_params
    # resource.file.attach(params[:resource][:file])
    redirect_to admin_resource_url(resource.id)
  end

  def show
    @resource = Resource.find(params[:id])
  end

  private 

  def resource_params
    params.permit(:name, file: [])
  end

end
