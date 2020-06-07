class Admin::ResourcesController < Admin::AdminController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    resource = Resource.create! resource_params
    # resource.file.attach(params[:resource][:file])
    redirect_to admin_resource_url(resource.id)
  end

  def show
  end

  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to reosurces_url, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private 

  def set_resource
    @resource = Resource.find(params[:id])
  end

  def resource_params
    params.permit(:name, file: [])
  end

end
